local opt = vim.opt
local set_hl = vim.api.nvim_set_hl

opt.guicursor = {
	'n-v-c:block-CursorNormal',
	'i:block-CursorInsert',
	'r:block-CursorReplace',
	'o:block-CursorNormal',
	'sm:block-CursorNormal',
}

local cursor_colors = {
	CursorNormal = { fg = '#1E1E2E', bg = '#CDD6F4' },
	CursorInsert = { fg = '#1E1E2E', bg = '#F38BA8' },
	CursorReplace = { fg = '#1E1E2E', bg = '#FAB387' },
}

local function apply_cursor_colors()
	for group, opts in pairs(cursor_colors) do
		set_hl(0, group, opts)
	end
end

vim.api.nvim_create_autocmd({ 'VimEnter', 'ColorScheme' }, {
	callback = apply_cursor_colors,
})
