# Repository Guide

## Tooling and verification

- Enter the pinned development environment with `nix develop`; it supplies `just`, `stylua`, `oxfmt`, Lua tooling, Node, and other editor dependencies.
- Run `just` (the default recipe) to format the entire repository: it runs `stylua --config-path .stylua.toml .` followed by `oxfmt --write .`. There are no repository-defined test, lint, or CI commands.
- Lua uses tabs, 2-wide indentation, single-quote preference, and sorted `require`s as defined by `.stylua.toml`. `oxfmt` formats JSON and Markdown according to `.oxfmtrc.json`.
- `lazy-lock.json` is a lazy.nvim-generated local lockfile and is intentionally ignored; do not add it to commits.

## Configuration layout

- `init.lua` is the runtime entry point. It loads core settings from `lua/config/`, bootstraps lazy.nvim in `lua/config/lazy.lua`, then loads commands, mappings, and autocommands.
- Each file in `lua/plugins/` returns a lazy.nvim plugin specification. The standard startup import loads `plugins` plus `plugins.lsp.specifics`; put shared LSP setup in `lua/plugins/lsp/` and plugin-specific integrations in `lua/plugins/lsp/specifics/`.
- Per-server Neovim LSP overrides belong in `after/lsp/`; filetype behavior belongs in `after/ftplugin/`. Custom completion snippets are VSCode-format JSON in `snippets/`.
- Normal plugin loading is bypassed for `+Man` pager sessions and when `LF_BULK_RENAME=1`; those modes load only their respective minimal plugin specs.

## Runtime constraints

- `conform.nvim` and `nvim-lspconfig` enable only when `IN_NIX_SHELL` is set. Test changes to their behavior from `nix develop`, not a bare Neovim session.
- Rust and TypeScript integrations are separately conditional on required executables. Rustaceanvim invokes `rust-analyzer` from `/usr/lib/rustup/bin/rust-analyzer`; preserve or deliberately revise that system-specific path when changing Rust support.
