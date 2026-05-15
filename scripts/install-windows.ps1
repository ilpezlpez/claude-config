# 🪟 Instalador de Agentes y Skills para Windows
# Uso: PowerShell -ExecutionPolicy Bypass -File install-windows.ps1

# Colores
$Blue = 'Cyan'
$Green = 'Green'
$Red = 'Red'
$Yellow = 'Yellow'

Write-Host "════════════════════════════════════════" -ForegroundColor $Blue
Write-Host "🪟 Instalador Claude Config para Windows" -ForegroundColor $Blue
Write-Host "════════════════════════════════════════" -ForegroundColor $Blue
Write-Host ""

# Función para crear directorio si no existe
function Ensure-Directory {
    param([string]$Path)
    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

# Detectar si estamos en el repo
if (-not (Test-Path "README.md") -or -not (Test-Path "agents")) {
    Write-Host "📥 Clonando repositorio..." -ForegroundColor $Yellow
    git clone https://github.com/ilpezlpez/claude-config.git $env:USERPROFILE\claude-config
    Set-Location $env:USERPROFILE\claude-config
    Write-Host "✓ Repositorio clonado" -ForegroundColor $Green
    Write-Host ""
} else {
    Write-Host "✓ Ya estamos en el repositorio" -ForegroundColor $Green
    Write-Host ""
}

# Crear directorios
Write-Host "📁 Creando directorios..." -ForegroundColor $Blue
Ensure-Directory "$env:USERPROFILE\.claude\agents"
Ensure-Directory "$env:USERPROFILE\.agents\skills"
Write-Host "✓ Directorios creados" -ForegroundColor $Green
Write-Host ""

# Instalar agentes
Write-Host "🤖 Instalando agentes..." -ForegroundColor $Blue
Copy-Item "agents\*.md" -Destination "$env:USERPROFILE\.claude\agents\" -Force
$agentCount = (Get-ChildItem "$env:USERPROFILE\.claude\agents\*.md" -ErrorAction SilentlyContinue | Measure-Object).Count
Write-Host "✓ $agentCount agentes instalados" -ForegroundColor $Green
Write-Host "   - code-reviewer.md"
Write-Host "   - developer.md"
Write-Host "   - architect.md"
Write-Host "   - qa-engineer.md"
Write-Host "   - setup-validator.md"
Write-Host "   - azure-manager.md"
Write-Host "   - nmm-golden-demon-critic.md"
Write-Host ""

# Instalar skills
Write-Host "🔧 Instalando skills..." -ForegroundColor $Blue
# Copiar cada skill directory
Get-ChildItem "skills" -Directory | ForEach-Object {
    Copy-Item $_.FullName -Destination "$env:USERPROFILE\.agents\skills\" -Recurse -Force
}
$skillCount = (Get-ChildItem "$env:USERPROFILE\.agents\skills" -Directory -ErrorAction SilentlyContinue | Measure-Object).Count
Write-Host "✓ $skillCount skills instalados" -ForegroundColor $Green
Write-Host ""

# Verificar instalación
Write-Host "✅ Verificando instalación..." -ForegroundColor $Blue
if (Test-Path "$env:USERPROFILE\.claude\agents\code-reviewer.md") {
    Write-Host "✓ Agentes instalados correctamente" -ForegroundColor $Green
} else {
    Write-Host "✗ Error instalando agentes" -ForegroundColor $Red
    exit 1
}

if (Test-Path "$env:USERPROFILE\.agents\skills\diagnose") {
    Write-Host "✓ Skills instalados correctamente" -ForegroundColor $Green
} else {
    Write-Host "✗ Error instalando skills" -ForegroundColor $Red
    exit 1
}

Write-Host ""
Write-Host "════════════════════════════════════════" -ForegroundColor $Green
Write-Host "✨ ¡Instalación completada exitosamente!" -ForegroundColor $Green
Write-Host "════════════════════════════════════════" -ForegroundColor $Green
Write-Host ""

Write-Host "📍 Ubicaciones:" -ForegroundColor $Blue
Write-Host "   Agentes: $env:USERPROFILE\.claude\agents\"
Write-Host "   Skills:  $env:USERPROFILE\.agents\skills\"
Write-Host ""

Write-Host "🚀 Próximos pasos:" -ForegroundColor $Blue
Write-Host "   1. Abre Claude Code"
Write-Host "   2. Escribe /agents para ver tus agentes"
Write-Host "   3. Prueba un comando: /diagnose 'tu primer bug'"
Write-Host "   4. Lee SLASH-COMMANDS.md para más"
Write-Host ""

Write-Host "📚 Documentación:" -ForegroundColor $Blue
Write-Host "   - SLASH-COMMANDS.md — Lista de comandos"
Write-Host "   - INSTALLATION.md — Guía detallada"
Write-Host "   - README.md — Inventario completo"
Write-Host ""

Write-Host "¡Listo para usar! 🎉" -ForegroundColor $Green
Write-Host ""
