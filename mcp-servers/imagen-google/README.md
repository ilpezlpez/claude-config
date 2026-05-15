# imagen-google MCP

Servidor MCP para generar imágenes con Google Imagen (v3 y v4) desde Claude Code.

## Requisitos

- Python 3.10+
- API key de [Google AI Studio](https://aistudio.google.com/apikey) con acceso a Imagen
- Claude Code CLI

## Instalación

```bash
git clone <repo>
cd imagen-google

python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
```

## Configuración

### 1. Variable de entorno

El servidor lee la API key desde `GEMINI_API_KEY`. Puedes exportarla en tu shell o dejar que Claude Code la inyecte (ver paso 2).

```bash
export GEMINI_API_KEY="tu-api-key"
```

### 2. Registrar en Claude Code

```bash
claude mcp add imagen-google \
  -s user \
  -e GEMINI_API_KEY="${GEMINI_API_KEY}" \
  -- /ruta/absoluta/.venv/bin/python \
  /ruta/absoluta/imagen_mcp.py
```

El flag `-s user` lo hace disponible en todos tus proyectos.

## Herramienta disponible

### `generate_image`

Genera una o varias imágenes a partir de un prompt de texto. Las imágenes se guardan en `~/Downloads/`.

#### Parámetros

| Parámetro | Tipo | Por defecto | Descripción |
|-----------|------|-------------|-------------|
| `prompt` | `string` | — | Descripción de la imagen a generar |
| `filename` | `string` | `output.png` | Nombre del archivo de salida |
| `model` | `string` | `imagen4` | Modelo a usar: `imagen4` o `imagen3` |
| `number_of_images` | `int` | `1` | Número de imágenes (1–4) |
| `aspect_ratio` | `string` | `1:1` | Proporción: `1:1`, `16:9`, `9:16`, `4:3`, `3:4` |

#### Ejemplos de uso

Desde una conversación con Claude:

```
Genera una imagen de un Space Marine con armadura dorada pintada al estilo NMM
```

```
Crea 4 variaciones de una paleta de colores para miniaturas de elfos oscuros, aspect ratio 16:9, guárdalas como elfos-oscuros.png
```

## Modelos

| ID | Modelo real | Notas |
|----|-------------|-------|
| `imagen4` | `imagen-4.0-generate-preview-05-20` | Más detalle y coherencia. Requiere acceso a la preview. |
| `imagen3` | `imagen-3.0-generate-002` | Disponible para todos los usuarios de AI Studio. |

Si no tienes acceso a Imagen 4, cambia el modelo por defecto en `imagen_mcp.py`:

```python
MODELS = {
    "imagen4": "imagen-3.0-generate-002",  # fallback
    "imagen3": "imagen-3.0-generate-002",
}
```

## Estructura

```
imagen-google/
├── imagen_mcp.py      # servidor MCP
├── requirements.txt   # dependencias
├── .venv/             # entorno virtual (no versionado)
└── README.md
```

## Dependencias

| Paquete | Propósito |
|---------|-----------|
| `mcp` | Framework MCP (FastMCP) |
| `google-genai` | SDK unificado de Google AI |

## Solución de problemas

**El servidor no aparece en Claude Code**
Reinicia Claude Code después de registrar el MCP. Verifica el registro con:
```bash
claude mcp list
```

**Error `GEMINI_API_KEY not set`**
La key no está llegando al proceso. Comprueba que está en la sección `env` de `~/.claude.json`:
```bash
grep -A3 "imagen-google" ~/.claude.json
```

**Error `404` o `permission denied` en Imagen 4**
Tu API key no tiene acceso a la preview de Imagen 4. Usa `model: "imagen3"` o solicita acceso en [AI Studio](https://aistudio.google.com).

**Las imágenes no aparecen en Downloads**
Verifica que `~/Downloads/` existe y tiene permisos de escritura:
```bash
ls -la ~/Downloads/
```
