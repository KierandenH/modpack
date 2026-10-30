# Conservative static audit of all pinned jars; does not launch Minecraft.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$records = @()
$tags = @{}
$dimensions = @()
$modifiers = 0
$jars = 0
foreach ($pin in Get-ChildItem (Join-Path $root 'pack/mods/*.pw.toml')) {
    $s = Get-Content $pin.FullName -Raw
    $filename = [regex]::Match($s, '(?m)^filename = "([^"]+)"').Groups[1].Value
    $zip = [IO.Compression.ZipFile]::OpenRead((Join-Path $root ".tools/verified-jars/$filename"))
    $jars++
    try {
        foreach ($entry in $zip.Entries) {
            if ($entry.FullName -match '^data/[^/]+/forge/biome_modifier/.+\.json$') { $modifiers++ }
            if ($entry.FullName -match '^data/([^/]+)/tags/worldgen/biome/(.+)\.json$') {
                $tag = $Matches[1] + ':' + $Matches[2]
                $reader = [IO.StreamReader]::new($entry.Open())
                try { $value = $reader.ReadToEnd() | ConvertFrom-Json -Depth 100 } finally { $reader.Dispose() }
                $tags[$tag] = @($tags[$tag]) + @($value.values)
            }
            if ($entry.FullName -match '^data/([^/]+)/dimension/(.+)\.json$') {
                $dimension = $Matches[1] + ':' + $Matches[2]
                $reader = [IO.StreamReader]::new($entry.Open())
                try { $text = $reader.ReadToEnd() } finally { $reader.Dispose() }
                $dimensions += @{id=$dimension; text=$text}
            }
            if ($entry.FullName -notmatch '^data/([^/]+)/worldgen/biome/(.+)\.json$') { continue }
            $id = $Matches[1] + ':' + $Matches[2]
            $reader = [IO.StreamReader]::new($entry.Open())
            try { $data = $reader.ReadToEnd() | ConvertFrom-Json -Depth 100 } finally { $reader.Dispose() }
            $records += @{id=$id; jar=$filename; features=$data.features}
        }
    } finally { $zip.Dispose() }
}
$inputPath = Join-Path $root 'dist/worldgen-input.json'
New-Item -ItemType Directory -Force (Split-Path $inputPath) | Out-Null
@{jars=$jars; modifiers=$modifiers; biomes=@($records); tags=$tags; dimensions=$dimensions} | ConvertTo-Json -Depth 100 | Set-Content $inputPath
& node (Join-Path $PSScriptRoot 'CheckWorldgen.cjs') $inputPath (Join-Path $root 'dist/worldgen-audit.txt')
if ($LASTEXITCODE -ne 0) { throw 'Static worldgen order conflicts detected; see dist/worldgen-audit.txt' }
