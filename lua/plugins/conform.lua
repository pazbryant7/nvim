return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			lua = { 'stylua' },
			javascript = { 'prettierd' },
			javascriptreact = { 'prettierd' },
			typescript = { 'prettierd' },
			typescriptreact = { 'prettierd' },
			css = { 'prettierd' },
			html = { 'prettierd' },
			json = { 'prettierd' },
			jsonc = { 'prettierd' },
			scss = { 'prettier' },
			less = { 'prettier' },
			yaml = { 'prettier' },
			sh = { 'shfmt' },
			fish = { 'fish_indent' },
			bash = { 'shfmt' },
			zsh = { 'shfmt' },
			go = { 'gofumpt', 'goimports' },
			python = { 'ruff_organize_imports', 'ruff_fix', 'ruff_format' },
			toml = { 'taplo' },
			c = { 'clang-format' },
			rust = { 'rustfmt' },
		},
		formatters = {
			fish_indent = {
				command = '/usr/bin/fish_indent',
			},
			['clang-format'] = {
				prepend_args = { '--style={IndentWidth: 4, TabWidth: 4, UseTab: Never}' },
			},
		},
	},
	keys = {
		{
			'<c-b>',
			function()
				local mode = vim.fn.mode()
				vim.cmd(':w')

				if mode == 'v' or mode == 'V' or mode == '\22' then -- \22 is visual block mode
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
				end
			end,
			mode = { 'n', 'v' },
			desc = 'Format Buffer/Selection',
		},
	},
}
