return {
	'saghen/blink.cmp',
	version = '1.*',
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
					enabled = false,
				},
			},
			list = {
				selection = {
					preselect = false,
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
			enabled = true,
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
			['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
			['<c-e>'] = { 'show', 'show_documentation', 'hide_documentation', 'hide' },
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
