# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration repository using Lua and the **Lazy.nvim** plugin manager. The config is organized into a core layer (editor settings) and a plugins layer (one file per plugin).

## Common Commands

**Install / bootstrap:**
```bash
bash scripts/quickstart.sh
```
Installs Neovim 0.11.5, Node.js, ripgrep, lazygit, and deploys this config to `~/.config/nvim`. If the config directory already exists as a git repo, it discards local `lazy-lock.json` changes then runs `git fetch` + `git reset --hard origin/main` to force-sync.

**Format Lua files:**
```bash
stylua lua/
```
Config is in `.stylua.toml`: 2-space indentation, no tabs. There is no lint or test runner.

## Architecture

**Entry point flow:**
```
init.lua
  └── require("core")           → lua/core/init.lua (options, keymaps, diagnostics)
  └── require("core.lazy")      → bootstraps lazy.nvim, loads all plugin specs
  └── require("tfdetect")       → Jenkinsfile → Groovy filetype detection
  └── vim.cmd("colorscheme vscode")
```

**Two layers:**
- `lua/core/` — editor fundamentals (options, keymaps, diagnostic icons, lazy bootstrap). These have no plugin dependencies.
- `lua/plugins/` — one file per plugin, each returning a Lazy.nvim spec table. LSP-specific configs live in `lua/plugins/lsp/`.

**Plugin manager** (`lua/core/lazy.lua`): auto-installs lazy.nvim from GitHub on first launch, then scans `lua/plugins/*.lua` and `lua/plugins/lsp/*.lua` for specs. Version pins are in `lazy-lock.json`.

**LSP stack:**
- `plugins/lsp/mason.lua` — declares LSP servers and tools to auto-install. Servers: html, cssls, tailwindcss, lua_ls, bashls, terraformls, yamlls, ansiblels, dockerls, pyright, gopls. Tools: prettier, stylua, shfmt, eslint_d, shellcheck, tflint, hadolint, ansible-lint, black, isort, pylint, gofumpt, goimports.
- `plugins/lsp/lspconfig.lua` — attaches keymaps on `LspAttach`, configures per-server settings (yamlls uses SchemaStore.nvim for automatic K8s/Ansible/GH Actions schema detection, ansiblels enables ansible-lint), sets up nvim-cmp capabilities

**Formatting / linting:**
- `plugins/formatting.lua` — conform.nvim formats on save; dispatches to prettier, stylua, shfmt, terraform_fmt, goimports/gofumpt, isort/black by filetype
- `plugins/lintin.lua` — nvim-lint runs eslint_d, pylint, shellcheck, tflint, hadolint, ansible_lint by filetype

**Other notable plugins:**
- `plugins/schemastore.lua` — provides YAML schemas to yamlls (lazy-loaded)
- `plugins/diffview.lua` — git diff/history UI
- `lua/tfdetect/` — auto-detects Jenkinsfile and sets filetype to Groovy

## Adding a Plugin

Create `lua/plugins/<name>.lua` returning a Lazy.nvim spec:
```lua
return {
  "author/plugin-name",
  event = "VeryLazy",   -- or BufReadPre, etc.
  config = function()
    require("plugin-name").setup({ ... })
  end,
}
```

## Key Keymaps (for reference when editing keymap files)

- Leader: `<Space>`
- Core: `jk` exits insert, `<C-s>` saves, `<leader>nh` clears highlights
- Splits: `<leader>sv/sh/se/sx`; Tabs: `<leader>to/tx/tn/tp`
- File tree: `<leader>ee/ef/ec/er` (nvim-tree)
- Telescope: `<leader>ff/fr/fs/fc/ft`
- LSP: `gd` (definition), `gD` (declaration), `<leader>ca` (code action), `<leader>rn` (rename)
- Formatting: `<leader>mp`; Linting: `<leader>l`
- Git: `<leader>lg` (lazygit), `]h/[h` (hunk nav), `<leader>hs/hr/hb` (stage/reset/blame), `<leader>gd/gh/gH/gx` (diffview open/file-history/branch-history/close)
- Diagnostics: `<leader>xx/xw/xd` (trouble.nvim)
