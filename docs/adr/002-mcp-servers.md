# ADR 002: Incluir MCP Servers en claude-config

## Contexto

Tenemos servidores MCP (Model Context Protocol) personalizados que extienden las capacidades de Claude Code. Necesitamos decidir cómo versionarlos y distribuirlos.

## Opciones consideradas

1. **Repositorio separado** — Cada MCP server en su propio repo
2. **Incluir en claude-config** — Todos en la carpeta `mcp-servers/`
3. **Distribuir como paquete npm** — NPM registry

## Decisión

**Incluir en `mcp-servers/`** como parte de `claude-config`.

## Justificación

- **Cohesión**: Los MCP servers son extensiones de Claude Code, como los agentes y skills
- **Versionado centralizado**: Todo en un repo, un punto de distribución
- **Instalación simple**: Usuario clona una vez, obtiene todo
- **Mantenimiento**: No fragmentar la configuración en múltiples repos
- **Escalabilidad**: Patrón claro para agregar nuevos servidores

## Consecuencias

### Positivas
- ✅ Una sola fuente de verdad para toda la configuración de Claude
- ✅ Histórico completo de cambios
- ✅ Instalación automática con scripts
- ✅ Fácil de mantener y actualizar

### Negativas
- ❌ Repo puede crecer con entornos virtuales (mitigado con .gitignore)
- ❌ Requiere .gitignore disciplinado para evitar archivos grandes

## Mitigaciones

- ✅ `.gitignore` excluye `.venv/`, `__pycache__/`, `.pyc`, etc.
- ✅ Cada server documenta su instalación en `MCP-SERVER.md`
- ✅ Los scripts de instalación incluyen setup de venv

## Estructura resultante

```
claude-config/
├── agents/           (agentes personalizados)
├── skills/           (skills personalizados)
├── mcp-servers/      (servidores MCP)
│   ├── imagen-google/
│   ├── [próximos servers]
│   └── README.md     (guía de MCP servers)
├── scripts/          (instaladores)
└── docs/adr/         (decisiones)
```

## Estado

✅ Aceptado

## Fecha

2026-05-14

## Relacionado

- [[ADR 001: Estructura del Proyecto]]
- [[mcp-servers/README.md]]
- [[INSTALLATION.md]]
