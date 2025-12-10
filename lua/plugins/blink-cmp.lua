return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	version = '1.*',
	opts = {
		appearance = {
			nerd_font_variant = 'mono',
		},
		cmdline = { enabled = false },
		completion = {
			documentation = {
				auto_show = false,
			},
			accept = {
				auto_brackets = {
					enabled = false,
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
					treesitter = {
						'lsp',
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
			implementation = 'prefer_rust_with_warning',
		},
		snippets = {
			preset = 'default',
		},
		signature = {
			enabled = false,
		},
		keymap = {
			preset = 'none',
			['<c-space>'] = { 'hide' },
			['<c-y>'] = { 'select_and_accept' },
			['<Up>'] = { 'select_prev' },
			['<Down>'] = { 'select_next' },
			['<Tab>'] = { 'snippet_forward', 'fallback' },
			['<S-Tab>'] = { 'snippet_backward', 'fallback' },
			['<c-n>'] = { 'select_next' },
			['<c-p>'] = { 'select_prev' },
			['<c-b>'] = { 'scroll_documentation_up' },
			['<c-f>'] = { 'scroll_documentation_down' },
			['<c-e>'] = {
				'show',
				'show_documentation',
				'hide_documentation',
				'hide',
			},
		},
	},
	opts_extend = { 'sources.default' },
	config = function(_, opts)
		local blink = require('blink.cmp')
		blink.setup(opts)

		local autoCompletionEnabled = true

		local function EnableAutoCompletion()
			vim.b.completion = true
			autoCompletionEnabled = true
			print('Auto completion enabled')
		end

		local function DisableAutoCompletion()
			vim.b.completion = false
			blink.hide()
			autoCompletionEnabled = false
			print('Auto completion disabled')
		end

		local function ToggleAutoCompletion()
			if autoCompletionEnabled then
				DisableAutoCompletion()
			else
				EnableAutoCompletion()
			end
		end

		vim.keymap.set('n', '\\\\', ToggleAutoCompletion, { desc = 'Toggle Blink Cmp Completion' })
	end,
}
