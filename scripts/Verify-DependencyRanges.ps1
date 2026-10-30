param([string]$JavaPath, [string]$MavenArtifactPath, [string]$CommonsLangPath)
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$install = Join-Path $env:USERPROFILE 'curseforge/minecraft/Install'
if (-not $JavaPath) {
    $bundled = Join-Path $install 'runtime/java-runtime-gamma/windows-x64/java-runtime-gamma/bin/java.exe'
    if (Test-Path $bundled) { $JavaPath = $bundled }
    else { $JavaPath = (Get-Command java -ErrorAction Stop).Source }
}
if (-not $MavenArtifactPath) {
    $MavenArtifactPath = Get-ChildItem (Join-Path $install 'libraries/org/apache/maven/maven-artifact') -Recurse -Filter '*.jar' | Select-Object -Last 1 -ExpandProperty FullName
}
if (-not $CommonsLangPath) {
    $CommonsLangPath = Get-ChildItem (Join-Path $install 'libraries/org/apache/commons/commons-lang3') -Recurse -Filter '*.jar' | Select-Object -Last 1 -ExpandProperty FullName
}
if (-not $MavenArtifactPath -or -not $CommonsLangPath) { throw 'Supply Java 17, MavenArtifactPath and CommonsLangPath, or install the Forge launcher libraries first.' }
& $JavaPath --class-path ($MavenArtifactPath + [IO.Path]::PathSeparator + $CommonsLangPath) (Join-Path $PSScriptRoot 'CheckDependencyRanges.java') $root
if ($LASTEXITCODE -ne 0) { throw 'Dependency range audit failed; see dist/dependency-ranges.txt' }
