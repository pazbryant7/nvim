return {
	{
		'folke/lazydev.nvim',
		ft = 'lua', -- only load on lua files
		opts = {},
	},

	{
		'mason-org/mason-lspconfig.nvim',
		opts = {
			ensure_installed = {
				'html',
				'just',
				'gopls',
				'cssls',
				'ts_ls',
				'jsonls',
				'bashls',
				'lua_ls',
				'yamlls',
				'clangd',
				'dockerls',
				'marksman',
				'basedpyright',
				'emmet_language_server',
			},
			automatic_enable = {
				exclude = { 'ts_ls', 'rust_analyzer' },
			},
		},
		config = function(_, opts)
			require('mason-lspconfig').setup(opts)
			require('plugins.lsp.setup').setup()
			require('plugins.lsp.attach').on_attach()
		end,
	},

	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			{ 'j-hui/fidget.nvim', opts = {} },
		},
	},

	{
		'williamboman/mason.nvim',
		cmd = 'Mason',
		dependencies = {
			'WhoIsSethDaniel/mason-tool-installer.nvim',
		},
		config = function()
			local ensure_installed = {
				-- lua
				'stylua',
				'luacheck',
				-- web dev
				'prettierd',
				'prettier',
				-- bash
				'shfmt',
				'shellcheck',
				'shellharden',
				-- golang
				'gofumpt',
				'goimports',
				'golangci-lint',
				'delve',
				-- python
				'ruff',
				'debugpy',
				-- markdown
				'alex',
				'marksman',
				'markdownlint',
				-- javascript
				'eslint_d',
				'js-debug-adapter',
				-- toml
				'taplo',
				-- c
				'clang-format',
				-- rust
				'codelldb',
			}

			require('mason').setup({
				ui = {
					border = 'single',
				},
			})

			require('mason-tool-installer').setup({
				ensure_installed = ensure_installed,
			})
		end,
	},
}
