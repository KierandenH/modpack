# File-level regression checks; does not launch Minecraft or assert gameplay.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
function Assert($condition, $message) { if (-not $condition) { throw $message } }
function Read-ZipJson($zip, $path) {
    $reader = [IO.StreamReader]::new($zip.GetEntry($path).Open())
    try { return ($reader.ReadToEnd() | ConvertFrom-Json -AsHashtable) } finally { $reader.Dispose() }
}
function Same-Json($a, $b) { return (($a | ConvertTo-Json -Depth 100 -Compress) -ceq ($b | ConvertTo-Json -Depth 100 -Compress)) }
$iron = [IO.Compression.ZipFile]::OpenRead((Join-Path $root '.tools/verified-jars/irons_spellbooks-1.20.1-3.16.3.jar'))
try {
    $prefix = 'irons_spellbooks/loot_tables/chests/'
    $original = Read-ZipJson $iron ('data/' + $prefix + 'catacombs/crypt_loot.json')
    $patched = Get-Content (Join-Path $root ('pack/kubejs/data/' + $prefix + 'catacombs/crypt_loot.json')) -Raw | ConvertFrom-Json -AsHashtable
    $entry = $patched.pools[5].entries[0]
    Assert ($entry.name -ceq 'irons_spellbooks:magic_items/reward_ink' -and -not $entry.Contains('value')) 'Crypt reference is not repaired'
    $entry['value'] = $entry.name
    $entry.Remove('name')
    # Rebuild original order, so equality also detects accidental reward changes.
    $entry2 = [ordered]@{ type=$entry.type; value=$entry.value }
    $patched.pools[5].entries[0] = $entry2
    Assert (Same-Json $original $patched) 'Crypt patch changes more than the invalid reference field'

    $original = Read-ZipJson $iron ('data/' + $prefix + 'citadel/citadel_tomes.json')
    $patched = Get-Content (Join-Path $root ('pack/kubejs/data/' + $prefix + 'citadel/citadel_tomes.json')) -Raw | ConvertFrom-Json -AsHashtable
    Assert ($patched.pools[0].entries.Count -eq 12) 'Expected 12 lore books'
    for ($i=0; $i -lt 12; $i++) {
        $function = $patched.pools[0].entries[$i].functions[1]
        Assert ($function.function -ceq 'minecraft:set_nbt') 'Unsupported book-writing function remains'
        $match = [regex]::Match($function.tag, "^\{title:'((?:\\.|[^'\\])*)',author:'Unknown',pages:\['((?:\\.|[^'\\])*)'\]\}$")
        Assert $match.Success 'Malformed written-book SNBT envelope'
        $pageJson = $match.Groups[2].Value.Replace("\'", "'").Replace('\\', '\')
        $page = $pageJson | ConvertFrom-Json -AsHashtable
        Assert (Same-Json $page $original.pools[0].entries[$i].functions[1].pages[0]) 'Lore translation or formatting changed'
        $patched.pools[0].entries[$i].functions[1] = $original.pools[0].entries[$i].functions[1]
    }
    Assert (Same-Json $patched $original) 'Tome rewards, rolls, weights or other functions changed'
} finally { $iron.Dispose() }
$buddy = [IO.Compression.ZipFile]::OpenRead((Join-Path $root '.tools/verified-jars/Buddycards-1.20.1-4.3.2.jar'))
try {
    $prefix = 'data/buddycards/patchouli_books/buddycards_rules/'
    $count = 0
    foreach ($entry in $buddy.Entries) {
        if ($entry.FullName.StartsWith($prefix) -and $entry.FullName.EndsWith('.json') -and $entry.FullName -ne ($prefix + 'book.json')) {
            $source = Read-ZipJson $buddy $entry.FullName
            $path = Join-Path $root ('pack/kubejs/assets/buddycards/patchouli_books/buddycards_rules/' + $entry.FullName.Substring($prefix.Length))
            $dest = Get-Content $path -Raw | ConvertFrom-Json -AsHashtable
            Assert (Same-Json $source $dest) "Migrated page content changed: $path"
            $count++
        }
    }
    Assert ($count -eq 11) 'Unexpected book resource count'
} finally { $buddy.Dispose() }
& node (Join-Path $PSScriptRoot 'Verify-BookStartup.cjs')
if ($LASTEXITCODE -ne 0) { throw 'Book startup mock checks failed' }
Write-Output 'PASS: 11 book resources unchanged; 12 lore pages preserved; loot rewards/rolls unchanged. Runtime tests remain user-run.'
