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
      { '<m-e>', function() harpoon:list():select(3) end, desc = 'Harpoon go to third harpoon', },
      { '<m-a>', function() harpoon:list():select(1) end, desc = 'Harpoon go to first harpoon', },
      { '<m-u>', function() harpoon:list():select(4) end, desc = 'Harpoon go to fourd harpoon', },
      { '<m-o>', function() harpoon:list():select(2) end, desc = 'Harpoon go to second harpoon', },
      { '<c-l>', function() harpoon:list():next({ ui_nav_wrap = true }) end, desc = 'Harpoon next harpoon', },
      { '<c-h>', function() harpoon:list():prev({ ui_nav_wrap = true }) end, desc = 'Harpoon previous harpoon', },
      { '<c-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Harpoon toggle quick menu', },
      { '<c-y>', function() harpoon:list():add() vim.notify("file added to harpoon",vim.log.levels.INFO, { title = "Harpoon" }) end, desc = 'Harpoon add', },
		}
	end,
}
