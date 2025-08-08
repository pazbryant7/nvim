return {
	'jake-stewart/multicursor.nvim',
	branch = '1.0',
	event = 'VeryLazy',
	config = function()
		local mc = require('multicursor-nvim')
		mc.setup()
		local map = vim.keymap.set

		map({ 'n', 'x' }, '<c-n>', function()
			mc.matchAddCursor(1)
		end, { desc = 'Multicursor Start' })

		map({ 'n', 'x' }, '<leader>A', mc.matchAllAddCursors, { desc = 'Multicursor add all cursors' })

		map({ 'n', 'x' }, '<down>', function()
			mc.lineAddCursor(1)
		end)
		map({ 'n', 'x' }, '<up>', function()
			mc.lineAddCursor(-1)
		end)

		map({ 'n', 'x' }, '<leader><down>', function()
			mc.lineSkipCursor(1)
		end)
		map({ 'n', 'x' }, '<leader><up>', function()
			mc.lineSkipCursor(-1)
		end)

		map('x', 'q', function()
			mc.matchSkipCursor(1)
		end, { desc = 'Multicursor Skip' })
		map('x', 'Q', mc.deleteCursor, { desc = 'Multicursor Remove Cursor' })

		map('x', 'I', mc.insertVisual, { desc = 'Multicursor Visual Insert Mode' })
		map('x', 'A', mc.appendVisual, { desc = 'Multicursor Visual Insert Mode Last' })

		map('x', '<leader>tt', function()
			mc.transposeCursors(1)
		end, { desc = 'Multicursor rotate text' })
		map('x', '<leader>TT', function()
			mc.transposeCursors(-1)
		end, { desc = 'Multicursor rotate text' })

		map('n', '<leader>a', mc.alignCursors, { desc = 'Multicursor align cursors' })
		map('n', '<leader>gv', mc.restoreCursors, { desc = 'Multicursor bring back cursors' })
		map('n', 'ga', mc.addCursorOperator, { desc = 'Multicursor cursor each line of the paragraph' })

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
