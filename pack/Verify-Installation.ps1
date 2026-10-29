param(
    [string]$InstancePath = $PSScriptRoot,
    [string]$ManifestPath = (Join-Path $PSScriptRoot 'installation-manifest.json'),
    [switch]$ModsOnly
)
# Read-only readiness check. Does not download, modify files or launch Minecraft.
$ErrorActionPreference = 'Stop'
try {
    $manifest = Get-Content -LiteralPath $ManifestPath -Raw | ConvertFrom-Json
    $root = [IO.Path]::GetFullPath($InstancePath).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    $problems = @()
    $checked = 0
    foreach ($entry in $manifest.files) {
        if ($ModsOnly -and -not $entry.path.StartsWith('mods/')) { continue }
        $path = [IO.Path]::GetFullPath((Join-Path $root $entry.path))
        if (-not $path.StartsWith($root, [StringComparison]::OrdinalIgnoreCase)) { throw 'Unsafe manifest path' }
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { $problems += "MISSING: $($entry.path)"; continue }
        try { $hash = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash }
        catch { $problems += "BUSY/UNREADABLE: $($entry.path)"; continue }
        if ($hash -ne $entry.sha256) { $problems += "WRONG OR INCOMPLETE FILE: $($entry.path)"; continue }
        $checked++
    }
    $expected = @($manifest.files | Where-Object { $_.path.StartsWith('mods/') } | ForEach-Object { $_.path.Substring(5) })
    $modDir = Join-Path $root 'mods'
    if (Test-Path -LiteralPath $modDir) {
        foreach ($file in Get-ChildItem -LiteralPath $modDir -File) {
            if ($file.Extension -eq '.jar' -and $file.Name -notin $expected) { $problems += "EXTRA MOD: $($file.Name)" }
        }
    }
    if ($problems.Count) {
        Write-Output 'NOT READY - do not start Minecraft yet.'
        $problems | Write-Output
        Write-Output 'Wait for CurseForge to finish installing, then run this check again. If it still fails, report this output.'
        exit 1
    }
    if ($ModsOnly) {
        Write-Output "MOD FILES VERIFIED: $checked files match Wild Realms $($manifest.version). Overrides were not checked."
        exit 0
    }
    Write-Output "READY: $checked files match Wild Realms $($manifest.version)."
    Write-Output 'Installation is complete. This does not guarantee runtime compatibility; launch and gameplay are the next tests.'
    exit 0
} catch {
    Write-Output ('NOT READY - verification failed: ' + $_.Exception.Message)
    exit 2
}
