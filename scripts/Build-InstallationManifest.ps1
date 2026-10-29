$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$pack = Join-Path $root 'pack'
$version = [regex]::Match((Get-Content (Join-Path $pack 'pack.toml') -Raw), '(?m)^version = "([^"]+)"').Groups[1].Value
$files = @()
foreach ($pin in Get-ChildItem (Join-Path $pack 'mods/*.pw.toml')) {
    $text = Get-Content $pin.FullName -Raw
    $name = [regex]::Match($text, '(?m)^filename = "([^"]+)"').Groups[1].Value
    $sha1 = [regex]::Match($text, '(?m)^hash = "([^"]+)"').Groups[1].Value
    $path = Join-Path $root ('.tools/verified-jars/' + $name)
    if ((Get-FileHash -LiteralPath $path -Algorithm SHA1).Hash.ToLower() -ne $sha1) { throw "Unverified cache file: $name" }
    $files += [ordered]@{path=('mods/' + $name);sha256=(Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLower()}
}
foreach ($file in Get-ChildItem (Join-Path $pack 'kubejs') -File -Recurse) {
    $relative = [IO.Path]::GetRelativePath($pack, $file.FullName).Replace('\','/')
    $files += [ordered]@{path=$relative;sha256=(Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLower()}
}
[ordered]@{version=$version;files=$files} | ConvertTo-Json -Depth 4 | Set-Content (Join-Path $pack 'installation-manifest.json')
Write-Output "Installation manifest: $($files.Count) pinned files and overrides."
