#!/bin/bash

# 🍎 Instalador de Agentes y Skills para macOS
# Uso: bash install-mac.sh

set -e  # Detener si hay error

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}════════════════════════════════════════${NC}"
echo -e "${BLUE}🍎 Instalador Claude Config para macOS${NC}"
echo -e "${BLUE}════════════════════════════════════════${NC}\n"

# Detectar si estamos en el repo o necesitamos clonarlo
if [ ! -f "README.md" ] || [ ! -d "agents" ]; then
    echo -e "${YELLOW}📥 Clonando repositorio...${NC}"
    git clone https://github.com/ilpezlpez/claude-config.git ~/claude-config
    cd ~/claude-config
    echo -e "${GREEN}✓ Repositorio clonado${NC}\n"
else
    echo -e "${GREEN}✓ Ya estamos en el repositorio${NC}\n"
fi

# Crear directorios si no existen
echo -e "${BLUE}📁 Creando directorios...${NC}"
mkdir -p ~/.claude/agents
mkdir -p ~/.agents/skills
echo -e "${GREEN}✓ Directorios creados${NC}\n"

# Instalar agentes
echo -e "${BLUE}🤖 Instalando agentes...${NC}"
cp agents/*.md ~/.claude/agents/
AGENT_COUNT=$(ls ~/.claude/agents/*.md 2>/dev/null | wc -l)
echo -e "${GREEN}✓ $AGENT_COUNT agentes instalados${NC}"
echo "   - code-reviewer.md"
echo "   - developer.md"
echo "   - architect.md"
echo "   - qa-engineer.md"
echo "   - setup-validator.md"
echo "   - azure-manager.md"
echo "   - nmm-golden-demon-critic.md"
echo ""

# Instalar skills
echo -e "${BLUE}🔧 Instalando skills...${NC}"
cp -r skills/* ~/.agents/skills/
SKILL_COUNT=$(ls -d ~/.agents/skills/*/ 2>/dev/null | wc -l)
echo -e "${GREEN}✓ $SKILL_COUNT skills instalados${NC}\n"

# Verificar instalación
echo -e "${BLUE}✅ Verificando instalación...${NC}"
if [ -f ~/.claude/agents/code-reviewer.md ]; then
    echo -e "${GREEN}✓ Agentes instalados correctamente${NC}"
else
    echo -e "${RED}✗ Error instalando agentes${NC}"
    exit 1
fi

if [ -d ~/.agents/skills/diagnose ]; then
    echo -e "${GREEN}✓ Skills instalados correctamente${NC}"
else
    echo -e "${RED}✗ Error instalando skills${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}✨ ¡Instalación completada exitosamente!${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}\n"

echo -e "${BLUE}📍 Ubicaciones:${NC}"
echo "   Agentes: ~/.claude/agents/"
echo "   Skills:  ~/.agents/skills/\n"

echo -e "${BLUE}🚀 Próximos pasos:${NC}"
echo "   1. Abre Claude Code"
echo "   2. Escribe /agents para ver tus agentes"
echo "   3. Prueba un comando: /diagnose 'tu primer bug'"
echo "   4. Lee SLASH-COMMANDS.md para más\n"

echo -e "${BLUE}📚 Documentación:${NC}"
echo "   - SLASH-COMMANDS.md — Lista de comandos"
echo "   - INSTALLATION.md — Guía detallada"
echo "   - README.md — Inventario completo\n"

echo -e "${GREEN}¡Listo para usar! 🎉${NC}\n"
