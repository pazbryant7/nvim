local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--branch=stable',
		lazyrepo,
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local function is_man_pager()
	for _, arg in ipairs(vim.v.argv) do
		if arg == '+Man!' or arg:match('^%+Man') then
			return true
		end
	end
	return false
end

local plugins = { { import = 'plugins' } }

if not is_man_pager() then
	table.insert(plugins, { import = 'plugins.lsp.specifics' })
else
	table.insert(plugins, { import = 'plugins.no-neck-pain' })
end

require('lazy').setup(plugins, {
	defaults = { lazy = true },
	checker = { enabled = false, notify = false },
	change_detection = { notify = false },
	ui = { border = 'rounded', backdrop = 100 },
	rocks = { enabled = false },
	pkg = { enabled = false },
	performance = {
		rtp = {
			reset = true,
			disabled_plugins = {
				'zip',
				'tar',
				'gzip',
				'netrw',
				'tutor',
				'tohtml',
				'syntax',
				'optwin',
				'vimball',
				'matchit',
				'synmenu',
				'logipat',
				'rplugin',
				'compiler',
				'ftplugin',
				'rrhelper',
				'zipPlugin',
				'getscript',
				'bugreport',
				'tarPlugin',
				'netrwPlugin',
				'2html_plugin',
				'netrwSettings',
				'vimballPlugin',
				'getscriptPlugin',
				'spellfile_plugin',
				'netrwFileHandlers',
			},
		},
	},
})
