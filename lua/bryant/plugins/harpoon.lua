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
		harpoon:setup()

    -- stylua: ignore start
		return {
      { '<c-l>', function() harpoon:list():next({ ui_nav_wrap = true }) end, desc = 'Harpoon next harpoon', },
      { '<c-h>', function() harpoon:list():prev({ ui_nav_wrap = true }) end, desc = 'Harpoon previous harpoon', },
      { '<c-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Harpoon toggle quick menu', },
      { '<c-y>', function() harpoon:list():add() vim.notify("file added to harpoon",vim.log.levels.INFO, { title = "Harpoon" }) end, desc = 'Harpoon add', },
		}
	end,
}
