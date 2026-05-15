# MCP Server: Imagen Google

Servidor MCP que expone la herramienta `generate_image` para generar imágenes con Google Imagen (v3 y v4) directamente desde Claude Code.

## 🎯 Propósito

Crear imágenes directamente en conversaciones con Claude usando el modelo Imagen de Google:
- Generación de múltiples variaciones
- Control de modelo (Imagen 3 o 4)
- Proporciones de aspecto personalizables
- Guardado automático en `~/Downloads/`

## 📋 Requisitos

- Python 3.10+
- API key de [Google AI Studio](https://aistudio.google.com/apikey)
- Claude Code instalado

## 🚀 Instalación

### 1. Preparar el entorno

```bash
cd mcp-servers/imagen-google

# Crear entorno virtual
python3 -m venv .venv

# Instalar dependencias
.venv/bin/pip install -r requirements.txt
```

### 2. Configurar la API key

```bash
# Opción A: Variable de entorno permanente
echo 'export GEMINI_API_KEY="tu-api-key"' >> ~/.zshrc
source ~/.zshrc

# Opción B: Directamente en el comando
export GEMINI_API_KEY="tu-api-key"
```

### 3. Registrar en Claude Code

```bash
# Obtén la ruta absoluta
SERVIDOR_PATH=$(pwd)

# Registra el servidor
claude mcp add imagen-google \
  -s user \
  -e GEMINI_API_KEY="${GEMINI_API_KEY}" \
  -- ${SERVIDOR_PATH}/.venv/bin/python \
  ${SERVIDOR_PATH}/imagen_mcp.py
```

### 4. Verificar instalación

```bash
# Reinicia Claude Code, luego:
claude mcp list

# Deberías ver:
# imagen-google (user)
```

## 🎨 Uso

En Claude Code, simplemente describe lo que quieres generar:

```
Genera una imagen de un Space Marine con armadura dorada pintada al estilo NMM (Non-Metallic Metal)
```

O usa parámetros específicos:

```
Crea 4 variaciones de una paleta de colores para elfos oscuros, aspect ratio 16:9, modelo imagen4
```

## 🔧 Herramienta: `generate_image`

| Parámetro | Tipo | Obligatorio | Default | Valores |
|-----------|------|-----------|---------|---------|
| `prompt` | string | ✅ | — | Cualquier descripción |
| `filename` | string | ❌ | `output.png` | `*.png` |
| `model` | string | ❌ | `imagen4` | `imagen4`, `imagen3` |
| `number_of_images` | int | ❌ | `1` | `1-4` |
| `aspect_ratio` | string | ❌ | `1:1` | `1:1`, `16:9`, `9:16`, `4:3`, `3:4` |

### Ejemplos

```
# Generación simple
Genera una imagen de un dragón rojo

# Con parámetros
Crea 3 imágenes de un castillo medieval, aspect ratio 16:9, modelo imagen3

# Naming personalizado
Genera 2 variaciones de un logo minimalista, guárdalas como logo-v1.png y logo-v2.png
```

## 📁 Estructura

```
imagen-google/
├── imagen_mcp.py       # Servidor MCP
├── requirements.txt     # Dependencias
├── README.md           # Guía de usuario
├── CLAUDE.md           # Guía de desarrollo
├── MCP-SERVER.md       # Este archivo
└── .venv/              # Entorno virtual (no versionado)
```

## 🔄 Actualizar dependencias

```bash
.venv/bin/pip install --upgrade -r requirements.txt
```

## 🐛 Troubleshooting

### El servidor no aparece en Claude Code

```bash
# Reinicia Claude Code
# Verifica el registro
claude mcp list

# Si aún no aparece, re-registra
claude mcp remove imagen-google -s user
claude mcp add imagen-google ...  # como en instalación
```

### Error: `GEMINI_API_KEY not set`

```bash
# Verifica que la variable está configurada
echo $GEMINI_API_KEY

# Si no aparece, exporta y prueba
export GEMINI_API_KEY="tu-key"
.venv/bin/python imagen_mcp.py

# Si funciona, añade a tu ~/.zshrc o ~/.bash_profile
```

### Error: `404` o acceso denegado en Imagen 4

- Tu API key no tiene acceso a la preview de Imagen 4
- Solución: Usa `model: imagen3` en el prompt
- O solicita acceso en [AI Studio](https://aistudio.google.com)

### Las imágenes no se guardan

```bash
# Verifica que ~/Downloads/ existe
ls -la ~/Downloads/

# Verifica permisos
chmod 755 ~/Downloads/
```

## 🔐 Seguridad

- ⚠️ **Nunca** commits tu `GEMINI_API_KEY` al repo
- ✅ La key se pasa como variable de entorno
- ✅ Está en `.gitignore` (si la pones en `.env`)
- ✅ `~/.claude.json` también está gitignored

## 📚 Relacionado

- [Google Imagen docs](https://ai.google.dev/docs/models)
- [MCP Protocol](https://modelcontextprotocol.io/)
- [Claude Code MCP Guide](../../../CLAUDE.md)
