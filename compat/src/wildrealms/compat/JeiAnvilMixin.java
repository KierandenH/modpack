package wildrealms.compat;

import java.util.stream.Stream;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

// JEI previews only. Never targets Minecraft's actual anvil or enchanting logic.
@Mixin(targets = "mezz.jei.library.plugins.vanilla.anvil.AnvilRecipeMaker", remap = false)
public abstract class JeiAnvilMixin {
    @Inject(method = "getBookEnchantmentRecipes()Ljava/util/stream/Stream;",
            at = @At("HEAD"), cancellable = true, remap = false, require = 1)
    private void wildrealms$skipExhaustiveBookPreviews(CallbackInfoReturnable<Stream<?>> result) {
        result.setReturnValue(Stream.empty());
    }
}
