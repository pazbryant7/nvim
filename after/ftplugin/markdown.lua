local o = vim.opt_local

if vim.bo.ft ~= 'markdown' then
	return
end

o.wrap = true
o.spell = true
o.textwidth = 80
