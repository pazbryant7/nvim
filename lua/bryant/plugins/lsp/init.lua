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
				'gopls',
				'cssls',
				'ts_ls',
				'jsonls',
				'bashls',
				'lua_ls',
				'yamlls',
				'clangd',
				'marksman',
				'dockerls',
				'basedpyright',
				'rust_analyzer',
				'emmet_language_server',
			},
			automatic_enable = {
				exclude = { 'ts_ls', 'rust_analyzer' },
			},
		},
		config = function(_, opts)
			require('mason-lspconfig').setup(opts)
			require('bryant.plugins.lsp.setup')
		end,
	},

	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'j-hui/fidget.nvim',
			'b0o/SchemaStore.nvim',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
	},

	{
		'mason-org/mason.nvim',
		dependencies = 'WhoIsSethDaniel/mason-tool-installer.nvim',
		branch = 'main',
		cmd = 'Mason',
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

				-- python
				'ruff',

				-- markdown
				'alex',
				'markdownlint',

				-- javascript
				'eslint_d',

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
