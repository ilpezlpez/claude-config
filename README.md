# Mis Skills y Agentes para Claude

Repositorio centralizado para versionar y gestionar skills personalizados y agentes para Claude Code.

## 📁 Estructura

- **`skills/`** — Skills modulares que extienden Claude
- **`agents/`** — Agentes autónomos personalizados
- **`docs/adr/`** — Decisiones arquitectónicas documentadas
- **`CLAUDE.md`** — Guía de integración
- **`CONTEXT.md`** — Modelo de dominio
- **`INSTALLATION.md`** — Cómo instalar agentes y skills
- **`SLASH-COMMANDS.md`** — Referencia de comandos

## 🚀 Skills (17 personalizados)

| Nombre | Descripción |
|--------|-------------|
| **diagnose** | Debug bugs y regressions con loop estructurado |
| **tdd** | Test-driven development: red-green-refactor |
| **prototype** | Prototypes de UI o validación de data models |
| **grill-me** | Stress-test planes hasta shared understanding |
| **grill-with-docs** | Validar contra CONTEXT.md + ADRs |
| **triage** | Revisar issues a través state machine |
| **to-issues** | Convertir specs en issues grabables |
| **to-prd** | Crear PRD desde conversación |
| **improve-codebase-architecture** | Encontrar oportunidades de refactoring |
| **caveman** | Ultra-compressed: 75% menos tokens |
| **handoff** | Compact handoff document para otro agente |
| **obsidian-vault** | Gestionar notas en Obsidian |
| **edit-article** | Mejorar artículos y documentación |
| **write-a-skill** | Crear nuevos skills |
| **setup-matt-pocock-skills** | Setup de skills recomendados |
| **zoom-out** | Perspectiva amplia del proyecto |

## 🤖 Agentes (7 especializados)

| Nombre | Modelo | Especialidad |
|--------|--------|--------------|
| **code-reviewer** | Haiku | Revisa código, bugs, vulnerabilidades |
| **developer** | Sonnet | Implementa features, refactoring, tests |
| **setup-validator** | Sonnet | Valida instalaciones y configuraciones |
| **architect** | Sonnet | Diseña arquitectura, ADRs, escalabilidad |
| **qa-engineer** | Sonnet | Testing, cobertura, edge cases |
| **azure-manager** | Sonnet | Sprint planning, tareas, documentación |
| **nmm-golden-demon-critic** | Sonnet | Crítica experta en técnicas de pintura NMM |

## ⚡ Instalación rápida

### 🍎 macOS
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/ilpezlpez/claude-config/main/scripts/install-mac.sh)
```

### 🪟 Windows
```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/ilpezlpez/claude-config/main/scripts/install-windows.ps1 | iex"
```

O ver [scripts/README.md](./scripts/README.md) para más opciones.

---

## 📝 Guía Rápida

### Crear un nuevo skill

1. Crea una carpeta en `skills/nombre-skill/`
2. Añade `SKILL.md`, `index.ts`, `config.json`
3. Documenta en `SKILL.md`
4. Haz commit y push

### Crear un nuevo agente

1. Crea una carpeta en `agents/nombre-agente/`
2. Añade `AGENT.md` e implementación
3. Documenta el propósito y uso
4. Versionalo en git

## 📚 Documentación

- Ver [CLAUDE.md](./CLAUDE.md) para detalles de integración
- Ver [CONTEXT.md](./CONTEXT.md) para terminología
- Ver [SLASH-COMMANDS.md](./SLASH-COMMANDS.md) para lista de comandos
- Ver `docs/adr/` para decisiones arquitectónicas

## 📦 Versionado

Las releases se etiquetan semánticamente:
```bash
git tag -a v1.0.0 -m "Release 1.0.0"
```
