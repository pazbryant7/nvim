return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	version = '1.*',

	opts = {
		enabled = function()
			return vim.b.completion ~= false
		end,

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
				'snippets',
				'lsp',
				'path',
			},
			providers = {
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
		local blink = require('blink.cmp')

		blink.setup(opts)

		vim.keymap.set('n', '\\\\', function()
			vim.b.completion = vim.b.completion == false

			if vim.b.completion then
				vim.notify('Blink: enabled')
			else
				blink.hide()
				vim.notify('Blink: disabled')
			end
		end, { desc = 'Toggle Blink completion' })
	end,
}
