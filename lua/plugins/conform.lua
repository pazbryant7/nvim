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
			typescript = { 'prettierd' },
			javascriptreact = { 'prettierd' },
			typescriptreact = { 'prettierd' },

			-- Web stuff
			css = { 'prettierd' },
			vue = { 'prettierd' },
			html = { 'prettierd' },
			less = { 'prettierd' },
			scss = { 'prettierd' },
			astro = { 'prettierd' },

			-- Data / config → all supported
			mdx = { 'prettierd' },
			yaml = { 'prettierd' },
			json = { 'prettierd' },
			jsonc = { 'prettierd' },
			graphql = { 'prettierd' },
			markdown = { 'prettierd' },

			-- Shell
			sh = { 'shfmt' },
			zsh = { 'shfmt' },
			bash = { 'shfmt' },
			fish = { 'fish_indent' },

			-- Others
			just = { 'just' },
			toml = { 'taplo' },
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
