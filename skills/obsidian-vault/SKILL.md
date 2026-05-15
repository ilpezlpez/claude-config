---
name: obsidian-vault
description: Search, create, and manage notes in the Obsidian vault with wikilinks and index notes. Use when user wants to find, create, or organize notes in Obsidian.
---

> **Language:** Detect user language from their messages. Always respond in the same language they use.

# Obsidian Vault

## Vault location

`/Users/ivan/Documents/Vaults/`

Contains multiple vaults: AI-Project-Management, Claude, Microsoft, pintura, pokemon. Search across all unless user specifies one.

## Naming conventions

- **Index notes**: aggregate related topics (e.g., `Ralph Wiggum Index.md`, `Skills Index.md`, `RAG Index.md`)
- **Title case** for all note names
- No folders for organization - use links and index notes instead

## Linking

- Use Obsidian `[[wikilinks]]` syntax: `[[Note Title]]`
- Notes link to dependencies/related notes at the bottom
- Index notes are just lists of `[[wikilinks]]`

## Workflows

### Search for notes

```bash
# Search by filename across all vaults
find "/Users/ivan/Documents/Vaults/" -name "*.md" | grep -i "keyword"

# Search by content across all vaults
grep -rl "keyword" "/Users/ivan/Documents/Vaults/" --include="*.md"
```

Or use Grep/Glob tools directly on the vault path.

### Create a new note

1. Use **Title Case** for filename
2. Write content as a unit of learning (per vault rules)
3. Add `[[wikilinks]]` to related notes at the bottom
4. If part of a numbered sequence, use the hierarchical numbering scheme

### Find related notes

Search for `[[Note Title]]` across the vault to find backlinks:

```bash
grep -rl "\\[\\[Note Title\\]\\]" "/Users/ivan/Documents/Vaults/"
```

### Find index notes

```bash
find "/Users/ivan/Documents/Vaults/" -name "*Index*"
```
