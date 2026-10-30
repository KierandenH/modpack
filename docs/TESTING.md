# Alpha acceptance checklist

## Current build: alpha.5 — user playtest pending

300 pinned files; 219 catalogue selections included. File hashes, mandatory IDs
and 756 declared mandatory Maven ranges pass static inspection. No duplicate
top-level mod IDs were found. These checks do not establish mixin or gameplay
compatibility. Import alpha.5 separately and use a new world.

First test: launch, create world, explore/open JEI, then save/reload. Then check
the repaired Buddycards book and fresh Iron's Spells loot. Send the version,
error screen/logs and reproduction steps for any failure. HUD/control tuning
is still deferred. No alpha.5 tests are marked passed.

## Historical alpha.2 smoke test

Status: Windows client smoke test performed on 2026-10-29 with Java 17,
Minecraft 1.20.1 and Forge 47.4.28. All 104 installed jar hashes matched the
pins. Forge displays 116 loaded mods including bundled libraries. The client
reached the main menu and generated and entered a fresh survival world.
The world was saved, returned to the title screen, and successfully reloaded.
KubeJS reported 1/1 server scripts loaded with zero errors and zero warnings.
No dedicated server or extended gameplay test has been performed.

- [x] Import the archive into a fresh launcher profile using Java 17.
- [x] Reach the menu without missing-mod or dependency-version errors.
- [x] Create a new world; check the log for KubeJS startup errors.
- [ ] Confirm JEI recipes and Jade tooltips work.
- [ ] Explore fresh chunks and find Explorify structures.
- [ ] Follow Book of Dragons' guide to acquire, tame and ride a dragon.
- Deferred: Dragon Mounts hatching/riding until balance and possible quest gating.
- [ ] Save and reload with tamed dragons; verify ownership and state persist.
- [ ] Craft and cast an Ars Nouveau spell; inspect its guidebook and equipment.
- [ ] Cook a Farmer's Delight meal and use a Comforts sleeping bag.
- [ ] Activate two Waystones and travel both directions.
- [ ] Enter and leave the Nether and End; save, quit and reload.
- [ ] Check keybind collisions, flight controls and performance near creatures.
- [ ] Record RAM allocation, CPU/GPU, symptoms and relevant log excerpts.

## Known alpha issues

- Buddycards' rules guidebook fails to load because it uses an outdated
  Patchouli book format.
- Iron's Spells reports invalid `citadel_tomes` and `crypt_loot` loot tables.
  Related chest loot needs repair and verification before progression testing.
- Human Companions references a misspelled vanilla biome in two structure tags.
- Some Mowzie's Mobs models and dragon particle/animation assets report errors
  or missing resources. Visual effects need individual inspection.
- Several default HUDs overlap at the initial small window size. UI positions
  and key bindings need a configuration pass.
- Supplementaries shows an optional Amendments migration notice. This is a
  fresh profile with no old Amendments blocks to preserve.
- Initial JEI recipe registration is slow; it completed during the world test.

These did not prevent the initial world from loading, but mean this build is
an experimental starting point. Back up the test world before changes.
For multiplayer, repeat on a dedicated server with two clients; the current
client archive is not evidence of dedicated-server compatibility.


## Alpha.3 revision - 2026-10-29
User-reported alpha.2 feedback: unwanted COMMAND/Attack/Items HUD, disliked
Kingdom Keys and Gensokyo-related content, and remembered Dragon Mounts balance
concerns. The three mods are removed. No alpha.3 gameplay test has been run.
Historical checked items above apply to alpha.2 only.
Import the local alpha.3 archive separately, use a fresh disposable world,
confirm the command HUD is gone, check JEI and remaining mounts, and save/reload.
Report remaining HUD/control conflicts, crashes and balance concerns.

## Alpha.4 compatibility revision - 2026-10-29
Buddycards book startup registration and 11 migrated category/entry resources
are patched. Iron's Spells crypt reference and 12 lore-book entries are patched.
Earlier guidebook/loot defects listed above describe the alpha.2 observations;
alpha.4 file checks pass, but gameplay acceptance is pending.
User test: open Buddycards rules book and browse all categories/pages. In a
creative disposable world, run:
`/loot give @s loot irons_spellbooks:chests/citadel/citadel_tomes`
`/loot give @s loot irons_spellbooks:chests/catacombs/crypt_loot`
Repeat to sample randomized rewards; check lore books are readable. Check newly
opened corresponding dungeon containers too. Provide latest.log/startup.log if
anything fails. An initial Buddycards rejection can still appear before the
startup repair; look for the later "Restored Buddycards rules book" message.
These tests have NOT been run. HUD configuration is deferred by user until all
mod additions are finished. No new gameplay result recorded.

## Alpha.6 — installation failure remediation (2026-10-30)

