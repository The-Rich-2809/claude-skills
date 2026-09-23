#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

echo "== Restaurando skills personales (npx skills) =="
cp skills-lock.json ~/skills-lock.json
(cd ~ && npx skills experimental_install)

echo "== Restaurando marketplaces y plugins de Claude Code =="
node -e '
const d = require("./plugins.json");
const { execSync } = require("child_process");
for (const m of Object.values(d.marketplaces)) {
  console.log("-> marketplace add", m.source.repo);
  execSync(`claude plugin marketplace add ${m.source.repo}`, { stdio: "inherit" });
}
for (const p of Object.keys(d.enabledPlugins)) {
  console.log("-> install", p);
  execSync(`claude plugin install ${p}`, { stdio: "inherit" });
}
'

echo "Listo. Reinicia Claude Code para que cargue los plugins nuevos."
