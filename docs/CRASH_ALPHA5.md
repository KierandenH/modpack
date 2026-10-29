# Alpha.5 startup failure — 2026-10-30

The user supplied a Forge crash report and startup log. All 44 reported
dependency failures were inspected. The failure occurred during dependency
discovery, before normal mod initialization or gameplay.

## Cause and evidence

Minecraft scanned the profile while its import was still being populated:

- The supplied log discovered 159 top-level files out of 300 pinned files.
- 141 current files were absent from that discovery list; filesystem creation
  times place 140 of them after the 00:20:46 scan (timestamps have finite precision).
- Citadel arrived at 00:20:55, Blueprint at 00:21:05 and the pinned Curios at
  00:21:26. The dependency check already failed at 00:20:47.
- Forge found a nested Curios 5.6.1 fallback because the external 5.14.1 jar was
  not yet available. Four failures requested newer Curios versions.
- The other failures concern 24 distinct missing IDs: armoroftheages,
  ars_nouveau, attributeslib, blueprint, caelus, citadel, creativecore,
  dawnoftimebuilder, domum_ornamentum, enigmaticlegacy, farmersdelight, flib,
  fzzy_config, lodestone, moogs_structures, moonlight, patchouli, placebo,
  ranged_weapon_api, resourcefulconfig, silentlib, structurize, terrablender,
  and zeta. All are provided by the complete pinned installation.
- A later read-only inspection found all 300 installed jar SHA-1 hashes match
  alpha.5's pins exactly. No jars were missing or corrupt at inspection time.

The many subsequent "Cowardly refusing" event messages are consequences of
the failed dependency state. The GL/driver help banner is generic, not the
recorded cause. Forge internal language/core jars without mods.toml and the
Fragmentum accessTransformers fallback warning are not this fatal failure.
The log does not establish whether other issues will appear later in startup.

## Alpha.6 remediation

Mod pins are unchanged; the error does not justify removing content or changing
library versions. Alpha.6 includes CHECK-INSTALLATION.cmd, a read-only PowerShell
checker and a generated SHA-256 manifest covering all 300 jars and 15 KubeJS
overrides. It rejects missing, partial/corrupt or extra jars and unsafe manifest
paths. The Windows command wrapper uses a process-scoped script execution
option; it does not change a saved policy or launch the game.

This is a manual pre-launch check, not a hook that disables CurseForge's Play
button. Wait for import completion and run the checker before Play.

Regression cases cover complete/missing/corrupt/extra files, bracketed filenames
and path traversal. Export validation verifies the checker/manifest and KubeJS
overrides byte-for-byte. Declared mandatory Maven ranges are checked separately.
No launcher or game has been controlled by the assistant; alpha.6 launch and
gameplay must still be tested by the user.

Only this sanitized diagnosis is committed. Raw logs with account identifiers
and machine details are not uploaded.
