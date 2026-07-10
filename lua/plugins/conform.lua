return {
	'stevearc/conform.nvim',
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		notify_on_error = true,
		formatters_by_ft = {
			-- Lua
			lua = { 'stylua' },
			-- JavaScript / TypeScript (using OXC)
			javascript = { 'oxfmt' },
			typescript = { 'oxfmt' },
			javascriptreact = { 'oxfmt' },
			typescriptreact = { 'oxfmt' },
			-- Web stuff (all handled by OXC now)
			css = { 'oxfmt' },
			vue = { 'oxfmt' },
			html = { 'oxfmt' },
			less = { 'oxfmt' },
			scss = { 'oxfmt' },
			astro = { 'oxfmt' },
			-- Data / config (all handled by OXC now)
			mdx = { 'oxfmt' },
			yaml = { 'oxfmt' },
			json = { 'oxfmt' },
			jsonc = { 'oxfmt' },
			graphql = { 'oxfmt' },
			markdown = { 'oxfmt' },
			toml = { 'oxfmt' },
			-- Shell
			sh = { 'shfmt' },
			zsh = { 'shfmt' },
			bash = { 'shfmt' },
			fish = { 'fish_indent' },
			-- Nix
			nix = { 'nixfmt' },
			-- Others
			just = { 'just' },
			c = { 'clang-format' },
			cpp = { 'clang-format' },
			go = { 'gofumpt', 'goimports' },
			python = { 'ruff_organize_imports', 'ruff_fix', 'ruff_format' },
		},
		formatters = {
			fish_indent = {
				command = '/usr/bin/fish_indent',
			},
			['clang-format'] = {
				prepend_args = {
					'--style={IndentWidth: 4, TabWidth: 4, UseTab: Never}',
				},
			},
		},
	},
	keys = {
		{
			'<c-f>',
			function()
				local mode = vim.fn.mode()
				if mode == 'v' or mode == 'V' or mode == '\22' then
					pcall(function()
						require('conform').format({
							lsp_format = 'fallback',
							range = {
								start = { vim.fn.line("'<"), 1 },
								['end'] = { vim.fn.line("'>"), vim.fn.col("'>") },
							},
						})
					end)
				else
					pcall(function()
						require('conform').format({ lsp_format = 'fallback' })
					end)
					vim.notify('Code formatted', vim.log.levels.INFO, {
						title = 'Conform neovim',
					})
				end
			end,
			mode = { 'n', 'v' },
			desc = 'Format Buffer/Selection',
		},
	},
}
