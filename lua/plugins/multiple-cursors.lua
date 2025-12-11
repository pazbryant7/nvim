return {
	'jake-stewart/multicursor.nvim',
	event = 'VeryLazy',
	config = function()
		local mc = require('multicursor-nvim')
		mc.setup()
		local map = vim.keymap.set

		map({ 'n', 'x' }, '<c-n>', function()
			mc.matchAddCursor(1)
		end, { desc = 'Multicursor Start' })

		map('n', '<leader>A', function()
			mc.matchAllAddCursors()
		end, { desc = 'Search all add cursors' })

		map({ 'n', 'x' }, '<down>', function()
			mc.lineAddCursor(1)
		end, { desc = 'Multicursor Add Down' })

		map({ 'n', 'x' }, '<up>', function()
			mc.lineAddCursor(-1)
		end, { desc = 'Multicursor Add Up' })

		map({ 'n', 'x' }, '<leader><down>', function()
			mc.lineSkipCursor(1)
		end, { desc = 'Multicursor Skip Down' })

		map({ 'n', 'x' }, '<leader><up>', function()
			mc.lineSkipCursor(-1)
		end, { desc = 'Multicursor Skip Up' })

		map('x', 'q', function()
			mc.matchSkipCursor(1)
		end, { desc = 'Multicursor Skip Next' })

		map('x', 'Q', mc.deleteCursor, { desc = 'Multicursor Remove Current Cursor' })

		map('x', 'I', mc.insertVisual, { desc = 'Multicursor visual Insert Mode' })
		map('x', 'A', mc.appendVisual, { desc = 'Multicursor visual Insert Mode Last' })

		mc.addKeymapLayer(function(layerSet)
			layerSet({ 'n', 'x' }, '<left>', mc.prevCursor)
			layerSet({ 'n', 'x' }, '<right>', mc.nextCursor)
			layerSet('n', '<esc>', function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				elseif mc.hasCursors() then
					mc.clearCursors()
				else
					vim.cmd('noh')
				end
			end)
		end)

		local hl = vim.api.nvim_set_hl
		hl(0, 'MultiCursorCursor', { link = 'Cursor' })
		hl(0, 'MultiCursorVisual', { link = 'Visual' })
		hl(0, 'MultiCursorSign', { link = 'SignColumn' })
		hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
	end,
}
