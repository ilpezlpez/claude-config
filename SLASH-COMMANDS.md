# Slash Commands Personalizados

Comandos disponibles en Claude Code para invocar tus skills y agentes personalizados.

## 🛠️ Engineering & Development

| Comando | Skill | Descripción | Uso |
|---------|-------|-------------|-----|
| `/diagnose` | diagnose | Bug report o regression: reproduce → minimise → hypothesise → instrument → fix | Cuando encuentras un bug |
| `/tdd` | tdd | Test-driven development: red-green-refactor loop | Implementar features con tests |
| `/prototype` | prototype | Prototype UI o validar data models antes de commitear | Explorar diseños rápidamente |
| `/grill-me` | grill-me | Stress-test plan o design: interview exhaustivo | Validar propuestas |
| `/grill-with-docs` | grill-with-docs | Grilling contra CONTEXT.md + ADRs | Sharpen terminology, update docs |
| `/triage` | triage | Review incoming issues a través state machine | Triagear issues |
| `/to-issues` | to-issues | Break plan/spec/PRD en issues independientes | Convertir plan en tareas |
| `/to-prd` | to-prd | Convertir conversación en PRD | Crear specs formales |
| `/improve-codebase-architecture` | improve-codebase-architecture | Encontrar oportunidades de refactoring | Mejorar arquitectura |

## 📊 Visualization

| Comando | Skill | Descripción | Uso |
|---------|-------|-------------|-----|
| `/ascii-diagrams` | ascii-diagrams | Convertir texto en diagramas ASCII | Flowcharts, arquitectura, UML |
| `/mermaid-diagrams` | mermaid-diagrams | Convertir texto en código Mermaid | Diagramas complejos con ciclos |

## 🗣️ Communication & Navigation

| Comando | Skill | Descripción | Uso |
|---------|-------|-------------|-----|
| `/caveman` | caveman | Ultra-compressed mode: 75% token reduction | Cuando necesitas ser breve |
| `/handoff` | handoff | Compact conversation en handoff document | Pasar trabajo a otro agente |
| `/obsidian-vault` | obsidian-vault | Search/create/organize notas en Obsidian | Gestionar knowledge base |
| `/zoom-out` | zoom-out | Perspectiva amplia del proyecto | Ver el big picture |

## ✍️ Content & Documentation

| Comando | Skill | Descripción | Uso |
|---------|-------|-------------|-----|
| `/edit-article` | edit-article | Mejorar artículos: restructure, clarity, prose | Editar documentación |
| `/write-a-skill` | write-a-skill | Crear nuevo agent skill con estructura | Crear skills propios |

## ⚙️ Setup & Config (Built-in)

| Comando | Descripción | Ubicación |
|---------|-------------|-----------|
| `/update-config` | Configurar Claude Code via settings.json | Built-in |
| `/update-memory` | Gestionar memoria persistente | Built-in |
| `/init` | Initialize CLAUDE.md | Built-in |
| `/schedule` | Crear routines programadas | Built-in |
| `/loop` | Ejecutar comando en intervalo | Built-in |
| `/help` | Ver ayuda de Claude Code | Built-in |

## 🤖 Agentes (Invocación explícita)

Fuerza un agente específico con `@nombre`:

```bash
@code-reviewer "revisa esto"
@developer "implementa esto"
@architect "diseña esto"
@qa-engineer "estrategia testing"
@setup-validator "valida instalación"
@azure-manager "crea user story"
@nmm-golden-demon-critic "crítica mi pintura"
```

## Code Review & Security (Built-in)

| Comando | Descripción |
|---------|-------------|
| `/review` | Revisar pull request |
| `/security-review` | Auditoría de seguridad |
| `/simplify` | Simplificar código |

## API & Integrations (Built-in)

| Comando | Descripción |
|---------|-------------|
| `/claude-api` | Build/debug Claude API apps |

## 📝 Ejemplos de uso

### Debug un bug
```bash
/diagnose "el login no funciona con 2FA"
```

### Diseñar arquitectura
```bash
@architect "¿monolito o microservicios para nuestro caso?"
```

### Crear features con tests
```bash
/tdd "implementa carrito de compras"
```

### Revisar código
```bash
@code-reviewer "revisa src/auth.js"
```

### Crear issues desde un plan
```bash
/to-issues "plan de migración a TypeScript"
```

### Stress-test un diseño
```bash
/grill-me "¿es buena idea usar GraphQL aquí?"
```

## 🔗 Relacionado

- [[Skill Index]] — Documentación detallada de cada skill
- [[Agentes Personalizados]] — Cómo funcionan los agentes
- [[CLAUDE.md]] — Guía de integración
