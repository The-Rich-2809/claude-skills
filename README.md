# claude-skills

Backup versionado de mis skills y plugins de Claude Code, para reproducir el mismo
setup en cualquier máquina (PC, Mac, etc.).

No contiene el código de las skills, solo las "recetas" para reinstalarlas desde
sus repos de origen (vía [`skills`](https://skills.sh/)) y los plugins/marketplaces
de Claude Code.

## Instalar en una máquina nueva

Requiere Node.js y el CLI `claude` ya instalados.

```bash
git clone https://github.com/The-Rich-2809/claude-skills.git
cd claude-skills
./install.sh
```

Reinicia Claude Code al terminar.

## Actualizar este repo (desde la máquina donde agregaste algo)

```bash
cp ~/skills-lock.json skills-lock.json
# y si agregaste/quitaste un plugin, edita plugins.json a mano
git add -A
git commit -m "sync skills"
git push
```

Luego, en las otras máquinas: `git pull && ./install.sh`.
