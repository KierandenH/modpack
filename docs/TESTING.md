# Alpha acceptance checklist

Status: artifact and dependency inspection are separate from gameplay tests.
No client or dedicated server has been launched as part of this initial build.

- [ ] Import the archive into a fresh launcher profile using Java 17.
- [ ] Reach the menu without missing-mod or dependency-version errors.
- [ ] Create a new world; check the log for KubeJS startup errors.
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

Only then expand the content set. Back up the test world before changes.
For multiplayer, repeat on a dedicated server with two clients; the current
client archive is not evidence of dedicated-server compatibility.

