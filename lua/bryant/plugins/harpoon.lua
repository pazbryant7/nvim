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
	keys = function()
		local harpoon = require('harpoon')

		return {
			{
				'<c-l>',
				function()
					harpoon:list():next({ ui_nav_wrap = true })
				end,
				desc = 'Harpoon next harpoon',
			},
			{
				'<c-h>',
				function()
					harpoon:list():prev({ ui_nav_wrap = true })
				end,
				desc = 'Harpoon previous harpoon',
			},
			{
				'<c-e>',
				function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = 'Harpoon toggle quick menu',
			},
			{
				'<c-y>',
				function()
					harpoon:list():add()
					vim.notify('file added to harpoon', vim.log.levels.INFO, { title = 'Harpoon' })
				end,
				desc = 'Harpoon add',
			},

			{
				'<leader>[',
				function()
					harpoon:list():select(1)
				end,
				desc = 'Harpoon go to 1',
			},
			{
				'<leader>{',
				function()
					harpoon:list():select(2)
				end,
				desc = 'Harpoon go to 2',
			},
			{
				'<leader>(',
				function()
					harpoon:list():select(3)
				end,
				desc = 'Harpoon go to 3',
			},
			{
				'<leader>%',
				function()
					harpoon:list():select(4)
				end,
				desc = 'Harpoon go to 4',
			},
		}
	end,
}
