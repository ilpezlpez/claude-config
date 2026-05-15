# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal MCP server that exposes a `generate_image` tool to Claude Code using Google Imagen (v3 and v4) via the `google-genai` SDK. The server runs via stdio transport using FastMCP.

## Environment

- Python venv at `.venv/` — always use `.venv/bin/python` and `.venv/bin/pip`
- Runtime requires `GEMINI_API_KEY` in the environment
- Generated images are saved to `~/Downloads/`

## Common commands

```bash
# Install / update dependencies
.venv/bin/pip install -r requirements.txt

# Run the server manually (for debugging)
GEMINI_API_KEY=your-key .venv/bin/python imagen_mcp.py

# Inspect available tools via MCP inspector
npx @modelcontextprotocol/inspector .venv/bin/python imagen_mcp.py
```

## Architecture

Single-file server (`imagen_mcp.py`). The entire logic is:

1. `FastMCP` instance registered as `"imagen-google"`
2. `genai.Client` initialized at module level from `GEMINI_API_KEY`
3. `MODELS` dict maps short aliases (`imagen4`, `imagen3`) to full Google model IDs — update this dict when new model versions are released
4. `generate_image` tool decorated with `@mcp.tool()` — FastMCP auto-generates the MCP tool schema from the function signature and docstring

## Registration in Claude Code

The server is registered globally (`-s user`) in `~/.claude.json`:

```bash
claude mcp add imagen-google \
  -s user \
  -e GEMINI_API_KEY="${GEMINI_API_KEY}" \
  -- /Users/ivan/Developer/mcp-servers/imagen-google/.venv/bin/python \
  /Users/ivan/Developer/mcp-servers/imagen-google/imagen_mcp.py
```

After any change to the registration (env vars, args), run `claude mcp remove imagen-google -s user` first, then re-add.

## Model IDs

| Alias | Model ID | Notes |
|-------|----------|-------|
| `imagen4` | `imagen-4.0-generate-preview-05-20` | Preview access required |
| `imagen3` | `imagen-3.0-generate-002` | Generally available |

When Google releases new versions, update the `MODELS` dict in `imagen_mcp.py`.
