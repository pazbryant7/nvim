return {
	{
		'folke/lazydev.nvim',
		ft = 'lua', -- only load on lua files
		opts = {
			library = {
				'nvim-dap-ui',
			},
		},
	},

	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'j-hui/fidget.nvim', opts = {} },
		},
		config = function()
			require('plugins.lsp.setup').setup()
			require('plugins.lsp.attach').on_attach()
		end,
	},

	{
		'mason-org/mason.nvim',
		cmd = {
			'Mason',
			'MasonUpdate',
		},
		opts = {
			ui = {
				border = 'single',
			},
		},
		config = function(_, opts)
			require('mason').setup(opts)
			local mr = require('mason-registry')

			mr.refresh(function()
				for _, tool in ipairs({
					-- lua
					'stylua',
					'selene',
					'luacheck',
					'lua-language-server',
					-- web dev
					'prettier',
					'prettierd',
					-- docker
					'docker-language-server',
					-- bash
					'shfmt',
					'shellcheck',
					'shellharden',
					'bash-language-server',
					-- golang
					'gopls',
					'gofumpt',
					'goimports',
					-- python
					'ruff',
					'debugpy',
					'basedpyright',
					-- markdown
					'markdown-oxide',
					-- javascript
					'js-debug-adapter',
					'typescript-language-server',
					-- toml
					'taplo',
					-- c
					'clangd',
					'clang-format',
					-- language agnostic
					'typos', -- code source spell checker
				}) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end)
		end,
		keys = {
			{
				'<leader>M',
				mode = 'n',
				'<cmd>Mason<CR>',
				desc = 'Mason open',
			},
		},
	},
}
