local o = vim.opt_local

if vim.bo.ft ~= 'man' then
	return
end

o.number = true
o.relativenumber = true
