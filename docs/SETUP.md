# Install and play Wild Realms alpha.12

The inspected **Wild Realms** profile identifies as alpha.8 but has 60 missing jars. This update
does not modify it, its worlds, or control your launcher.

1. Download `Wild-Realms-0.1.0-alpha.12.zip` from the
   [alpha.12 release](https://github.com/KierandenH/modpack/releases/tag/v0.1.0-alpha.12).
   The same archive is built locally in `dist/`.
2. In CurseForge, open Minecraft → My Modpacks → Import and select the ZIP.
   Import into a separate profile; name it **Wild Realms alpha.12**.
3. Wait until CurseForge finishes the entire import; do not start while files are downloading. Allow all 297 referenced files to download. Use Minecraft 1.20.1,
   Forge 47.4.28 and 64-bit Java 17, as pinned by the archive.
4. Start with 10–12 GB allocated RAM on this 64 GB computer, no shaders, and a
   new disposable world. This is an initial setting, not a measured requirement.
5. Open the profile folder (three-dot menu → Open Folder) and double-click **REPAIR-INSTALLATION.cmd**. It downloads missing pinned mods from CurseForge and verifies their hashes. Wait for **READY** before clicking Play. Existing mismatched files are left unchanged; report any failure. Use **CHECK-INSTALLATION.cmd** for later read-only checks.
6. Follow the alpha.12 test request in [PROJECT_LOG.txt](../PROJECT_LOG.txt).

Do not use Update all: AzureLib 3.2.0 is deliberately pinned. Preserve existing
worlds and close Minecraft before backups. This expansion removes some old
content and adds world generation; old saves are not the acceptance baseline.

If startup fails, report the error screen and `logs/latest.log`, plus the newest
`crash-reports/` file if present. Script diagnostics are in `logs/kubejs/`.
Redact personal details before sharing logs publicly.

Alpha.2 reached a world; alpha.5 failed during an incomplete import. Alpha.11 requires
your launch and gameplay tests. HUD/control tuning, balance, extended survival
and dedicated-server support remain outstanding. The Supplementaries notice
about optional Amendments can be continued past in this new profile.

If repair downloads nothing, read its summary: zero missing files is normal.
It verifies hashes before READY and saves installation-repair.log in the profile.
If it fails, send that log. Alpha.9 was fully installed but froze during gameplay.
Use the separate alpha.12 profile for this mitigation/diagnostic test.

Alpha.11 removes MCA. Use a fresh disposable world; old MCA villagers/families are not migrated. If inventory freezes, leave Minecraft open, Alt-Tab and run CAPTURE-FREEZE.cmd from this profile folder. Send the new freeze-reports subfolder and latest.log privately. It captures three thread samples without launching/closing Minecraft or uploading data.

Alpha.12 also removes AoA. There are 297 downloaded mod files plus the bundled project-owned compatibility jar (298 total). If the checker reports that bundled jar missing, restore overrides/mods/wildrealms-compat-1.0.0.jar from this ZIP or reimport. Test inventory/recipe browsing and actual anvil enchanting; exhaustive book-application previews are intentionally absent from JEI.
