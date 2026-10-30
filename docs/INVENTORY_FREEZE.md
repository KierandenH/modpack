# Inventory freeze investigation — 2026-10-31

**Unresolved runtime defect. Alpha.11 is a mitigation/diagnostic build, not a
confirmed freeze fix.** User reported a whole-game freeze for several minutes
when opening inventory in creative and survival, then quit.

## Evidence from the existing alpha.9 log

| Render-thread activity | Duration |
| --- | ---: |
| JEI vanilla recipe registration | 56.53 seconds |
| Iron's Spells JEI recipe registration | 26.62 seconds |
| MineColonies JEI recipe registration | 19.46 seconds |
| All recipe registration | 1.829 minutes |
| Ingredient filter, 57,996 entries | 20.86 seconds |

The log ends after the ingredient filter finishes, without a complete JEI startup
message. These are measured setup delays, not a stack trace of the final hang.
No Minecraft Java process was running when inspected. No out-of-memory exception
was found, but that does not rule out memory/GC pressure. Server-behind warnings
also occur; they do not identify the client freeze's cause.

## Alpha.11 changes

- MCA Reborn deferred at the user's request. It is an optional villager/social/
  family mod; its removal is a design choice, not a proven freeze repair.
- JEI retained. It supplies item and recipe browsing beside the inventory.
- Set `[search] tooltipSearchMode = DISABLED` in
  `config/jei/client/default/jei-client.ini`. Name and mod searches, normal hover
  tooltips and recipe viewing remain. Tooltip-text search is unavailable.
- Installed generated config confirms the setting name/value. Inspection of the
  exact pinned 15.74.0.233 jar with Java `javap` confirms disabled search modes
  skip string indexing. This does not eliminate recipe-registration work.
- Added external freeze diagnostics, because the existing log cannot establish
  where the client stops after the reported timings.

Related primary source (branch can differ from the pinned binary):
[JEI search implementation](https://github.com/mezz/JustEnoughItems/blob/1.20.1/Gui/src/main/java/mezz/jei/gui/search/ElementSearch.java).

## One focused user test

Import alpha.11 as a separate profile and use a fresh world: MCA villagers/families
are not migrated. Run the installation repair/check and require READY. Test
inventory opening, recipe lookup and reopening in creative and survival.

If the whole game freezes, keep it open, Alt-Tab to the profile folder and
double-click **CAPTURE-FREEZE.cmd**. It gathers three thread snapshots using Java's
diagnostic tool, even when the game UI is unresponsive. It does not launch/stop
Minecraft or upload anything. Each attachment attempt is capped at 15 seconds.
Send the new `freeze-reports` subfolder and `logs/latest.log` privately. If capture
fails, send the visible error; do not wait multiple minutes hoping for recovery.

The tool requires Windows and an available Java 17 `jcmd.exe`; it defaults to
this machine's CurseForge Java location. A custom installation can pass
`-JcmdPath` to `Capture-Freeze.ps1`. Zero or multiple matching processes are
rejected instead of attaching to an arbitrary JVM. Reports can contain local
paths and mod/game details; no game launch command line or tokens are collected.

## Checks performed

- All pinned jar hashes and declared dependencies, grouped biome-order audit,
  existing book/loot tests and export override checks.
- Readiness tests verify the setting even after JEI adds unrelated defaults;
  missing/changed/wrong-section values fail.
- Three real thread dumps captured from an isolated sleeping Java test program,
  with its expected stack present in every sample. No-game case rejects safely.
- No gameplay, performance improvement or freeze resolution claimed.

Next evidence needed if it recurs: repeated client/render-thread stacks. Those
will guide a targeted plugin/config fix or controlled isolation instead of
removing unrelated mods based only on slow-startup timings.
