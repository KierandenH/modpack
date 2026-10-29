// Exercise the shipped script with Java API stand-ins, without starting the game.
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const assert = require('node:assert/strict');
const script = fs.readFileSync(path.join(__dirname, '../pack/kubejs/startup_scripts/buddycards_book.js'), 'utf8');
for (const existing of [false, true]) {
  let callback, restored, logged = false;
  const owner = {};
  const classes = {
    'vazkii.patchouli.common.book.BookRegistry': { INSTANCE: { books: {
      containsKey: id => { assert.equal(id.value, 'buddycards:buddycards_rules'); return existing; },
      put: (id, book) => { restored = book; }
    } } },
    'vazkii.patchouli.common.book.Book': function (definition, mod, id, external) {
      assert.equal(mod, owner);
      assert.equal(external, false);
      assert.equal(definition.use_resource_pack, true);
      assert.equal(definition.model, 'buddycards:buddycards_rulebook');
      this.definition = definition;
    },
    'vazkii.patchouli.xplat.IXplatAbstractions': { INSTANCE: { getModContainer: id => { assert.equal(id, 'buddycards'); return owner; } } },
    'net.minecraft.resources.ResourceLocation': function (namespace, name) { this.value = `${namespace}:${name}`; },
    'com.google.gson.JsonParser': { parseString: s => ({ getAsJsonObject: () => JSON.parse(s) }) }
  };
  vm.runInNewContext(script, {
    StartupEvents: { postInit: f => { callback = f; } },
    Java: { loadClass: name => { assert.ok(classes[name], name); return classes[name]; } },
    console: { info: () => { logged = true; } }
  });
  assert.equal(restored, undefined, 'Repair must wait for postInit');
  callback({});
  assert.equal(Boolean(restored), !existing);
  assert.equal(logged, !existing);
}
console.log('PASS: book startup repair registers missing book and preserves an already valid registration (mock APIs).');
