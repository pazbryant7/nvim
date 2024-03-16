return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	version = '1.*',
	dependencies = {
		'saghen/blink.compat',
		'rafamadriz/friendly-snippets',
		{
			'L3MON4D3/LuaSnip',
			version = 'v2.*',
			config = function()
				local ls = require('luasnip')
				ls.config.set_config({
					history = true,
					updateevents = 'TextChanged,TextChangedI',
					enable_autosnippets = true,
				})
				require('luasnip.loaders.from_vscode').lazy_load({
					exclude = { 'sh', 'bash' },
				})
				require('luasnip.loaders.from_lua').lazy_load({
					paths = { './snippets' },
				})
			end,
		},
	},
	opts = {
		cmdline = {
			enabled = true,
			keymap = { preset = 'inherit' },
			completion = { menu = { auto_show = true } },
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
			},
			transform_items = function(_, items)
				local wanted = {}
				for _, item in ipairs(items) do
					if
						not (
							item.kind
								== require('blink.cmp.types').CompletionItemKind.Snippet
							and item.source_id == 'lsp'
						)
					then
						wanted[#wanted + 1] = item
					end
				end
				return wanted
			end,
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		snippets = { preset = 'luasnip' },
		signature = { enabled = true },

		keymap = {
			['<C-space>'] = { 'hide' },
			['<C-y>'] = { 'select_and_accept' },
			['<Up>'] = { 'select_prev', 'fallback' },
			['<Down>'] = { 'select_next', 'fallback' },
			['<m-l>'] = { 'snippet_forward', 'fallback' },
			['<m-h>'] = { 'snippet_backward', 'fallback' },
			['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
			['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
			['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
			['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
			['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
			['<C-e>'] = { 'show', 'show_documentation', 'hide_documentation' },
		},
	},
	opts_extend = { 'sources.default' },
}
