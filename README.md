# Neovim Quick Setup

This repository is designed for quick configuration and deployment of Neovim with customized settings. It includes a script that automates the installation and setup process, ensuring a smooth and efficient setup.

## Quick Start

To quickly configure and deploy Neovim, run the following script:

```bash
curl -sL https://raw.githubusercontent.com/genecywang/nvim-setup/main/scripts/quickstart.sh | bash
```

## Keymaps

> **Leader key:** `<Space>`

### Core

| Key | Mode | Description |
|-----|------|-------------|
| `jk` | Insert | Exit insert mode |
| `<leader>nh` | Normal | Clear search highlight |
| `<leader>+` | Normal | Increment number |
| `<leader>-` | Normal | Decrement number |
| `<C-s>` | Normal | Save file |

### Window & Tab Management

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>sv` | Normal | Split vertically |
| `<leader>sh` | Normal | Split horizontally |
| `<leader>se` | Normal | Equalize split sizes |
| `<leader>sx` | Normal | Close split |
| `<leader>sm` | Normal | Maximize/restore split |
| `<leader>to` | Normal | New tab |
| `<leader>tx` | Normal | Close tab |
| `<leader>tn` | Normal | Next tab |
| `<leader>tp` | Normal | Previous tab |
| `<leader>tf` | Normal | Open current file in new tab |
| `<leader>1`~`9` | Normal | Go to buffer N |

### File Explorer (NvimTree)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ee` | Normal | Toggle file explorer |
| `<leader>ef` | Normal | Focus current file |
| `<leader>ec` | Normal | Collapse all folders |
| `<leader>er` | Normal | Refresh explorer |

### Fuzzy Finder (Telescope)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ff` | Normal | Find files |
| `<leader>fr` | Normal | Recent files |
| `<leader>fs` | Normal | Search string |
| `<leader>fc` | Normal | Search word under cursor |
| `<leader>ft` | Normal | Search TODOs |
| `<C-k>` / `<C-j>` | Insert (Telescope) | Previous / next result |
| `<C-q>` | Insert (Telescope) | Send to quickfix list |
| `<C-t>` | Insert (Telescope) | Open in Trouble |
| `<C-o>` | Insert (Telescope) | Open in new tab |

### LSP

| Key | Mode | Description |
|-----|------|-------------|
| `gR` | Normal | Show references |
| `gD` | Normal | Go to declaration |
| `gd` | Normal | Show definitions |
| `gi` | Normal | Show implementations |
| `gt` | Normal | Show type definitions |
| `K` | Normal | Hover documentation |
| `<leader>ca` | Normal / Visual | Code actions |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>D` | Normal | Buffer diagnostics |
| `<leader>d` | Normal | Line diagnostics |
| `[d` / `]d` | Normal | Previous / next diagnostic |
| `<leader>rs` | Normal | Restart LSP |

### Autocompletion (nvim-cmp)

| Key | Mode | Description |
|-----|------|-------------|
| `<C-k>` / `<C-j>` | Insert | Previous / next suggestion |
| `<C-b>` / `<C-f>` | Insert | Scroll docs up / down |
| `<C-Space>` | Insert | Trigger completion |
| `<C-e>` | Insert | Close completion |
| `<CR>` | Insert | Confirm selection |

### Git (Gitsigns + LazyGit)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>lg` | Normal | Open LazyGit |
| `]h` / `[h` | Normal | Next / previous hunk |
| `<leader>hs` | Normal / Visual | Stage hunk |
| `<leader>hr` | Normal / Visual | Reset hunk |
| `<leader>hS` | Normal | Stage entire buffer |
| `<leader>hR` | Normal | Reset entire buffer |
| `<leader>hu` | Normal | Undo stage hunk |
| `<leader>hp` | Normal | Preview hunk |
| `<leader>hb` | Normal | Show line blame |
| `<leader>hB` | Normal | Toggle line blame |
| `<leader>hd` | Normal | Diff file |
| `<leader>hD` | Normal | Diff file against previous |
| `ih` | Operator / Visual | Select hunk (text object) |

### Diagnostics (Trouble)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>xx` | Normal | Toggle Trouble |
| `<leader>xw` | Normal | Workspace diagnostics |
| `<leader>xd` | Normal | Document diagnostics |
| `<leader>xq` | Normal | Quickfix list |
| `<leader>xl` | Normal | Location list |
| `<leader>xt` | Normal | TODOs in Trouble |

### TODO Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `]t` / `[t` | Normal | Next / previous TODO |

### Formatting & Linting

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>mp` | Normal / Visual | Format file or selection |
| `<leader>l` | Normal | Run linter |

### Session Management

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ws` | Normal | Save session |
| `<leader>wr` | Normal | Restore session |

### Terminal

| Key | Mode | Description |
|-----|------|-------------|
| `<C-\>` | Normal / Terminal | Toggle terminal |
| `<leader>tt` | Normal | Open terminal in current directory |

### Substitute

| Key | Mode | Description |
|-----|------|-------------|
| `s` | Normal | Substitute with motion |
| `ss` | Normal | Substitute line |
| `S` | Normal | Substitute to end of line |
| `s` | Visual | Substitute selection |

### Default Plugin Keymaps

| Plugin | Keys | Description |
|--------|------|-------------|
| Comment.nvim | `gc` / `gb` | Line / block comment |
| nvim-surround | `ys` / `ds` / `cs` | Add / delete / change surroundings |
| Treesitter | `<C-Space>` / `<BS>` | Expand / shrink selection |
| which-key | *(auto)* | Shows available keymaps after 500ms |
