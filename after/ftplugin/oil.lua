local v = vim
local o = v.opt_local

o.laststatus = 2

v.api.nvim_create_autocmd('BufWipeout', {
	pattern = '<buffer>',
	callback = function()
		v.opt.laststatus = 0
	end,
})
