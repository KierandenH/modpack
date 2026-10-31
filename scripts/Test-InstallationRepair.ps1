# Uses a small official pinned jar in isolated project fixtures, never an installed profile.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$temp = Join-Path $root ('.tools/repair-test-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $temp | Out-Null
$source = Get-Content (Join-Path $root 'pack/installation-manifest.json') -Raw | ConvertFrom-Json
$entry = $source.files | Where-Object path -eq 'mods/stateobserver-forge-1.20.1-1.4.3.jar'
if (-not $entry) { throw 'Pinned test download is missing from manifest.' }
$manifest = Join-Path $temp 'expected.json'
function Save-Manifest { @{version='repair-test';files=@($entry)} | ConvertTo-Json -Depth 4 | Set-Content $manifest }
function Check([int]$expected, [string]$case) {
    $output = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'pack/Repair-Installation.ps1') -InstancePath $temp -ManifestPath $manifest
    if ($LASTEXITCODE -ne $expected) { throw "$case failed: $output" }
    Write-Output "PASS: $case"
}
Save-Manifest
Check 0 'missing pinned jar downloaded from official CDN, hash verified, READY'
$file = Join-Path $temp $entry.path
$time = (Get-Item $file).LastWriteTimeUtc
Check 0 'complete installation is unchanged'
if ((Get-Content (Join-Path $temp 'installation-repair.log') -Raw) -notmatch 'Nothing needs downloading') { throw 'No-download explanation missing from persistent log' }
if ((Get-Item $file).LastWriteTimeUtc -ne $time) { throw 'Existing verified jar was changed' }
[IO.File]::WriteAllText($file, 'corrupt fixture')
Check 1 'existing incorrect jar refused without replacement'
if ([IO.File]::ReadAllText($file) -ne 'corrupt fixture') { throw 'Existing file was replaced' }
Remove-Item -LiteralPath $file
$entry.sha256 = '0' * 64
Save-Manifest
Check 1 'download with wrong expected hash rejected'
if (Test-Path $file) { throw 'Invalid download installed' }
if (@(Get-ChildItem (Join-Path $temp 'mods') -Filter '*.download').Count) { throw 'Partial download leaked' }
$entry.path = 'mods/../../escape.jar'
Save-Manifest
Check 2 'path traversal rejected before download'
$entry.path = 'mods/safe.jar'; $entry.url = 'https://example.com/file.jar'
Save-Manifest
Check 2 'non-CurseForge URL rejected before download'
$empty = @{version='empty-test';files=@()}
$empty | ConvertTo-Json | Set-Content $manifest
Check 2 'empty mod manifest rejected'
$entry.path = 'mods/local-compat.jar'; $entry.sha256 = '0' * 64
$entry | Add-Member -NotePropertyName bundled -NotePropertyValue $true -Force
Save-Manifest
Check 1 'missing bundled project jar requires restore, never downloaded from an invalid URL'
[IO.File]::WriteAllText((Join-Path $temp $entry.path), 'local fixture')
$entry.sha256 = (Get-FileHash (Join-Path $temp $entry.path) -Algorithm SHA256).Hash
Save-Manifest
Check 0 'bundled project jar verified without a network URL'
