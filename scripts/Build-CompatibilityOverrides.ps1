# Generate narrowly scoped compatibility overrides from the exact pinned jars.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
function Open-PinnedJar($slug) {
    $pin = Get-Content (Join-Path $root "pack/mods/$slug.pw.toml") -Raw
    $filename = [regex]::Match($pin, '(?m)^filename = "([^"]+)"').Groups[1].Value
    $hash = [regex]::Match($pin, '(?m)^hash = "([^"]+)"').Groups[1].Value
    $path = Join-Path $root ".tools/verified-jars/$filename"
    if (-not (Test-Path $path)) { throw 'Run scripts/Verify-Mods.ps1 first to populate the pinned jar cache.' }
    if ((Get-FileHash $path -Algorithm SHA1).Hash.ToLower() -ne $hash) { throw "Hash mismatch: $filename" }
    return [IO.Compression.ZipFile]::OpenRead($path)
}
function Read-Entry($zip, $path) {
    $entry = $zip.GetEntry($path)
    if (-not $entry) { throw "Missing upstream resource: $path" }
    $reader = [IO.StreamReader]::new($entry.Open())
    try { return $reader.ReadToEnd() } finally { $reader.Dispose() }
}
function Write-Override($path, $text) {
    $dest = Join-Path $root "pack/$path"
    [IO.Directory]::CreateDirectory((Split-Path $dest -Parent)) | Out-Null
    [IO.File]::WriteAllText($dest, $text + "`n", [Text.UTF8Encoding]::new($false))
}
function Snbt-String($text) { return "'" + $text.Replace('\', '\\').Replace("'", "\'") + "'" }
$buddy = Open-PinnedJar 'buddycards'
try {
    $prefix = 'data/buddycards/patchouli_books/buddycards_rules/'
    $count = 0
    foreach ($entry in $buddy.Entries) {
        if ($entry.FullName.StartsWith($prefix) -and $entry.FullName.EndsWith('.json') -and $entry.FullName -ne ($prefix + 'book.json')) {
            $relative = $entry.FullName.Substring($prefix.Length)
            $text = Read-Entry $buddy $entry.FullName
            $null = $text | ConvertFrom-Json
            Write-Override "kubejs/assets/buddycards/patchouli_books/buddycards_rules/$relative" $text.TrimEnd()
            $count++
        }
    }
    if ($count -eq 0) { throw 'No Buddycards book contents found' }
    Write-Output "Migrated $count Buddycards book resources."
} finally { $buddy.Dispose() }
$iron = Open-PinnedJar 'irons-spells-n-spellbooks'
try {
    $prefix = 'data/irons_spellbooks/loot_tables/'
    $crypt = (Read-Entry $iron ($prefix + 'chests/catacombs/crypt_loot.json')) | ConvertFrom-Json
    $changes = 0
    foreach ($pool in $crypt.pools) {
        foreach ($entry in $pool.entries) {
            if ($entry.type -eq 'minecraft:loot_table' -and $entry.PSObject.Properties['value']) {
                $entry | Add-Member -NotePropertyName name -NotePropertyValue $entry.value
                $entry.PSObject.Properties.Remove('value')
                $changes++
            }
        }
    }
    if ($changes -ne 1) { throw 'Upstream crypt table changed; review patch' }
    Write-Override 'kubejs/data/irons_spellbooks/loot_tables/chests/catacombs/crypt_loot.json' ($crypt | ConvertTo-Json -Depth 100)
    $tomes = (Read-Entry $iron ($prefix + 'chests/citadel/citadel_tomes.json')) | ConvertFrom-Json
    $lang = (Read-Entry $iron 'assets/irons_spellbooks/lang/en_us.json') | ConvertFrom-Json
    $changes = 0
    foreach ($pool in $tomes.pools) {
        foreach ($entry in $pool.entries) {
            foreach ($function in $entry.functions) {
                if ($function.function -eq 'minecraft:set_written_book_pages') {
                    $pages = @($function.pages | ForEach-Object { Snbt-String ($_ | ConvertTo-Json -Depth 100 -Compress) })
                    $tag = '{title:' + (Snbt-String $lang.'lore.citadel_book.title') + ",author:'Unknown',pages:[" + ($pages -join ',') + ']}'
                    $function.function = 'minecraft:set_nbt'
                    $function | Add-Member -NotePropertyName tag -NotePropertyValue $tag
                    $function.PSObject.Properties.Remove('pages')
                    $function.PSObject.Properties.Remove('mode')
                    $changes++
                }
            }
        }
    }
    if ($changes -ne 12) { throw "Upstream tome table changed ($changes pages); review patch" }
    Write-Override 'kubejs/data/irons_spellbooks/loot_tables/chests/citadel/citadel_tomes.json' ($tomes | ConvertTo-Json -Depth 100)
    Write-Output 'Repaired crypt reference and 12 lore-book entries; pool rolls, weights and rewards preserved.'
} finally { $iron.Dispose() }
