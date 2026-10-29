# Wild Realms

An extravagant fantasy adventure modpack built around dragons, collecting,
magic and exploration. No mandatory factory progression.

Project protocol: [change notes, playtest results and the full remaining-work
list](PROJECT_LOG.txt) are maintained with every GitHub update. Future gameplay
tests are user-run; each ready build includes a focused test request.

## Playtest revision: 0.1.0-alpha.5

Minecraft Java **1.20.1**, Forge **47.4.28**, **64-bit Java 17**.
This is a pinned alpha foundation. Alpha.2 launched and created a survival world;
it is not yet a balanced or fully tested modpack.

The expansion has **300 pinned mod files**, covering 219 catalogue selections plus KubeJS and transitive support/dependency mods.
The original 20-file alpha was the dependency foundation.

- Dragons and mounts: Book of Dragons, Ice and Fire, Mythic
  Mounts, ChocoCraft and Realistic Horse Genetics.
- Wildlife and companions: Alex's Mobs/Caves, Naturalist, Exotic Birds,
  Doggy Talents, Human Companions, Ribbits and more.
- Adventures: Twilight Forest, Aether/Deep Aether, Blue Skies, Bumblezone,
  Undergarden, Deeper and Darker, Cataclysm, Mowzie's Mobs and dungeon mods.
- Magic and collecting: Ars Nouveau, Iron's Spells, Occultism, Hexerei,
  Relics, Artifacts, Buddycards and Inventory Pets.
- Home and exploration: farming, fishing, furniture, building blocks,
  seasons, ships, Waystones, bounties and trading.

See [the exact mod list](docs/MODLIST.md). KubeJS supplies the customization
layer; FerriteCore and ModernFix supply performance support.

Book of Dragons is the initial HTTYD choice. Dragons of Berk remains an
alternative in the roadmap. Neither mod's genetics or taming is shared with
Dragon Mounts. The original large catalogue remains the intended expansion
pool; this starter is a testing foundation, not a reduction of that vision.

## Play the alpha

1. Download the ZIP from [the alpha release](https://github.com/KierandenH/modpack/releases/tag/v0.1.0-alpha.5)
   and import it as a custom profile in CurseForge,
   or import the CurseForge archive in Prism Launcher.
2. Select Java 17 if the launcher asks. The archive pins Minecraft and Forge.
3. Start with a new test world and no shaders. Keep existing worlds separate.
4. Follow [the playtest checklist](docs/TESTING.md) before starting a permanent save.

The launcher downloads the referenced mod files from CurseForge. The archive
contains no third-party mod jars. It is a client starter, not a server installer.
See [the setup guide](docs/SETUP.md). Import alpha.5 as a separate profile; the existing Wild Realms instance remains alpha.2.

## Project layout

- `pack/`: packwiz source, pinned mod metadata and game overrides.
- `scripts/`: build and verification commands.
- `docs/`: decisions, testing checklist and the complete original handoff.
- `.tools/`: local build tool and verification cache, excluded from Git.
- `dist/`: generated importable archives, excluded from Git.

## Build and maintain

Install [packwiz](https://packwiz.infra.link/tutorials/creating/getting-started/)
on PATH, or place its Windows executable at `.tools/packwiz/packwiz.exe`.
Run from the project root in PowerShell:

```powershell
./scripts/Build-Pack.ps1
./scripts/Verify-Mods.ps1
```

The build refreshes packwiz hashes, exports a CurseForge archive, and checks
that every mod is referenced exactly once with no bundled jars. Verification
downloads pinned files into the local cache, verifies hashes, checks that
Forge metadata exists, and reports mandatory dependencies. It checks missing
mod IDs, not all Maven version ranges or runtime compatibility.

Add mods from the `pack` directory with `packwiz curseforge install <official
project URL>`. Review dependency changes and the Git diff before building.
Do not run a blanket update: Book of Dragons 1.4 requires AzureLib **3.2.0
exactly**, and an automatic dependency resolver selected 3.2.2 incorrectly.

## Version control and GitHub

The project is hosted at [KierandenH/modpack](https://github.com/KierandenH/modpack).
The local `main` branch tracks `origin/main`. To upload reviewed changes:

```powershell
git push
```

The archive and cache are generated locally and are not committed. No broad
license is assigned to third-party mods or the supplied handoff; their authors
retain their rights. Review distribution requirements before a public release.

See [the roadmap](docs/ROADMAP.md) and [dependency decisions](docs/DEPENDENCIES.md).


Alpha.5 is a new experimental expansion. It has static file/dependency checks only; the successful launch/world test belongs to alpha.2. Import it separately and use a disposable world.
Kingdom Keys (including its command HUD) and Touhou Little Maid are removed.
Dragon Mounts is deferred for balance and possible quest gating. Older
Disney-style dimensions, such as Lion King, remain a research candidate.

The build preserves alpha.4 compatibility repairs for Buddycards rules and two Iron's Spells
loot tables without changing reward odds. See [patch details](docs/COMPATIBILITY.md).
Gameplay validation is pending. HUD tuning is deferred until mod additions finish.
