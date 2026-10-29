# Downloads only into the project cache. Does not install or launch Minecraft.
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$root = Split-Path $PSScriptRoot -Parent
$cache = Join-Path $root '.tools/verified-jars'
New-Item -ItemType Directory -Force $cache | Out-Null
$known = @{ minecraft = '1.20.1'; forge = '47.4.28' }
$requirements = @()
$report = @('# Downloaded-file inspection', '', 'Checks hashes, Forge metadata and missing mandatory mod IDs. Version ranges require review.', '')
foreach ($pin in Get-ChildItem (Join-Path $root 'pack/mods/*.pw.toml')) {
    $s = Get-Content $pin.FullName -Raw
    $filename = [regex]::Match($s, '(?m)^filename = "([^"]+)"').Groups[1].Value
    if ([IO.Path]::GetFileName($filename) -ne $filename -or -not $filename.EndsWith('.jar')) { throw 'Unsafe mod filename' }
    $expected = [regex]::Match($s, '(?m)^hash = "([^"]+)"').Groups[1].Value
    $algorithm = [regex]::Match($s, '(?m)^hash-format = "([^"]+)"').Groups[1].Value
    $id = [regex]::Match($s, '(?m)^file-id = (\d+)').Groups[1].Value
    if (-not $id) { throw "Expected CurseForge metadata: $($pin.Name)" }
    $prefix = $id.Substring(0, $id.Length - 3)
    $suffix = [int]$id.Substring($id.Length - 3)
    $url = "https://edge.forgecdn.net/files/$prefix/$suffix/$([Uri]::EscapeDataString($filename))"
    $dest = Join-Path $cache $filename
    if (-not (Test-Path $dest)) { Invoke-WebRequest $url -OutFile $dest }
    if ((Get-FileHash $dest -Algorithm $algorithm).Hash.ToLower() -ne $expected) { throw "Hash mismatch: $filename" }
    $zip = [IO.Compression.ZipFile]::OpenRead($dest)
    try {
        $entry = $zip.GetEntry('META-INF/mods.toml')
        if (-not $entry) { throw "Missing Forge metadata: $filename" }
        $reader = [IO.StreamReader]::new($entry.Open())
        try { $metadata = $reader.ReadToEnd() } finally { $reader.Dispose() }
        $metadata = [regex]::Replace($metadata, '(?m)^\s*#.*$', '')
        foreach ($mod in [regex]::Matches($metadata, '(?s)\[\[mods\]\](.*?)(?=\[\[|\z)')) {
            $modId = [regex]::Match($mod.Value, 'modId\s*=\s*"([^"]+)"').Groups[1].Value
            if ($known.ContainsKey($modId)) { throw "Duplicate mod ID: $modId" }
            $known[$modId] = $filename
        }
        foreach ($dep in [regex]::Matches($metadata, '(?s)\[\[dependencies\.[^\]]+\]\](.*?)(?=\[\[|\z)')) {
            if ($dep.Value -match 'mandatory\s*=\s*true') {
                $depId = [regex]::Match($dep.Value, 'modId\s*=\s*"([^"]+)"').Groups[1].Value
                $range = [regex]::Match($dep.Value, 'versionRange\s*=\s*"([^"]+)"').Groups[1].Value
                $requirements += [pscustomobject]@{ source=$filename; id=$depId; range=$range }
            }
        }
        $report += "- Verified: $filename"
        Write-Output "Verified $filename"
    } finally { $zip.Dispose() }
}
$missing = @($requirements | Where-Object { -not $known.ContainsKey($_.id) })
if ($missing.Count) { throw ('Missing dependencies: ' + ($missing | ConvertTo-Json -Compress)) }
$report += @('', '## Mandatory dependency declarations', '')
foreach ($req in $requirements) { $report += "- $($req.source): $($req.id) $($req.range)" }
$report += @('', 'All declared mandatory IDs are present. This is not a launch or gameplay test.')
New-Item -ItemType Directory -Force (Join-Path $root 'dist') | Out-Null
$report | Set-Content (Join-Path $root 'dist/dependency-inspection.md')
Write-Output 'All declared mandatory dependency IDs are present.'
