# ADR 001: Estructura del Proyecto

## Contexto

Necesitamos una forma organizada y escalable de versionar múltiples skills y agentes para Claude.

## Decisión

Adoptamos una estructura de directorios modular donde:
- Cada skill tiene su propia carpeta en `skills/`
- Cada agente tiene su propia carpeta en `agents/`
- Cada componente incluye documentación (SKILL.md / AGENT.md)
- La configuración se centraliza en `CONTEXT.md` y `CLAUDE.md`

## Justificación

- **Modularidad**: Cada skill/agente es independiente
- **Escalabilidad**: Fácil agregar nuevos componentes
- **Versionado**: Control de versión semántico por componente
- **Documentación**: Cada componente tiene su propia doc

## Consecuencias

- Más archivos y directorios que mantener
- Necesidad de documentación consistente
- Facilita la reutilización y colaboración

## Estado

✅ Aceptado

## Fecha

2026-05-14
