# Wild Realms Compatibility 1.0.0

Small project-owned Forge 1.20.1 mod. Build from source with
`scripts/Build-CompatMod.ps1` (also run by Build-Pack.ps1). Uses the local Java 17,
Forge 47.4.28 JavaFML annotation and Mixin 0.8.5 library. No dependency classes
are redistributed. The generated jar is ignored in Git and bundled as a pack
override; it is the only jar permitted in the release archive.

The client-only mixin cancels JEI's private zero-argument
`AnvilRecipeMaker.getBookEnchantmentRecipes()` method. It avoids exhaustive
item/enchantment/level simulations when JEI registers recipes. It returns an
empty preview stream; vanilla repair previews still run. Normal anvil use,
enchanting and modded combat behavior are not targeted.

Tradeoff: JEI no longer enumerates those generated enchanted-book application
previews. Other mods may independently add their own previews.

Bound to exact JEI 15.74.0.233 in metadata and verified SHA-1 at build time.
Compilation, target descriptor, callback cancellation and release bytes are
checked. Mixin requires exactly the specified method to be present; a future
JEI update needs review. No live Forge/mixin application or gameplay pass is
claimed from the callback test alone.

Evidence: all three user capture samples from alpha.11 show the render thread
inside that enumeration. Multiple enchantment/anvil hooks appear; this does not
prove any individual enchantment mod is defective. See docs/INVENTORY_FREEZE.md.

License: MIT (see LICENSE).