User alpha.5 startup failed during dependency discovery: 159/300 top-level
files were detected. Installed-file creation times confirm downloads continued
after startup. All 300 installed files now match the pins. Full diagnosis:
[CRASH_ALPHA5.md](CRASH_ALPHA5.md). The 44 dependency errors are not 44 separate
mod conflicts. No successful alpha.5 or alpha.6 runtime test is recorded.

Alpha.6 retains the mod pins and adds a readiness checker covering all jars and
KubeJS overrides. Before testing: wait for the complete import, open the profile
folder, run CHECK-INSTALLATION.cmd, require READY, then launch. Report any new
failure with the new log. The checker does not run Minecraft or validate mixins.

## Alpha.7: user-reported Naturalist/Delightful error

User screenshot reports Delightful requires Naturalist >=4, found 2.0.9.
Confirmed in Delightful's optional dependency metadata. The revised audit
reproduced exactly this failure before the pin change; with Naturalist 4.0.3,
all 849 mandatory/present-optional ranges pass. Naturalist 4.0.3 Forge 1.20.1
is an official release: https://modrinth.com/mod/naturalist/version/fapHaClR
CurseForge equivalent: https://www.curseforge.com/minecraft/mc-mods/naturalist/files/4847009

Initial alpha.7 test request (superseded by failure below): import separately, run
the readiness check and confirm the dependency screen is gone; then create a
new test world and check Naturalist creatures and Delightful recipes.

## 2026-10-30: user world-generation crash

The user reached world generation but crashed at 12:49:50 with a feature order
cycle involving `werewolves:werewolf_heaven` and `environmental:blossom_woods`.
This is a world-generation compatibility blocker. Blueprint appears in the
stack; the precise conflicting feature or injector still needs isolation.
No successful world entry or gameplay is recorded. Dependency-range checks
do not detect this kind of runtime ordering conflict. No fix has been tested.

The supplied Supplementaries screenshot separately explains its optional
Amendments split. Moved decorative blocks need Amendments to be preserved in
old worlds; it is not identified as the cause of this crash.

## Alpha.8: repeated crash addressed by omission

The user's 12:55:34 report repeats the feature-order cycle, naming blossom_valleys
instead of blossom_woods. The static scan reproduced both with Werewolves:
flower_default and patch_tall_grass occur in opposing orders. Alpha.8 omits
Environmental, an optional scenery mod, retaining Werewolves. All 299 jars were
scanned; no cycle was detected in the checked groups of 307 biome definitions.
See WORLDGEN_ALPHA7_FAILURE.txt and WORLDGEN_AUDIT.txt for scope and results.
This is not an exhaustive runtime simulation; Java injections, biome modifiers,
mixins and effective datapack behavior still require user testing.

Import alpha.8 separately, wait for READY and use a fresh world. Test generation,
exploration into new chunks, save/reload and a second seed; report new crash logs.
No alpha.8 gameplay pass is claimed. Amendments remains a separate optional item.

## Alpha.9: repair incomplete installed profiles

User alpha.8 report at 16:27:41 contains 51 missing-dependency errors. Read-only
inspection confirms the profile identifies alpha.8 but contains only 239/299
expected jars, with 60 missing. Its release ZIP lists all 299 as required.
The launcher omission cause is unknown; this report is not another biome cycle.

Alpha.9 keeps the pins and supplies REPAIR-INSTALLATION.cmd. After imports finish,
run it in the new profile and require READY. It retrieves missing official files,
verifies SHA-256 and leaves differing existing jars untouched. Isolated download,
repeat/no-change, corrupt-file/hash and path/URL rejection tests passed in Windows
PowerShell, along with readiness regression tests. No installed game was changed
or launched. User must test startup, fresh world, exploration and save/reload.

## Alpha.10: installed-profile verification and repair feedback

User reported no apparent downloads. Actual Wild Realms (1) identifies alpha.9
and passes all 314 hashes (299 jars + 15 overrides). Improved repair run under
Windows PowerShell reports 299 already correct, zero downloaded/failed and READY.
The older Wild Realms alpha.8 profile is separate. No game was launched.

Removed the CMD's initial pause; added profile/version, counts, verification
progress, persistent log and final result. Seven isolated repair test cases pass,
including actual CDN download and empty-manifest rejection. Updated the two
repair tools directly in the verified profile after backup; mods/worlds unchanged.
No reimport needed for user gameplay testing. Alpha.10 ships these improvements
for future imports. A complete installation still does not prove runtime stability.

## 2026-10-31: user playtest V2

User entered a world (supplied screenshot), but reports inventory freezes in both
creative and survival. Read-only log inspection shows JEI recipe registration
at 1.829 minutes, including Iron's Spells 26.62s and MineColonies 19.46s; ingredient
filter construction took 20.86s for 57996 ingredients. This suggests initial UI
initialization cost; repeat-freeze cause and eventual recovery remain unconfirmed.
No stable gameplay or save/reload pass recorded. See feedback/2026-10-31-changes-v2.txt.
MCA character/destiny dissatisfaction and screenshot MCA/Werewolves + AoA content
warnings are now backlog items. No mods removed or new release built.
