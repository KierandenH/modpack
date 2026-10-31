import java.util.stream.Stream;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;
import wildrealms.compat.JeiAnvilMixin;

public class PreviewTest {
    public static void main(String[] args) throws Exception {
        Object instance = new JeiAnvilMixin() {};
        var method = JeiAnvilMixin.class.getDeclaredMethod("wildrealms$skipExhaustiveBookPreviews", CallbackInfoReturnable.class);
        method.setAccessible(true);
        var result = new CallbackInfoReturnable<Stream<?>>("test", true);
        method.invoke(instance, result);
        if (!result.isCancelled() || result.getReturnValue().count() != 0) throw new AssertionError("Preview not bypassed");
        System.out.println("PASS: injection callback cancels exhaustive preview generation with an empty stream. Runtime mixin application still needs user testing.");
    }
}
