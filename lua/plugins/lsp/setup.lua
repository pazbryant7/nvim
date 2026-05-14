local M = {}

local servers = {
	bashls = {},
	clangd = {},
	dockerls = {},
	basedpyright = {},
	markdown_oxide = {},
	docker_compose_language_service = {},
	gopls = {
		settings = {
			gopls = {
				gofumpt = true,
				analyses = { unusedparams = true },
			},
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				telemetry = {
					enable = false,
				},
			},
		},
	},
}

function M.set_diagnostics()
	vim.diagnostic.config({
		underline = true,
		severity_sort = true,
		virtual_text = false,
		virtual_lines = false,
		update_in_insert = false,
		dynamicRegistration = false,
		signs = {
			text = {
				ERROR = 'E',
				WARN = 'W',
				HINT = 'H',
				INFO = '?',
			},
		},
		float = {
			max_width = 100,
			focusable = true,
			style = 'minimal',
			border = 'single',
			header = { ' Diagnostics', 'Bold' },
		},
	})
end

function M.get_capabilities()
	local custom_capabilities = {
		textDocument = {
			semanticTokens = {
				dynamicRegistration = false,
				overlappingTokenSupport = false,
				multilineTokenSupport = false,
				augmentsSyntaxTokens = false,
			},
			completion = {
				dynamicRegistration = false,
				completionItem = {
					snippetSupport = false,
				},
			},
			formatting = { dynamicRegistration = false },
			rangeFormatting = { dynamicRegistration = false },
		},
	}
	local blink_capabilities = require('blink.cmp').get_lsp_capabilities()
	return vim.tbl_deep_extend(
		'force',
		{},
		blink_capabilities,
		custom_capabilities
	)
end

function M.setup_capabilities()
	local capabilities = M.get_capabilities()
	vim.lsp.config('*', { capabilities = capabilities })

	for server, config in pairs(servers) do
		if next(config) then
			vim.lsp.config(server, config)
		end
	end
end

function M.enable_lsp_servers()
	local names = vim.tbl_keys(servers)
	vim.lsp.enable(names)
end

function M.setup()
	M.set_diagnostics()
	M.setup_capabilities()
	M.enable_lsp_servers()
end

return M
