# Inventory freeze investigation — 2026-10-31

## Alpha.12 update: captured anvil-preview bottleneck

The user ran the capture tool on alpha.11. All three render-thread snapshots
show JEI `AnvilRecipeMaker` enumerating enchanted-book application previews.
The thread remains RUNNABLE and accumulates CPU time. Calls include anvil/NBT
simulation, Illager Revolution enchantment eligibility, and Enigmatic Legacy /
Curios hooks. Their presence does not establish a defect in those individual
mods. The shared work is JEI's exhaustive item/enchantment/level enumeration.

Alpha.12 adds a small project-owned client mixin that cancels the zero-argument
`getBookEnchantmentRecipes()` stream before that work begins. Ordinary anvils,
enchanting and repair-preview generation are not targeted. JEI loses exhaustive
book-application previews; item browsing and other recipe categories remain.
See [patch source/build notes](../compat/README.md).

The exact pinned JEI binary's target method, callback cancellation and generated
archive bytes are checked. **Live Forge mixin activation and performance are not
yet verified.** The earlier tooltip-search change remains but did not prevent
the captured bottleneck. Additional slow recipe plugins may remain after this
targeted bypass. Later log records vanilla recipe registration finishing, but
does not establish complete recovery or stable gameplay.

AoA is separately deferred after the user's incomplete-content warning; this
is not claimed as the freeze fix. The [pinned official file](https://www.curseforge.com/minecraft/mc-mods/advent-of-ascension-nevermine/files/4988685)
is 1.20.1-3.7.1 Beta. MCA remains deferred. Use a separate alpha.12 profile and
fresh world; test inventory/recipe browsing and actual anvil enchanting. If it
freezes again, capture new thread samples rather than waiting indefinitely.

## Historical alpha.11 investigation

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
