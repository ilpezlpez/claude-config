# Modelo de Dominio y Contexto

Este archivo documenta la terminología y conceptos compartidos en el proyecto.

## Conceptos Clave

### Skill
Una extensión modular de Claude que proporciona una funcionalidad específica. Los skills pueden ser:
- **Engineering skills** — Herramientas para desarrollo de código
- **Productivity skills** — Herramientas de productividad general
- **Custom skills** — Soluciones específicas del proyecto

### Agent
Una entidad autónoma capaz de ejecutar tareas complejas con múltiples pasos. Los agentes pueden:
- Procesar información
- Tomar decisiones
- Reportar resultados

### Versionado
Cada skill y agente debe tener control de versión semántico (MAJOR.MINOR.PATCH).

## Convenciones

- **Nombres en kebab-case**: `mi-skill`, `mi-agente`
- **Directorios**: uno por skill/agente
- **Documentación**: SKILL.md o AGENT.md obligatorio
- **Configuración**: config.json para parámetros

## Decisiones Arquitectónicas

Ver `docs/adr/` para decisiones importantes del proyecto.
