# Mis Skills y Agentes para Claude

Repositorio centralizado para versionar y gestionar skills personalizados y agentes para Claude Code.

## 📁 Estructura

- **`skills/`** — Skills modulares que extienden Claude
- **`agents/`** — Agentes autónomos personalizados
- **`docs/adr/`** — Decisiones arquitectónicas documentadas
- **`CLAUDE.md`** — Guía de integración
- **`CONTEXT.md`** — Modelo de dominio

## 🚀 Skills

| Nombre | Descripción | Versión |
|--------|-------------|---------|
| (Añade tus skills aquí) | | |

## 🤖 Agents

| Nombre | Descripción | Versión |
|--------|-------------|---------|
| (Añade tus agentes aquí) | | |

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
- Ver `docs/adr/` para decisiones arquitectónicas

## 📦 Versionado

Las releases se etiquetan semánticamente:
```bash
git tag -a v1.0.0 -m "Release 1.0.0"
```
