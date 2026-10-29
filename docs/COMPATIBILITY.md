# Alpha.4 compatibility repairs

These repairs target the pinned Buddycards 4.3.2, Patchouli 85, KubeJS
2001.6.5-build.26 and Iron's Spells 3.16.3 on Forge Minecraft 1.20.1.
No third-party jars are modified, redistributed or newly added.

## Buddycards rules book

Patchouli reads the original mod's book.json directly during common setup;
a datapack-only replacement cannot correct its missing use_resource_pack flag.
The KubeJS postInit hook restores the rejected buddycards:buddycards_rules
registration with that flag enabled, retaining its owner, identity and model.
It leaves an already valid registration alone. Eleven original JSON resources
(two categories and nine entries) are copied unchanged into kubejs/assets.

The original rejection may still be logged before the repair runs. The later
"Restored Buddycards rules book" message distinguishes successful registration.
This message alone does not prove the pages render or the item opens in-game.
No runtime test has been performed for alpha.4.

## Iron's Spells loot

- crypt_loot: replace the invalid loot-table-reference field value with name
  for magic_items/reward_ink, preserving all pools, rolls, conditions and items.
- citadel_tomes: replace twelve unsupported set_written_book_pages functions
  with 1.20.1 set_nbt functions. Each written book has its original translated
  page component/formatting, a title and author metadata (Unknown). Original
  translated display names, pool rolls and selection weights are retained.

Overrides are in kubejs/data, so they apply to each world's server resources.
They do not refill previously opened chests or repair existing saved books.

## Rebuild and checks

Run Verify-Mods.ps1 first on a fresh checkout to populate the hash-checked cache.
Build-Pack.ps1 regenerates overrides from pinned jars and runs compatibility
checks before export. Verify-Compatibility.ps1 compares migrated resources,
checks preserved lore components and unchanged loot selection, and runs the
startup script against mocked Java APIs for missing/already valid books.
The exporter checks every KubeJS override is included byte-for-byte.
These are file and mocked-script checks, not a live Forge/Rhino or gameplay test.

Upstream JSON assets remain their authors' content; no project-wide license is
assigned to them. Regenerate/review these targeted repairs when updating pins.

Reference: [Patchouli 1.20 migration guide](https://vazkiimods.github.io/Patchouli/docs/upgrading/upgrade-guide-120/).
Registration/lifecycle behavior was also checked against the pinned jar APIs
and bytecode, including KubeJS postInit at FMLLoadCompleteEvent after Patchouli's
FMLCommonSetupEvent registration pass.
