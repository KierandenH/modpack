$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$install = Join-Path $env:USERPROFILE 'curseforge/minecraft/Install'
$bin = Join-Path $install 'runtime/java-runtime-gamma/windows-x64/java-runtime-gamma/bin'
$mixin = Join-Path $install 'libraries/org/spongepowered/mixin/0.8.5/mixin-0.8.5.jar'
$fml = Join-Path $install 'libraries/net/minecraftforge/javafmllanguage/1.20.1-47.4.28/javafmllanguage-1.20.1-47.4.28.jar'
$jei = Join-Path $root '.tools/verified-jars/jei-1.20.1-forge-15.74.0.233.jar'
if ((Get-FileHash $jei -Algorithm SHA1).Hash.ToLower() -ne '5ab6bd2affa47d6e068dbab61318efb0aa4da9ae') { throw 'Unreviewed JEI binary; revalidate the mixin before updating.' }
$signature = & (Join-Path $bin 'javap.exe') -classpath $jei -p -s mezz.jei.library.plugins.vanilla.anvil.AnvilRecipeMaker
if ($LASTEXITCODE -ne 0 -or ($signature -join "`n") -notmatch 'getBookEnchantmentRecipes\(\);\s+descriptor: \(\)Ljava/util/stream/Stream;') { throw 'Expected exact JEI target method not found' }
$work = Join-Path $root ('.tools/compat-build-' + [guid]::NewGuid().ToString('N'))
$classes = Join-Path $work 'classes'
New-Item -ItemType Directory $classes -Force | Out-Null
$sources = @(Get-ChildItem (Join-Path $root 'compat/src') -Recurse -Filter '*.java' | ForEach-Object FullName)
& (Join-Path $bin 'javac.exe') --release 17 -proc:none -classpath "$mixin;$fml" -d $classes @sources
if ($LASTEXITCODE -ne 0) { throw 'Compatibility compilation failed' }
$tests = Join-Path $work 'tests'
& (Join-Path $bin 'javac.exe') --release 17 -proc:none -classpath "$mixin;$classes" -d $tests (Join-Path $root 'compat/test/PreviewTest.java')
if ($LASTEXITCODE -ne 0) { throw 'Compatibility test compilation failed' }
& (Join-Path $bin 'java.exe') -classpath "$mixin;$classes;$tests" PreviewTest
if ($LASTEXITCODE -ne 0) { throw 'Compatibility callback test failed' }
$manifest = Join-Path $work 'MANIFEST.MF'
"Manifest-Version: 1.0`nMixinConfigs: wildrealms.mixins.json`n`n" | Set-Content $manifest -Encoding ascii
$jar = Join-Path $root 'pack/mods/wildrealms-compat-1.0.0.jar'
& (Join-Path $bin 'jar.exe') "-J-Djava.io.tmpdir=$work" --create --file $jar --date=2026-10-31T00:00:00Z --manifest $manifest -C $classes . -C (Join-Path $root 'compat/resources') . -C (Join-Path $root 'compat') LICENSE
if ($LASTEXITCODE -ne 0) { throw 'Compatibility packaging failed' }
Write-Output 'Built project-owned compatibility mod; no third-party classes bundled.'
