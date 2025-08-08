return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	version = '1.*',
	dependencies = {
		'saghen/blink.compat',
		{
			'L3MON4D3/LuaSnip',
			version = 'v2.*',
			config = function()
				require('luasnip.loaders.from_lua').lazy_load({ paths = { './snippets' } })
			end,
		},
	},
	opts = {
		cmdline = {
			enabled = true,
			completion = {
				menu = {
					auto_show = true,
				},
				accept = {
					auto_brackets = {
						enabled = false,
					},
				},
			},
		},
		completion = {
			documentation = { auto_show = false },
			menu = {
				draw = {
					columns = {
						{ 'label', 'label_description', gap = 1 },
						{ 'kind_icon', 'kind', gap = 1 },
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
				'buffer',
				'cmdline',
			},
			providers = {
				lazydev = {
					name = 'LazyDev',
					module = 'lazydev.integrations.blink',
					score_offset = 100,
				},
				snippets = {
					score_offset = 100,
					min_keyword_length = 2,
				},
			},
			transform_items = function(_, items)
				local wanted = {}
				local SnippetKind = require('blink.cmp.types').CompletionItemKind.Snippet
				for _, item in ipairs(items) do
					if item.kind == SnippetKind then
						local is_from_lsp = (item.source_name == 'LSP')
						if not is_from_lsp then
							table.insert(wanted, item)
						end
					else
						table.insert(wanted, item)
					end
				end
				return wanted
			end,
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		snippets = { preset = 'luasnip' },
		signature = { enabled = true },

		keymap = {
			preset = 'none',
			['<c-space>'] = { 'hide' },
			['<c-z>'] = { 'show_signature', 'hide_signature', 'fallback' },
			['<c-y>'] = { 'select_and_accept', 'fallback' },
			['<Up>'] = { 'select_prev', 'fallback' },
			['<Down>'] = { 'select_next', 'fallback' },
			['<Tab>'] = { 'snippet_forward', 'fallback' },
			['<S-Tab>'] = { 'snippet_backward', 'fallback' },
			['<c-n>'] = { 'select_next', 'fallback_to_mappings' },
			['<c-p>'] = { 'select_prev', 'fallback_to_mappings' },
			['<c-b>'] = { 'scroll_documentation_up', 'fallback' },
			['<c-f>'] = { 'scroll_documentation_down', 'fallback' },
			['<c-e>'] = {
				'show',
				'show_documentation',
				'hide_documentation',
				'hide',
			},
		},
	},
	opts_extend = { 'sources.default' },
}
