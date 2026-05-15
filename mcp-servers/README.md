# 🔌 MCP Servers

Servidores del Model Context Protocol (MCP) personalizados que extienden las capacidades de Claude Code.

## 📋 Qué son los MCP Servers

Los MCP servers permiten que Claude Code acceda a herramientas externas:
- APIs (Google Imagen, GitHub, etc.)
- Bases de datos
- Sistemas locales
- Servicios personalizados

## 🗂️ Estructura

```
mcp-servers/
├── imagen-google/          # Generar imágenes con Google Imagen
│   ├── imagen_mcp.py       # Servidor MCP
│   ├── requirements.txt    # Dependencias Python
│   ├── README.md           # Guía de usuario
│   ├── CLAUDE.md           # Guía de desarrollo
│   ├── MCP-SERVER.md       # Documentación completa
│   └── .venv/              # Entorno virtual (no versionado)
│
└── [próximos servers...]
```

## 📦 Servidores disponibles

### 1️⃣ **imagen-google** ✨

Genera imágenes con Google Imagen (v3 y v4).

**Herramienta:** `generate_image(prompt, filename, model, number_of_images, aspect_ratio)`

**Uso:**
```
Genera una imagen de un Space Marine con armadura dorada NMM
```

**Instalación:** Ver [imagen-google/MCP-SERVER.md](./imagen-google/MCP-SERVER.md)

---

## 🚀 Instalación general

Cada servidor tiene su propia instalación:

```bash
# Ir al servidor
cd mcp-servers/nombre-servidor

# Seguir sus instrucciones en MCP-SERVER.md
```

O ver [../INSTALLATION.md](../INSTALLATION.md#mcp-servers) para instalación automática.

---

## 🔧 Cómo funcionan

### Flujo típico

```
Claude Code (conversación)
        ↓
    [prompt]
        ↓
    MCP Server (executa herramienta)
        ↓
    [resultado]
        ↓
Claude Code (respuesta)
```

### Ejemplo: imagen-google

```
Usuario: "Genera una imagen de un dragón"
    ↓
Claude: "Voy a usar la herramienta generate_image"
    ↓
imagen-google MCP: (conecta a Google Imagen API)
    ↓
Google Imagen: (genera la imagen)
    ↓
Archivo guardado: ~/Downloads/output.png
    ↓
Claude: "¡Imagen generada y guardada!"
```

---

## 📝 Crear un nuevo MCP Server

Para agregar un nuevo servidor:

1. **Crear carpeta**
   ```bash
   mkdir -p mcp-servers/nombre-servidor
   ```

2. **Crear archivos básicos**
   ```
   nombre-servidor/
   ├── server_impl.py       # Implementación
   ├── requirements.txt     # Dependencias
   ├── README.md            # Guía de usuario
   ├── CLAUDE.md            # Guía de desarrollo
   └── MCP-SERVER.md        # Documentación completa
   ```

3. **Implementar usando FastMCP**
   ```python
   from mcp.server.fastmcp import FastMCP
   
   mcp = FastMCP("mi-servidor")
   
   @mcp.tool()
   def mi_herramienta(param: str) -> str:
       """Descripción de qué hace"""
       return f"Resultado"
   ```

4. **Documentar en MCP-SERVER.md**
5. **Agregar a este README**
6. **Hacer commit y push**

---

## 🔑 Variables de entorno

Cada servidor puede necesitar claves API:

```bash
# Exporta antes de registrar
export GEMINI_API_KEY="tu-key"
export OTRA_API_KEY="otra-key"

# O usa .env (gitignored)
echo "GEMINI_API_KEY=..." >> .env
```

---

## ✅ Checklist de instalación

Para cada servidor nuevo:

- [ ] Crear carpeta en `mcp-servers/`
- [ ] Crear `requirements.txt` con dependencias
- [ ] Crear `.venv/` y instalar dependencias
- [ ] Registrar en Claude Code: `claude mcp add nombre`
- [ ] Crear `MCP-SERVER.md` con instrucciones
- [ ] Actualizar este `README.md`
- [ ] Hacer commit y push
- [ ] Documentar en [../README.md](../README.md)

---

## 🐛 Debug

### Verificar servidores registrados

```bash
claude mcp list
```

### Test manual del servidor

```bash
cd imagen-google
export GEMINI_API_KEY="tu-key"
.venv/bin/python imagen_mcp.py
```

### Inspeccionar con MCP Inspector

```bash
npx @modelcontextprotocol/inspector \
  /ruta/a/.venv/bin/python \
  /ruta/a/servidor_mcp.py
```

---

## 📚 Recursos

- [MCP Specification](https://modelcontextprotocol.io/)
- [FastMCP Framework](https://github.com/anthropics/mcp-sdk-python)
- [Claude Code Guide](../CLAUDE.md)

---

## 🔗 Relacionado

- [README.md](../README.md) — Inventario general
- [INSTALLATION.md](../INSTALLATION.md) — Instalación
- [SLASH-COMMANDS.md](../SLASH-COMMANDS.md) — Comandos disponibles
