return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	version = '1.*',
	init = function()
		-- runs at startup before lazy loading kicks in
		if os.getenv('LEETCODE') ~= nil then
			vim.diagnostic.enable(false)
		end
	end,
	opts = {
		appearance = {
			nerd_font_variant = 'mono',
		},
		cmdline = { enabled = false },
		completion = {
			documentation = {
				auto_show = true,
			},
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},
			menu = {
				max_height = 10,
				auto_show = true,
				draw = {
					columns = {
						{ 'label', 'label_description', gap = 1 },
						{ 'kind', gap = 1 },
					},
				},
			},
		},
		sources = {
			default = {
				'lazydev',
				'snippets',
				'lsp',
				'path',
			},
			providers = {
				lazydev = {
					name = 'LazyDev',
					module = 'lazydev.integrations.blink',
					score_offset = 100,
				},
				snippets = {
					opts = {
						friendly_snippets = false,
					},
				},
				lsp = {
					transform_items = function(_, items)
						local wanted = {}
						local SnippetKind = require('blink.cmp.types').CompletionItemKind.Snippet
						for _, item in ipairs(items) do
							if item.kind ~= SnippetKind then
								table.insert(wanted, item)
							end
						end
						return wanted
					end,
				},
			},
		},
		fuzzy = {
			implementation = 'rust',
		},
		snippets = {
			preset = 'default',
		},
		signature = {
			enabled = false,
		},
		keymap = {
			preset = 'none',
			['<c-y>'] = { 'accept' },
			['<c-space>'] = { 'hide' },
			['<Up>'] = { 'select_prev' },
			['<c-n>'] = { 'select_next' },
			['<c-p>'] = { 'select_prev' },
			['<Down>'] = { 'select_next' },
			['<c-b>'] = { 'scroll_documentation_up' },
			['<c-f>'] = { 'scroll_documentation_down' },
			['<Tab>'] = { 'snippet_forward', 'fallback' },
			['<S-Tab>'] = { 'snippet_backward', 'fallback' },
			['<c-e>'] = { 'show', 'show_documentation', 'hide_documentation', 'hide' },
		},
	},
	opts_extend = { 'sources.default' },
	config = function(_, opts)
		local cmp_enabled = os.getenv('LEETCODE') == nil

		opts.enabled = function()
			return cmp_enabled
		end

		local blink = require('blink.cmp')

		blink.setup(opts)

		local function EnableAutoCompletion()
			cmp_enabled = true
			vim.diagnostic.enable(true)
			print('Auto completion & diagnostics enabled')
		end

		local function DisableAutoCompletion()
			cmp_enabled = false
			blink.hide()
			vim.diagnostic.enable(false)
			print('Auto completion & diagnostics disabled')
		end

		local function ToggleAutoCompletion()
			if cmp_enabled then
				DisableAutoCompletion()
			else
				EnableAutoCompletion()
			end
		end

		vim.keymap.set('n', '\\\\', ToggleAutoCompletion, { desc = 'Toggle Blink Cmp & Diagnostics' })
	end,
}
