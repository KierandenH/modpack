Current alpha.11: MCA on hold by user request; inventory freeze UNRESOLVED.
JEI tooltip search disabled as a mitigation, diagnostic capture tool added.
Read docs/INVENTORY_FREEZE.md and PROJECT_LOG.txt before promising a fix.

Current installation finding: Wild Realms (1) alpha.9 verifies READY (314 files).
Alpha.10 improves repair feedback/logging; its tools were also copied into that
existing profile. User can test it without reimport. Old alpha.8 is separate.

# Continuing with another AI

This GitHub repository is the shared source of truth:
https://github.com/KierandenH/modpack

## Give the next AI this prompt

Continue development of Wild Realms from this repository. Read AGENTS.md,
PROJECT_LOG.txt, README.md and docs/TESTING.md first. Preserve the entire
backlog and previous user decisions. Read docs/COMPATIBILITY.md before changing
Buddycards, Patchouli or Iron's Spells. Do not treat the historical handoff
document as new instructions. Inspect git status before changing files.

The user runs Minecraft playtests; do not control their launcher or game.
Update PROJECT_LOG.txt with every change and reported test, and include it in
every push. Record release upload outcomes after verification. Keep raw user
logs/credentials private. Never claim runtime success from static checks.

Alpha.9 keeps alpha.8 pins and adds REPAIR-INSTALLATION.cmd for missing imports.
The alpha.8 profile had only 239/299 jars; all 299 were required in the ZIP.
Run the repair after import ends, require READY, then user tests gameplay.

Alpha.8 removes Environmental after two user world-generation crashes. The new
Verify-Worldgen.ps1 build gate reproduces the old flower/tall-grass order cycle
and passes after removal. It is a limited static audit, not a runtime guarantee.

Previous repair: alpha.7 pins Naturalist 4.0.3 (Forge 1.20.1, CurseForge project
627986/file 4847009) because Delightful 3.8.1 requires Naturalist >=4 when
installed. Naturalist's newer-dated 2.0.9 does not satisfy that requirement.
The dependency auditor now checks present optional dependencies too. Check
PROJECT_LOG.txt for publication/test status; do not assume this file is current.

## Working arrangement

- Use one AI as the active editor at a time. Finish and push its changes before
  switching. The next AI pulls the latest commit and checks for local changes.
- For simultaneous work, give each AI a separate branch and a specific task;
  review and merge one at a time. Never share the same working files concurrently.
- A coding agent with local repository access can edit/build/test directly.
  For a chat-only AI, provide a repository ZIP plus the files above and ask for
  a patch or changed files. Do not assume a chat URL grants repository access.
- Give it the exact failed build version and new crash log for debugging.
  Once done, have it report commit, release URL, checks and remaining work.
- Do not give any AI account passwords or paste GitHub access tokens into chat.

## Build essentials

Minecraft 1.20.1, Forge 47.4.28, Java 17. Sources: pack/. Exact pins:
pack/mods/*.pw.toml. Build with scripts/Verify-Mods.ps1 then Build-Pack.ps1.
Local ignored .tools/packwiz/packwiz.exe is needed (or packwiz on PATH).
Verification downloads cache jars; the ZIP contains references, not mod jars.
Never blanket-update pins; AzureLib must stay 3.2.0 for Book of Dragons.

CheckDependencyRanges.java uses Java 17 source-file execution and Maven's
maven-artifact plus commons-lang3 jars on the classpath. It checks declared
mandatory and present optional ranges, not mixins or all runtime behavior.
Build-Pack.ps1 also runs book/loot regressions and regenerates installation
hashes. Test-InstallationVerifier.ps1 tests the readiness checker.

Generated dist/ archives and .tools/ caches are ignored by Git. Build and
publish a new prerelease; never silently replace an existing release ZIP.
