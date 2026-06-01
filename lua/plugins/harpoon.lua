return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		settings = {
			save_on_toggle = true,
			sync_on_ui_close = true,
		},
	},
	keys = {
		{
			'<c-l>',
			function()
				require('harpoon'):list():next({ ui_nav_wrap = true })
			end,
			desc = 'Harpoon next harpoon',
		},
		{
			'<c-h>',
			function()
				require('harpoon'):list():prev({ ui_nav_wrap = true })
			end,
			desc = 'Harpoon previous harpoon',
		},
		{
			'<c-e>',
			function()
				require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
			end,
			desc = 'Harpoon toggle quick menu',
		},
		{
			'<c-y>',
			function()
				require('harpoon'):list():add()
				vim.notify('file added to harpoon', vim.log.levels.INFO, { title = 'Harpoon' })
			end,
			desc = 'Harpoon add',
		},
	},
}
