# nvim

Personal Neovim configuration — built on
[lazy.nvim](https://github.com/folke/lazy.nvim), focused on a fast and minimal
but complete editing experience. Free for anyone to use or adapt.

## Structure

```
.
├── init.lua                  # Entry point
├── lazy-lock.json            # Plugin lockfile
├── justfile                  # Convenience commands
├── .stylua.toml              # Lua formatter config
├── lua/
│   ├── config/               # Core Neovim settings
│   │   ├── options.lua       # Editor options
│   │   ├── keymaps.lua       # Key bindings
│   │   ├── autocmd.lua       # Autocommands
│   │   ├── usercmd.lua       # Custom user commands
│   │   ├── lazy.lua          # Plugin manager bootstrap
│   │   └── utils.lua         # Shared utility functions
│   └── plugins/              # Plugin configurations
│       ├── lsp/              # Language server setup
│       │   ├── init.lua
│       │   ├── setup.lua
│       │   ├── attach.lua
│       │   └── specifics/
│       │       └── typescript-tools.lua
│       ├── blink-cmp.lua     # Completion engine
│       ├── fzf-lua.lua       # Fuzzy finder
│       ├── conform.lua       # Formatting
│       ├── treesitter.lua    # Syntax highlighting
│       ├── harpoon.lua       # File navigation
│       ├── oil.lua           # File explorer
│       ├── vim-fugitive.lua  # Git integration
│       ├── kulala.lua        # HTTP client
│       ├── toggle-term.lua   # Integrated terminal
│       ├── multiple-cursors.lua
│       ├── no-neck-pain.lua  # Centered layout
│       ├── nvim-surround.lua
│       ├── quicker.lua       # Quickfix improvements
│       └── transparent.lua
├── after/
│   ├── lsp/                  # Per-LSP overrides (gopls, lua_ls, basedpyright)
│   └── ftplugin/             # Filetype-specific settings (http, markdown, json, gitcommit)
├── snippets/                 # Custom snippets per language
│   ├── js.json
│   ├── python.json
│   ├── go.json
│   ├── lua.json
│   ├── c.json
│   ├── sh.json
│   ├── markdown.json
│   ├── gitcommit.json
│   └── ...
└── spell/                    # Spell files (en, es, nl)
```

## Plugins

| Plugin               | Purpose                                        |
| -------------------- | ---------------------------------------------- |
| **lazy.nvim**        | Plugin manager                                 |
| **blink-cmp**        | Completion engine                              |
| **fzf-lua**          | Fuzzy finding — files, buffers, grep, and more |
| **nvim-treesitter**  | Syntax highlighting and code parsing           |
| **conform.nvim**     | Code formatting (per filetype)                 |
| **harpoon**          | Quick navigation between pinned files          |
| **oil.nvim**         | File explorer as a buffer                      |
| **vim-fugitive**     | Git workflow inside Neovim                     |
| **kulala.nvim**      | HTTP client — run `.http` files inline         |
| **toggleterm.nvim**  | Integrated terminal                            |
| **multiple-cursors** | Multi-cursor editing                           |
| **no-neck-pain**     | Centers the buffer for focused writing         |
| **nvim-surround**    | Surround text objects with ease                |
| **quicker.nvim**     | Better quickfix list experience                |
| **transparent.nvim** | Transparent background support                 |

## LSP

Language servers are configured under `lua/plugins/lsp/` with per-server
overrides in `after/lsp/`:

- **gopls** — Go
- **lua_ls** — Lua
- **basedpyright** — Python
- **typescript-tools** — TypeScript / JavaScript

## Snippets

Custom snippets defined in JSON (VSCode format) for: `js`, `python`, `go`,
`lua`, `c`, `sh`, `markdown`, `gitcommit`, `jjdescription`, `dockerfile`, and a
global `all.json`.

## Try my full setup

Want to try this config alongside the rest of my environment without touching
your own machine?

Check out
**[pazbryant7/ansible-dots](https://github.com/pazbryant7/ansible-dots)** —
there's a Docker image to spin up the full setup instantly.

## Usage

Everything here is public and free to use. Copy what's useful, adapt it, or use
it as a reference. No attribution needed.
