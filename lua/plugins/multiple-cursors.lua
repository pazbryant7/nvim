return {
	'jake-stewart/multicursor.nvim',
	config = function()
		local mc = require('multicursor-nvim')
		mc.setup()
		local map = vim.keymap.set

		map({ 'n', 'x' }, '<c-n>', function()
			mc.matchAddCursor(1)
		end)

		map('n', '<leader>A', function()
			mc.matchAllAddCursors()
		end)

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
		end)

		map('x', 'Q', mc.deleteCursor)
		map('x', 'I', mc.insertVisual)
		map('x', 'A', mc.appendVisual)

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

	keys = {
		{ '<C-n>', mode = { 'n', 'x' }, desc = 'Multicursor: add next match' },
		{ '<leader>A', mode = 'n', desc = 'Multicursor: add all matches' },
		{ '<Down>', mode = { 'n', 'x' }, desc = 'Multicursor: add cursor below' },
		{ '<Up>', mode = { 'n', 'x' }, desc = 'Multicursor: add cursor above' },
		{ '<leader><Down>', mode = { 'n', 'x' }, desc = 'Multicursor: skip cursor below' },
		{ '<leader><Up>', mode = { 'n', 'x' }, desc = 'Multicursor: skip cursor above' },
		{ 'q', mode = 'x', desc = 'Multicursor: skip next match' },
		{ 'Q', mode = 'x', desc = 'Multicursor: remove cursor' },
		{ 'I', mode = 'x', desc = 'Multicursor: visual insert' },
		{ 'A', mode = 'x', desc = 'Multicursor: visual append' },
		{ '<Left>', mode = { 'n', 'x' }, desc = 'Multicursor: previous cursor' },
		{ '<Right>', mode = { 'n', 'x' }, desc = 'Multicursor: next cursor' },
		{ '<Esc>', mode = 'n', desc = 'Multicursor: clear / exit' },
	},
}
