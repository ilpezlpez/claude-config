# 📦 Guía de Instalación

Cómo descargar e instalar todos los agentes y skills personalizados en tu ambiente de Claude Code.

## ✅ Requisitos previos

- **Claude Code** instalado (CLI, app desktop, o web)
- **Git** instalado
- Terminal acceso a tu home directory (`~`)

## 🚀 Instalación rápida

### 1. Clonar el repositorio

```bash
git clone https://github.com/ilpezlpez/claude-config.git ~/claude-config
cd ~/claude-config
```

### 2. Instalar agentes

Copia todos los agentes a tu directorio personal de Claude:

```bash
# Para usuarios globales (recomendado)
cp agents/*.md ~/.claude/agents/

# O si prefieres solo para este proyecto:
mkdir -p .claude/agents
cp agents/*.md .claude/agents/
```

**Resultado:**
```bash
~/.claude/agents/
├── code-reviewer.md
├── developer.md
├── architect.md
├── qa-engineer.md
├── setup-validator.md
├── azure-manager.md
└── nmm-golden-demon-critic.md
```

### 3. Instalar skills

Copia los skills al directorio de skills de Claude:

```bash
# Para instalación global (recomendado)
mkdir -p ~/.agents/skills
cp -r skills/* ~/.agents/skills/

# O para crear symlinks en ~/.claude/skills:
mkdir -p ~/.claude/skills
cd ~/.claude/skills
for skill in ../../../.agents/skills/*; do
  ln -sf "$skill" "$(basename "$skill")"
done
```

**Resultado:**
```bash
~/.agents/skills/
├── caveman/
├── diagnose/
├── tdd/
├── prototype/
├── grill-me/
├── grill-with-docs/
├── handoff/
├── obsidian-vault/
├── improve-codebase-architecture/
├── triage/
├── to-issues/
├── to-prd/
├── edit-article/
├── write-a-skill/
├── setup-matt-pocock-skills/
└── zoom-out/
```

### 4. Verificar instalación

Abre Claude Code y revisa:

```bash
# Ver agentes disponibles
/agents

# O verifica que existen:
ls ~/.claude/agents/
ls ~/.agents/skills/
```

Deberías ver tus 7 agentes y 17 skills listados.

---

## 🔧 Instalación manual (paso a paso)

Si prefieres más control sobre qué instalar:

### Opción A: Solo agentes

```bash
# Copiar agentes individuales
cp agents/code-reviewer.md ~/.claude/agents/
cp agents/developer.md ~/.claude/agents/
cp agents/architect.md ~/.claude/agents/
# ... etc
```

### Opción B: Solo skills

```bash
# Copiar skills individuales
cp -r skills/diagnose ~/.agents/skills/
cp -r skills/tdd ~/.agents/skills/
# ... etc
```

### Opción C: Por categoría

```bash
# Solo Engineering skills
cp -r skills/{diagnose,tdd,prototype,grill-me,grill-with-docs,triage,to-issues,to-prd,improve-codebase-architecture} ~/.agents/skills/

# Solo Communication skills
cp -r skills/{caveman,handoff,obsidian-vault,zoom-out} ~/.agents/skills/

# Solo Content skills
cp -r skills/{edit-article,write-a-skill} ~/.agents/skills/
```

---

## 🔗 Actualizar desde GitHub

Si hay actualizaciones, simplemente haz pull y reinstala:

```bash
cd ~/claude-config
git pull origin main

# Reinstalar (sobrescribe archivos viejos)
cp agents/*.md ~/.claude/agents/
cp -r skills/* ~/.agents/skills/
```

---

## 📝 Personalizar por proyecto

Si quieres tener agentes/skills **solo para un proyecto específico**:

```bash
cd tu-proyecto/
mkdir -p .claude/agents .claude/skills

# Copiar agentes específicos
cp ~/claude-config/agents/code-reviewer.md .claude/agents/
cp ~/claude-config/agents/developer.md .claude/agents/

# Copiar skills específicos
cp -r ~/claude-config/skills/diagnose .claude/skills/
```

Claude usará:
1. Primero `.claude/` del proyecto (local)
2. Si no encuentra, busca en `~/.claude/` (global)

---

## 🆘 Troubleshooting

### Los agentes no aparecen en `/agents`

**Solución:** Verifica que los archivos estén en el lugar correcto:

```bash
# Debe existir
ls ~/.claude/agents/code-reviewer.md

# Si no existe, instála manualmente
cp ~/claude-config/agents/code-reviewer.md ~/.claude/agents/
```

### Los skills no funcionan

**Solución:** Verifica permisos y ubicación:

```bash
# Los skills deben estar aquí
ls ~/.agents/skills/diagnose/

# Si falta, cópialo
cp -r ~/claude-config/skills/diagnose ~/.agents/skills/
```

### Conflicto: ya tengo agentes/skills viejos

**Solución:** Respalda los viejos y reemplaza:

```bash
# Respaldar viejos
mv ~/.claude/agents ~/.claude/agents.backup
mkdir -p ~/.claude/agents

# Instalar nuevos
cp ~/claude-config/agents/*.md ~/.claude/agents/
```

---

## 📚 Documentación después de instalar

Una vez instalado, revisa:

- **[SLASH-COMMANDS.md](./SLASH-COMMANDS.md)** — Cómo usar cada comando
- **[CLAUDE.md](./CLAUDE.md)** — Guía de integración
- **[README.md](./README.md)** — Inventario de agentes y skills
- **`agents/*.md`** — Documentación de cada agente
- **`skills/*/SKILL.md`** — Documentación de cada skill

---

## ✨ Próximos pasos

1. ✅ Instalar agentes y skills
2. 📖 Leer [SLASH-COMMANDS.md](./SLASH-COMMANDS.md)
3. 🧪 Probar un comando: `/diagnose "mi primer bug"`
4. 🤖 Forzar un agente: `@developer "implementa algo"`
5. 📝 Personalizar según tus necesidades

---

## 💡 Tips

- **Instala globalmente** (`~/.claude/`) si quieres usar en múltiples proyectos
- **Instala localmente** (`.claude/`) si quieres versiones distintas por proyecto
- **Actualiza regularmente** desde este repo para beneficiarte de mejoras
- **Lee la docs** de cada skill/agente antes de usarlo

---

## 🔗 Relacionado

- [GitHub Repository](https://github.com/ilpezlpez/claude-config)
- [SLASH-COMMANDS.md](./SLASH-COMMANDS.md)
- [CLAUDE.md](./CLAUDE.md)
- [Agentes Personalizados (en Obsidian)](obsidian://vault/Claude/02-Extensibilidad/Agentes/Agentes%20Personalizados)
