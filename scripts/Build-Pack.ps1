$ErrorActionPreference = 'Stop'
& (Join-Path $PSScriptRoot 'Build-CompatMod.ps1')
& (Join-Path $PSScriptRoot 'Verify-DependencyRanges.ps1')
& (Join-Path $PSScriptRoot 'Verify-Worldgen.ps1')
& (Join-Path $PSScriptRoot 'Build-CompatibilityOverrides.ps1')
& (Join-Path $PSScriptRoot 'Verify-Compatibility.ps1')
& (Join-Path $PSScriptRoot 'Build-InstallationManifest.ps1')
$root = Split-Path $PSScriptRoot -Parent
$localTool = Join-Path $root '.tools/packwiz/packwiz.exe'
$tool = if (Test-Path $localTool) { $localTool } else { (Get-Command packwiz -ErrorAction Stop).Source }
$packText = Get-Content (Join-Path $root 'pack/pack.toml') -Raw
$version = [regex]::Match($packText, '(?m)^version = "([^"]+)"').Groups[1].Value
if ($version -notmatch '^[a-zA-Z0-9._-]+$') { throw 'Invalid pack version' }
$dist = Join-Path $root 'dist'
New-Item -ItemType Directory -Force $dist | Out-Null
$archive = Join-Path $dist "Wild-Realms-$version.zip"
Push-Location (Join-Path $root 'pack')
try {
    & $tool refresh
    if ($LASTEXITCODE -ne 0) { throw 'Index refresh failed' }
    & $tool --cache (Join-Path $root '.tools/cache') curseforge export -o $archive
    if ($LASTEXITCODE -ne 0) { throw 'Export failed' }
} finally { Pop-Location }
$zip = [IO.Compression.ZipFile]::OpenRead($archive)
try {
    $bundled = @($zip.Entries | Where-Object { $_.FullName -match '\.jar$' })
    if ($bundled.Count -ne 1 -or $bundled[0].FullName -ne 'overrides/mods/wildrealms-compat-1.0.0.jar') { throw 'Only the project-owned compatibility jar may be bundled' }
    $entry = $zip.GetEntry('manifest.json')
    if (-not $entry) { throw 'Missing manifest.json' }
    $reader = [IO.StreamReader]::new($entry.Open())
    try { $manifest = $reader.ReadToEnd() | ConvertFrom-Json } finally { $reader.Dispose() }
    $pins = @(Get-ChildItem (Join-Path $root 'pack/mods/*.pw.toml'))
    if ($manifest.files.Count -ne $pins.Count) { throw 'Export count differs from source pins' }
    if (@($manifest.files | Group-Object projectID | Where-Object Count -gt 1).Count) { throw 'Duplicate mod project in archive' }
    foreach ($pin in $pins) {
        $s = Get-Content $pin.FullName -Raw
        $project = [int][regex]::Match($s, '(?m)^project-id = (\d+)').Groups[1].Value
        $file = [int][regex]::Match($s, '(?m)^file-id = (\d+)').Groups[1].Value
        if (-not ($manifest.files | Where-Object { $_.projectID -eq $project -and $_.fileID -eq $file })) { throw "Pin missing from archive: $($pin.Name)" }
    }
    if ($manifest.minecraft.version -ne '1.20.1') { throw 'Wrong Minecraft version' }
    if (-not ($manifest.minecraft.modLoaders | Where-Object id -eq 'forge-47.4.28')) { throw 'Wrong Forge version' }
    if (-not $zip.GetEntry('overrides/kubejs/server_scripts/wild_realms.js')) { throw 'Missing integration override' }
    $overrides = @(Get-ChildItem (Join-Path $root 'pack/kubejs') -File -Recurse)
    $overrides += Get-Item (Join-Path $root 'pack/mods/wildrealms-compat-1.0.0.jar')
    $overrides += @(Get-ChildItem (Join-Path $root 'pack/config') -File -Recurse | Where-Object Name -ne '.gitkeep')
    foreach ($name in @('Verify-Installation.ps1', 'CHECK-INSTALLATION.cmd', 'Repair-Installation.ps1', 'REPAIR-INSTALLATION.cmd', 'Capture-Freeze.ps1', 'CAPTURE-FREEZE.cmd', 'installation-manifest.json')) {
        $overrides += Get-Item (Join-Path $root ('pack/' + $name))
    }
    foreach ($override in $overrides) {
        $relative = [IO.Path]::GetRelativePath((Join-Path $root 'pack'), $override.FullName).Replace('\', '/')
        $entry = $zip.GetEntry('overrides/' + $relative)
        if (-not $entry) { throw "Missing compatibility override: $relative" }
        $stream = $entry.Open()
        $sha = [Security.Cryptography.SHA256]::Create()
        try { $hash = [Convert]::ToHexString($sha.ComputeHash($stream)) }
        finally { $stream.Dispose(); $sha.Dispose() }
        if ($hash -ne (Get-FileHash $override.FullName -Algorithm SHA256).Hash) { throw "Override differs in archive: $relative" }
    }
    Write-Output "Verified $($manifest.files.Count) external pins plus one project-owned compatibility jar; no third-party jars bundled."
} finally { $zip.Dispose() }
(Get-FileHash $archive -Algorithm SHA256).Hash.ToLower() | Set-Content ($archive + '.sha256')
Write-Output "Built $archive"

