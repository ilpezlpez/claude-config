# claude-config: Guía de Desarrollo

Repositorio centralizado para agentes personalizados (7), skills (21), y MCP servers (1).

## Estructura rápida

```
agents/              → 7 agentes .md (code-reviewer, developer, architect, etc.)
skills/              → 21 skills organizados en carpetas (SKILL.md por skill)
mcp-servers/         → Servidores MCP (imagen-google: generar imágenes)
scripts/             → install-mac.sh, install-windows.ps1
docs/adr/            → Decisiones arquitectónicas
```

## Agregar un nuevo skill

1. **Crear carpeta:** `mkdir skills/nombre-skill`
2. **Crear SKILL.md:** Copiar estructura de skill existente
3. **Pasos numerados:** 6-8 pasos claros, ejecutables por Claude
4. **Documentar variables:** Qué entra, qué sale
5. **Actualizar README.md:** Incrementar count de skills
6. **Actualizar SLASH-COMMANDS.md:** Agregar comando + ejemplo
7. **Commit:** `feat: crear skill /nombre-skill`

## Patrón SKILL.md

```markdown
Eres un experto en X...

<instrucciones_usuario>
$ARGUMENTS
</instrucciones_usuario>

Sigue estos pasos...

---

## Paso 1 — Analizar entrada
...

---

## Paso 2 — [Siguiente paso]
...
```

**Características:**
- System prompt claro
- `$ARGUMENTS` para entrada del usuario
- Pasos numerados con `---` divisores
- Secciones ejecutables (bash, Python, etc.)
- Tabla final con wikilinks

## Pintura: 4 skills especializados

**Todos aceptan:**
- Imágenes: rutas locales, vault, **URLs (Instagram/internet descargadas con curl)**
- Preguntas: temperatura (cálida/fría/neutral) + artista (múltiples opciones)
- Guardan: **prompt original + optimizado** en nota.md del vault

**Skills:**
1. `/generar-ref` — Genera imagen IA para miniatura
2. `/evaluar-ref` — Crítica experta (Golden Demon)
3. `/esquema-colores` — Paleta Citadel+Vallejo para miniatura
4. `/esquema-digital` — Paleta digital+modos para concept art

## MCP: imagen-google

**Ubicación:** `mcp-servers/imagen-google/`

**Setup:**
```bash
cd mcp-servers/imagen-google
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
claude mcp add imagen-google -s user \
  -e GEMINI_API_KEY="${GEMINI_API_KEY}" \
  -- $(pwd)/.venv/bin/python $(pwd)/imagen_mcp.py
```

**Uso:** Generar imágenes con Google Imagen v3/v4

## Instalación para otros usuarios

**One-liner macOS:**
```bash
bash <(curl -fsSL https://github.com/ilpezlpez/claude-config/raw/main/scripts/install-mac.sh)
```

**One-liner Windows:**
```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://github.com/ilpezlpez/claude-config/raw/main/scripts/install-windows.ps1 | iex"
```

## Decisiones arquitectónicas

Ver `docs/adr/` para decisiones sobre:
- **001:** Estructura modular del repo
- **002:** Inclusión de MCP servers

## Testing

Los skills se prueban en Claude Code:
1. `/nombreskill "entrada de prueba"`
2. Validar que los pasos se ejecutan correctamente
3. Validar que la salida (archivos, wikilinks) es correcta

## Git

```bash
git status              # Ver cambios
git add .              # Stagear
git commit -m "feat: ..." # Commit
git push               # Push a origin/main
git tag -a v1.0.0 -m "Release 1.0.0" && git push origin v1.0.0
```

## Referencias

- **README.md** — Inventario de agentes, skills, MCP servers
- **INSTALLATION.md** — Guía detallada de instalación
- **SLASH-COMMANDS.md** — Referencia completa de comandos
- **CONTEXT.md** — Terminología y conceptos
- **/memory/** — Decisiones de proyecto, patrones
