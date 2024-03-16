return {
	'jake-stewart/multicursor.nvim',
	event = 'VeryLazy',
	branch = '1.0',
	config = function()
		local mc = require('multicursor-nvim')
		mc.setup()
		local map = vim.keymap.set

		map({ 'n', 'v' }, '<c-n>', function()
			mc.matchAddCursor(1)
		end, { desc = 'Multicursor Start' })

		map({ 'n', 'x' }, '<up>', function()
			mc.lineAddCursor(-1)
		end)
		map({ 'n', 'x' }, '<down>', function()
			mc.lineAddCursor(1)
		end)
		map({ 'n', 'x' }, '<leader><up>', function()
			mc.lineSkipCursor(-1)
		end)
		map({ 'n', 'x' }, '<leader><down>', function()
			mc.lineSkipCursor(1)
		end)

		map({ 'n', 'v' }, '<right>', mc.nextCursor, { desc = 'Multicursor Next' })

		map(
			{ 'n', 'v' },
			'<left>',
			mc.prevCursor,
			{ desc = 'Multicursor Previous' }
		)

		map('v', 'Q', mc.deleteCursor, { desc = 'Multicursor Remove Cursor' })

		map('v', 'q', function()
			mc.matchSkipCursor(1)
		end, { desc = 'Multicursor Skip' })

		map(
			'v',
			'A',
			mc.appendVisual,
			{ desc = 'Multicursor Visual Insert Mode Last' }
		)
		map('v', 'I', mc.insertVisual, { desc = 'Multicursor Visual Insert Mode' })

		map('n', '<esc>', function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
				vim.cmd('noh')
			end
		end, { desc = 'Multicursor Clear Cursors' })

		local hl = vim.api.nvim_set_hl
		hl(0, 'MultiCursorCursor', { link = 'Cursor' })
		hl(0, 'MultiCursorVisual', { link = 'Visual' })
		hl(0, 'MultiCursorSign', { link = 'SignColumn' })
		hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
	end,
}
