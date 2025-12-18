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

			-- JavaScript
			javascript = { 'prettierd' },
			javascriptreact = { 'prettierd' },
			typescript = { 'prettierd' },
			typescriptreact = { 'prettierd' },

			-- Web stuff
			css = { 'prettierd' },
			scss = { 'prettierd' },
			less = { 'prettierd' },
			html = { 'prettierd' },
			vue = { 'prettierd' },
			astro = { 'prettierd' },

			-- Data / config → all supported
			json = { 'prettierd' },
			jsonc = { 'prettierd' },
			yaml = { 'prettierd' },
			graphql = { 'prettierd' },
			markdown = { 'prettierd' },
			mdx = { 'prettierd' },

			-- Shell
			sh = { 'shfmt' },
			bash = { 'shfmt' },
			zsh = { 'shfmt' },
			fish = { 'fish_indent' },

			-- Others
			go = { 'gofumpt', 'goimports' },
			python = { 'ruff_organize_imports', 'ruff_fix', 'ruff_format' },
			toml = { 'taplo' },
			c = { 'clang-format' },
			cpp = { 'clang-format' },
			rust = { 'rustfmt' },
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
