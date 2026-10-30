$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$temp = Join-Path $root ('.tools/readiness-test-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory (Join-Path $temp 'mods') -Force | Out-Null
$file = Join-Path $temp 'mods/[test].jar'
[IO.File]::WriteAllText($file, 'test fixture, not executable')
$manifest = Join-Path $temp 'expected.json'
@{version='test'; files=@(@{path='mods/[test].jar';sha256=(Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash})} | ConvertTo-Json -Depth 4 | Set-Content $manifest
$checker = Join-Path $root 'pack/Verify-Installation.ps1'
function Check-Exit([int]$expected, [string]$case) {
    $output = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $checker -InstancePath $temp -ManifestPath $manifest
    if ($LASTEXITCODE -ne $expected) { throw "$case returned $LASTEXITCODE instead of $expected : $output" }
    Write-Output "PASS: $case"
}
Check-Exit 0 'complete installation, including bracketed filename'
[IO.File]::WriteAllText((Join-Path $temp 'mods/extra.jar'), 'extra')
Check-Exit 1 'extra jar rejected'
Remove-Item -LiteralPath (Join-Path $temp 'mods/extra.jar')
[IO.File]::WriteAllText($file, 'corrupt')
Check-Exit 1 'corrupt/incomplete file rejected'
Remove-Item -LiteralPath $file
Check-Exit 1 'missing download rejected'
@{version='settings-test';files=@();settings=@(@{path='settings.ini';section='search';key='tooltipSearchMode';value='DISABLED'})} | ConvertTo-Json -Depth 5 | Set-Content $manifest
$settingFile = Join-Path $temp 'settings.ini'
Check-Exit 1 'missing required setting rejected'
"[search]`ntooltipSearchMode = DISABLED`notherGeneratedSetting = true" | Set-Content $settingFile
Check-Exit 0 'required setting verified despite generated defaults'
"[search]`ntooltipSearchMode = ENABLED" | Set-Content $settingFile
Check-Exit 1 'changed required setting rejected'
"[other]`ntooltipSearchMode = DISABLED" | Set-Content $settingFile
Check-Exit 1 'matching key in wrong section rejected'
@{version='test';files=@(@{path='../outside.jar';sha256='0'})} | ConvertTo-Json -Depth 4 | Set-Content $manifest
Check-Exit 2 'path traversal rejected'
# Fixtures stay in the ignored cache for inspection; no user files are touched.
