# Alpha acceptance checklist

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
- [ ] Test Dragon Mounts egg hatching and riding independently.
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

