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
