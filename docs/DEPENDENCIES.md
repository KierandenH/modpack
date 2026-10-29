# Dependency decisions

Checked 29 October 2026 against registry metadata and downloaded jar manifests.

- Forge 47.4.28 is the official recommended 1.20.1 build at creation time.
- Book of Dragons 1.4 requires Forge >=47.4.0, AzureLib exactly 3.2.0, and
  FAUNA Engine (`liberanimalium`) >=1.0. Modrinth omitted FAUNA and automatically
  resolved AzureLib 3.2.2; both were corrected from the actual jar declarations.
- AzureLib's `azurelib-neo-1.20.1-3.2.0.jar` filename is misleading: the file
  contains Forge `META-INF/mods.toml`. Do not choose loaders by filename alone.
- Ars Nouveau 4.12.7 declares Curios and GeckoLib mandatory inside its jar,
  despite the initial registry resolution omitting them. Both are explicit pins.
- Waystones requires Balm >=7.3.28; the pack pins 7.3.44.
- JEI requires MezzConfig; KubeJS requires Rhino and Architectury.
- Dragon Mounts: Legacy is a beta release; its survival acquisition and riding
  need playtesting. No custom egg recipe or dragon progression bypass is added.
- CurseForge fingerprint detection returned an unrelated reupload for GeckoLib.
  That result was discarded and the official GeckoLib project used explicitly.

Pinned project/file IDs and file hashes are in `pack/mods/*.pw.toml`.
There are no automatic updates. Review dependency version ranges when updating.

Sources:
- https://files.minecraftforge.net/net/minecraftforge/forge/promotions_slim.json
- https://modrinth.com/mod/book-of-dragons
- https://www.curseforge.com/minecraft/mc-mods/fauna-engine
- https://www.curseforge.com/minecraft/mc-mods/geckolib
- https://packwiz.infra.link/tutorials/creating/adding-mods/


Alpha.3 removes Dragon Mounts, Kingdom Keys and Touhou Little Maid following user feedback. Shared dependency pins remain unchanged. Dragon Mounts tests above apply only if it is reintroduced.

## Alpha.5 expansion

All 300 pinned files pass hash and mandatory-ID checks. Missing library metadata
was corrected by adding Lodestone, FLIB, Platform and Kleiders Custom Renderer.
AeroBlender is already nested in Deep Aether; no older standalone copy is needed.
AzureLib stays 3.2.0. The alpha.4 Buddycards/Iron's Spells patch targets stay pinned.
The Maven range audit checks 756 mandatory declarations and top-level duplicate
IDs, using the manifest version when mods.toml uses file.jarVersion. It ignores
dependency tables attached to undeclared placeholder IDs (such as examplemod).
This is static inspection, not proof of runtime/mixin/optional compatibility.
