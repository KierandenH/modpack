param(
    [string]$InstancePath = $PSScriptRoot,
    [string]$ManifestPath = (Join-Path $PSScriptRoot 'installation-manifest.json')
)
# User-run missing-file repair. Never launches Minecraft or removes existing mods.
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$failed = 0
try {
    $manifest = Get-Content -LiteralPath $ManifestPath -Raw | ConvertFrom-Json
    $root = [IO.Path]::GetFullPath($InstancePath)
    $modDir = Join-Path $root 'mods'
    if (-not (Test-Path -LiteralPath $root -PathType Container)) { throw 'Profile folder does not exist.' }
    $entries = @($manifest.files | Where-Object { $_.path.StartsWith('mods/') })
    # Validate the whole download plan before writing any files.
    foreach ($entry in $entries) {
        if ($entry.path -notmatch '^mods/[^/\\:]+\.jar$' -or $entry.sha256 -notmatch '^[a-fA-F0-9]{64}$') { throw 'Invalid manifest path or hash.' }
        $uri = [Uri]$entry.url
        if (-not $uri.IsAbsoluteUri -or $uri.Scheme -ne 'https' -or $uri.Host -ne 'edge.forgecdn.net' -or $uri.AbsolutePath -notmatch '^/files/\d+/\d+/[^/]+\.jar$') { throw 'Invalid official download URL.' }
    }
    New-Item -ItemType Directory -Force -Path $modDir | Out-Null
    foreach ($entry in $entries) {
        $path = Join-Path $root $entry.path
        if (Test-Path -LiteralPath $path) {
            if ((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash -ne $entry.sha256) {
                Write-Output "EXISTING FILE DIFFERS: $($entry.path). Kept unchanged; use a fresh profile or report this."
                $failed++
            }
            continue
        }
        $temporary = Join-Path $modDir ([Guid]::NewGuid().ToString() + '.download')
        try {
            Write-Output "Downloading $($entry.path)"
            Invoke-WebRequest -UseBasicParsing -Uri $entry.url -OutFile $temporary
            if ((Get-FileHash -LiteralPath $temporary -Algorithm SHA256).Hash -ne $entry.sha256) { throw 'Downloaded file failed its pinned hash check.' }
            # Do not overwrite a file if the launcher created it in the meantime.
            [IO.File]::Move($temporary, $path)
            Write-Output "RESTORED: $($entry.path)"
        } catch {
            Write-Output "FAILED: $($entry.path): $($_.Exception.Message)"
            $failed++
        } finally {
            if (Test-Path -LiteralPath $temporary) { Remove-Item -LiteralPath $temporary }
        }
    }
    if ($failed) { Write-Output "Repair incomplete: $failed file(s) need attention. Do not play; report this output."; exit 1 }
    & (Join-Path $PSScriptRoot 'Verify-Installation.ps1') -InstancePath $root -ManifestPath $ManifestPath
    exit $LASTEXITCODE
} catch {
    Write-Output ('Repair stopped: ' + $_.Exception.Message)
    exit 2
}
