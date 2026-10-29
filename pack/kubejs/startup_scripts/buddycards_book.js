// Patchouli reads mod book definitions directly during common setup, before
// datapacks. Restore only this rejected definition after common setup finishes.
// Its original page resources are migrated to kubejs/assets by the build script.
StartupEvents.postInit(event => {
  const BookRegistry = Java.loadClass('vazkii.patchouli.common.book.BookRegistry');
  const Book = Java.loadClass('vazkii.patchouli.common.book.Book');
  const Xplat = Java.loadClass('vazkii.patchouli.xplat.IXplatAbstractions');
  const ResourceLocation = Java.loadClass('net.minecraft.resources.ResourceLocation');
  const JsonParser = Java.loadClass('com.google.gson.JsonParser');
  const id = new ResourceLocation('buddycards', 'buddycards_rules');
  const registry = BookRegistry.INSTANCE;
  if (registry.books.containsKey(id)) return;

  const definition = JsonParser.parseString(JSON.stringify({
    name: 'item.buddycards.buddycards_rulebook',
    landing_text: 'Welcome to the Buddycards TCG! This book will cover everything you need to know to play and then some.',
    version: 1,
    creative_tab: 'buddycards',
    book_texture: 'patchouli:textures/gui/book_blue.png',
    model: 'buddycards:buddycards_rulebook',
    show_progress: false,
    use_resource_pack: true
  })).getAsJsonObject();
  const owner = Xplat.INSTANCE.getModContainer('buddycards');
  registry.books.put(id, new Book(definition, owner, id, false));
  console.info('[Wild Realms] Restored Buddycards rules book using migrated resource-pack pages.');
});
