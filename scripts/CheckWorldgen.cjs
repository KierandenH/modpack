// Conservative union across dimensions. Reports candidates, not proven runtime compatibility.
const fs = require('node:fs');
const data = JSON.parse(fs.readFileSync(process.argv[2], 'utf8').replace(/^\uFEFF/, ''));
const allBiomes = data.biomes;
function resolveTag(id, visited = new Set()) {
  if (visited.has(id)) return [];
  visited.add(id);
  return (data.tags?.[id] || []).filter(Boolean).flatMap(v => {
    const s = typeof v === 'string' ? v : v.id;
    return s.startsWith('#') ? resolveTag(s.slice(1), visited) : [s];
  });
}
const groups = new Map();
for (const tag of ['minecraft:is_overworld', 'minecraft:is_nether', 'minecraft:is_end']) {
  const ids = new Set(resolveTag(tag));
  groups.set(tag, allBiomes.filter(b => ids.has(b.id)));
}
for (const dimension of data.dimensions || []) {
  const ids = new Set(dimension.text.match(/[a-z0-9_.-]+:[a-z0-9_./-]+/g));
  groups.set(dimension.id, allBiomes.filter(b => ids.has(b.id)));
}
// Namespace groups also check internally ordered definitions when dimension membership is unknown.
for (const b of allBiomes) {
  const group = 'namespace:' + b.id.split(':')[0];
  if (!groups.has(group)) groups.set(group, []);
  groups.get(group).push(b);
}
const output = [`Static worldgen audit: ${data.jars} pinned jars; ${allBiomes.length} biome JSON definitions.`,
  `Biome modifier JSON files inventoried but NOT applied: ${data.modifiers}.`,
  'Checks direct feature sequences grouped by dimension tags, explicit dimension references and mod namespace.',
  'Not covered: Java injections, effective datapack overrides/replacements, vanilla definitions, runtime registries, mixins, or unlisted cross-mod dimension membership.',
  'Tag membership is a conservative approximation, not the runtime biome-source registry.',
  'No detected cycle is NOT a guarantee of gameplay compatibility.'];
let failures = 0;
for (const [group, biomes] of groups) {
if (!biomes.length) continue;
data.biomes = biomes;
const graph = new Map(), owners = new Map();
let unresolved = 0;
for (const biome of data.biomes) {
  for (const [step, features] of (biome.features || []).entries()) {
    let previous;
    for (const feature of features) {
      if (typeof feature !== 'string' || feature.startsWith('#')) { unresolved++; continue; }
      const key = `${step}:${feature}`;
      if (!graph.has(key)) graph.set(key, new Set());
      if (previous && previous !== key) {
        graph.get(previous).add(key);
        const edge = `${previous}>${key}`;
        if (!owners.has(edge)) owners.set(edge, new Set());
        owners.get(edge).add(biome.id);
      }
      previous = key;
    }
  }
}
// Tarjan SCC: report every cyclic component, not just the first failure.
let next = 0;
const indices = new Map(), low = new Map(), stack = [], active = new Set(), cycles = [];
function visit(v) {
  indices.set(v, next); low.set(v, next++); stack.push(v); active.add(v);
  for (const w of graph.get(v)) {
    if (!indices.has(w)) { visit(w); low.set(v, Math.min(low.get(v), low.get(w))); }
    else if (active.has(w)) low.set(v, Math.min(low.get(v), indices.get(w)));
  }
  if (low.get(v) === indices.get(v)) {
    const component = []; let w;
    do { w = stack.pop(); active.delete(w); component.push(w); } while (w !== v);
    if (component.length > 1) cycles.push(component.sort());
  }
}
for (const v of graph.keys()) if (!indices.has(v)) visit(v);
const lines = [
  `Static worldgen audit: ${data.jars} pinned jars, ${data.biomes.length} biome JSON definitions, ${graph.size} step/feature nodes.`,
  `Potential cyclic components: ${cycles.length}. Unresolved inline/tag entries: ${unresolved}.`,
  `Biome modifier JSON files inventoried but NOT applied: ${data.modifiers}.`,
  'Scope: direct feature ordering in jar biome JSON; conservative union across dimensions.',
  'Not covered: Java-injected features, tags/inline holders, effective datapack overrides, vanilla definitions, mixins or runtime registry changes.',
  'PASS here is not a guarantee of successful world generation; user gameplay testing is required.'
];
for (const component of cycles) {
  const members = new Set(component), sources = new Set();
  for (const a of component) for (const b of graph.get(a)) if (members.has(b)) {
    for (const source of owners.get(`${a}>${b}`) || []) sources.add(source);
  }
  lines.push('', 'Cyclic component members (not an ordered path): ' + component.join(', '), 'Sources: ' + [...sources].sort().join(', '));
}
output.push(`${group}: ${biomes.length} biomes, ${cycles.length} cyclic components, ${unresolved} unresolved inline/tag features.`);
if (cycles.length) output.push(...lines.slice(6));
failures += cycles.length;
}
fs.writeFileSync(process.argv[3], output.join('\n') + '\n');
console.log(output.join('\n'));
process.exitCode = failures ? 1 : 0;
