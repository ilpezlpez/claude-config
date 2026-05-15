# Guía de Integración con Claude

Este repositorio contiene skills y agentes personalizados para Claude Code.

## Skills

Los skills están organizados en la carpeta `skills/`. Cada skill es una extensión modular que extiende las capacidades de Claude.

### Estructura de un Skill

```
skills/nombre-skill/
├── SKILL.md          # Documentación del skill
├── index.ts          # Código principal
└── config.json       # Configuración
```

### Cómo usar un skill

Los skills se cargan automáticamente en Claude cuando estén en esta carpeta.

## Agents

Los agentes personalizados están en `agents/`. Son entidades autónomas que pueden ejecutar tareas complejas.

## Documentación

- **CONTEXT.md** — Modelo de dominio y terminología
- **docs/adr/** — Decisiones arquitectónicas documentadas
- **skills/*/SKILL.md** — Documentación específica de cada skill
- **agents/*/AGENT.md** — Documentación específica de cada agente

## Versionado

Usa tags de git para versionar:
```bash
git tag -a v1.0.0 -m "Release 1.0.0"
git push origin v1.0.0
```
