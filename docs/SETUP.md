# Install and play Wild Realms alpha.9

The inspected **Wild Realms** profile identifies as alpha.8 but has 60 missing jars. This update
does not modify it, its worlds, or control your launcher.

1. Download `Wild-Realms-0.1.0-alpha.9.zip` from the
   [alpha.9 release](https://github.com/KierandenH/modpack/releases/tag/v0.1.0-alpha.9).
   The same archive is built locally in `dist/`.
2. In CurseForge, open Minecraft → My Modpacks → Import and select the ZIP.
   Import into a separate profile; name it **Wild Realms alpha.9**.
3. Wait until CurseForge finishes the entire import; do not start while files are downloading. Allow all 299 referenced files to download. Use Minecraft 1.20.1,
   Forge 47.4.28 and 64-bit Java 17, as pinned by the archive.
4. Start with 10–12 GB allocated RAM on this 64 GB computer, no shaders, and a
   new disposable world. This is an initial setting, not a measured requirement.
5. Open the profile folder (three-dot menu → Open Folder) and double-click **REPAIR-INSTALLATION.cmd**. It downloads missing pinned mods from CurseForge and verifies their hashes. Wait for **READY** before clicking Play. Existing mismatched files are left unchanged; report any failure. Use **CHECK-INSTALLATION.cmd** for later read-only checks.
6. Follow the alpha.9 test request in [PROJECT_LOG.txt](../PROJECT_LOG.txt).

Do not use Update all: AzureLib 3.2.0 is deliberately pinned. Preserve existing
worlds and close Minecraft before backups. This expansion removes some old
content and adds world generation; old saves are not the acceptance baseline.

If startup fails, report the error screen and `logs/latest.log`, plus the newest
`crash-reports/` file if present. Script diagnostics are in `logs/kubejs/`.
Redact personal details before sharing logs publicly.

Alpha.2 reached a world; alpha.5 failed during an incomplete import. Alpha.9 requires
your launch and gameplay tests. HUD/control tuning, balance, extended survival
and dedicated-server support remain outstanding. The Supplementaries notice
about optional Amendments can be continued past in this new profile.
