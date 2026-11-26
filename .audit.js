const fs = require('fs');
const path = require('path');
const root = __dirname;
const skipDirs = new Set(['.git', 'node_modules']);
const files = [];
function walk(dir) {
  for (const ent of fs.readdirSync(dir, { withFileTypes: true })) {
    if (skipDirs.has(ent.name)) continue;
    const p = path.join(dir, ent.name);
    if (ent.isDirectory()) walk(p);
    else if (/\.(js|html|php|sql|css|md|yml|yaml|cjs|py|json)$/.test(ent.name)) files.push(p);
  }
}
walk(root);

const refs = new Set();
const apiRefs = new Set();
const pageRefs = new Set();
for (const file of files) {
  const rel = path.relative(root, file);
  if (rel === '.audit.js') continue;
  const s = fs.readFileSync(file, 'utf8');
  for (const m of s.matchAll(/(?:src|href)\s*=\s*["']([^"']+)["']/g)) refs.add(m[1]);
  for (const m of s.matchAll(/url\(\s*["']?([^"')]+)["']?\s*\)/g)) refs.add(m[1]);
  for (const m of s.matchAll(/["'](\/uploads\/[^"']+)["']/g)) refs.add(m[1]);
  for (const m of s.matchAll(/["'](assets\/[^"']+)["']/g)) refs.add(m[1]);
  for (const m of s.matchAll(/fetch\(\s*["']([^"']+)["']/g)) apiRefs.add(m[1]);
  for (const m of s.matchAll(/location\.href\s*=\s*["']([^"']+)["']/g)) refs.add(m[1]);
  for (const m of s.matchAll(/data-page=["']([^"']+)["']/g)) pageRefs.add(m[1]);
  for (const m of s.matchAll(/go:([A-Za-z0-9_-]+)/g)) pageRefs.add(m[1]);
}

function clean(u) {
  return String(u || '').split('#')[0].split('?')[0];
}
function existsRef(u) {
  u = clean(u);
  if (!u || u.startsWith('http') || u.startsWith('data:') || u.startsWith('mailto:') || u.startsWith('tel:') || u.startsWith('javascript:')) return true;
  if (u.startsWith('/')) return fs.existsSync(path.join(root, u));
  return fs.existsSync(path.join(root, u));
}

const missing = [...refs].filter(u => !existsRef(u)).sort();
const apiMissing = [...apiRefs].filter(u => u.startsWith('api/') && !fs.existsSync(path.join(root, u))).sort();
const htmlPages = new Set(files.filter(f => f.endsWith('.html')).map(f => path.basename(f, '.html')));
const knownPages = new Set(['home', 'index', 'services', 'barbers', 'gallery', 'membership', 'contact', 'login', 'booking', 'client', 'admin', 'branch', 'confirmation']);
const badPages = [...pageRefs].filter(p => !knownPages.has(p) && !htmlPages.has(p)).sort();

console.log('files scanned:', files.length);
console.log('asset/page refs:', refs.size, 'missing:', missing.length);
missing.forEach(u => console.log('  MISSING REF', u));
console.log('api refs:', apiRefs.size, 'missing:', apiMissing.length);
apiMissing.forEach(u => console.log('  MISSING API', u));
console.log('page refs:', pageRefs.size, 'unknown:', badPages.length);
badPages.forEach(p => console.log('  UNKNOWN PAGE', p));

// SQL payload image refs
for (const sqlFile of ['gents_db.sql', 'gents_cleanup.sql']) {
  const p = path.join(root, sqlFile);
  if (!fs.existsSync(p)) continue;
  const s = fs.readFileSync(p, 'utf8');
  const m = s.match(/site_data[\s\S]*?VALUES \(1, '([\s\S]*?)'\);/);
  if (!m) { console.log(sqlFile, ': no site_data payload found'); continue; }
  let raw = m[1];
  const q = String.fromCharCode(39);
  raw = raw.split(q + q).join(q);
  let payload;
  try { payload = JSON.parse(raw); } catch (e) { console.log(sqlFile, ': payload parse failed', e.message); continue; }
  const urls = new Set();
  function collect(v) {
    if (typeof v === 'string' && v.startsWith('/uploads/')) urls.add(v);
    else if (Array.isArray(v)) v.forEach(collect);
    else if (v && typeof v === 'object') Object.values(v).forEach(collect);
  }
  collect(payload);
  const missingUploads = [...urls].filter(u => !fs.existsSync(path.join(root, u))).sort();
  console.log(sqlFile, 'payload upload refs:', urls.size, 'missing:', missingUploads.length);
  missingUploads.forEach(u => console.log('  MISSING UPLOAD', u));
}
