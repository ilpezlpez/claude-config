# 🔧 Scripts de Instalación

Scripts automatizados para instalar agentes y skills en Mac y Windows.

## 🍎 macOS

### Opción 1: Descarga y ejecuta (recomendado)

```bash
# Descarga y ejecuta directamente desde GitHub
bash <(curl -fsSL https://raw.githubusercontent.com/ilpezlpez/claude-config/main/scripts/install-mac.sh)
```

### Opción 2: Desde el repositorio clonado

```bash
# Clone el repo
git clone https://github.com/ilpezlpez/claude-config.git
cd claude-config

# Ejecuta el script
bash scripts/install-mac.sh
```

### ¿Qué hace?

- ✅ Clona el repo si no existe
- ✅ Crea directorios necesarios
- ✅ Copia 7 agentes a `~/.claude/agents/`
- ✅ Copia 17 skills a `~/.agents/skills/`
- ✅ Verifica que todo se instaló correctamente
- ✅ Muestra instrucciones siguientes

---

## 🪟 Windows

### Opción 1: Descarga y ejecuta (recomendado)

```powershell
# Abre PowerShell y ejecuta:
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/ilpezlpez/claude-config/main/scripts/install-windows.ps1 | iex"
```

### Opción 2: Desde el repositorio clonado

```powershell
# Clone el repo
git clone https://github.com/ilpezlpez/claude-config.git
cd claude-config

# Ejecuta el script
powershell -ExecutionPolicy Bypass -File scripts/install-windows.ps1
```

### ¿Qué hace?

- ✅ Clona el repo si no existe
- ✅ Crea directorios necesarios
- ✅ Copia 7 agentes a `%USERPROFILE%\.claude\agents\`
- ✅ Copia 17 skills a `%USERPROFILE%\.agents\skills\`
- ✅ Verifica que todo se instaló correctamente
- ✅ Muestra instrucciones siguientes

---

## 📋 Requisitos

### macOS
- **Bash** (incluido en macOS)
- **Git** (para clonar repo)
- **Permiso** para escribir en `~/.claude/` y `~/.agents/`

```bash
# Instala Git si no lo tienes
brew install git
```

### Windows
- **PowerShell 5.0+** (incluido en Windows 10/11)
- **Git** (para clonar repo)
- **Permiso de administrador** (ejecuta PowerShell como admin)

```powershell
# Instala Git si no lo tienes
# Descargalo de: https://git-scm.com/download/win
```

---

## 🆘 Troubleshooting

### macOS: "Permission denied"

```bash
# Dale permisos de ejecución
chmod +x scripts/install-mac.sh

# Luego ejecuta
bash scripts/install-mac.sh
```

### Windows: "cannot be loaded because running scripts is disabled"

```powershell
# Ejecuta con bypass (como se muestra arriba):
powershell -ExecutionPolicy Bypass -File scripts/install-windows.ps1
```

### macOS: "git: command not found"

```bash
# Instala git con Homebrew
brew install git

# O descargalo de: https://git-scm.com/download/mac
```

### Windows: Falta crear directorios

```powershell
# El script crea automáticamente, pero si falla manualmente:
mkdir $env:USERPROFILE\.claude\agents
mkdir $env:USERPROFILE\.agents\skills
```

---

## ✅ Verificar instalación

### macOS
```bash
ls ~/.claude/agents/           # Ver agentes
ls ~/.agents/skills/            # Ver skills
```

### Windows
```powershell
ls $env:USERPROFILE\.claude\agents\          # Ver agentes
ls $env:USERPROFILE\.agents\skills\          # Ver skills
```

---

## 🚀 Después de instalar

1. Abre Claude Code
2. Escribe `/agents` para ver tus agentes
3. Prueba un comando: `/diagnose "mi primer bug"`
4. Lee [SLASH-COMMANDS.md](../SLASH-COMMANDS.md) para más

---

## 📝 Notas

- Los scripts son **idempotentes**: puedes ejecutarlos múltiples veces sin problema
- Clonan el repo en `~/claude-config` (o en tu directorio actual si ya estás en el repo)
- No necesitan permisos especiales (excepto escritura en home)
- Incluyen verificación automática de instalación
- Colorean la salida para mejor legibilidad

---

## 🔗 Relacionado

- [INSTALLATION.md](../INSTALLATION.md) — Guía manual detallada
- [SLASH-COMMANDS.md](../SLASH-COMMANDS.md) — Referencia de comandos
- [README.md](../README.md) — Inventario completo
