local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
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

local plugins = is_man_pager() and {
	{ import = 'plugins.no-neck-pain' },
} or {
	{ import = 'plugins' },
	{ import = 'plugins.lsp.specifics' },
}

require('lazy').setup(plugins, {
	defaults = { lazy = true },
	install = { missing = true, colorscheme = { 'unokai' } },
	checker = { enabled = false, notify = false },
	change_detection = { notify = false },
	ui = { border = 'rounded', backdrop = 100 },
	rocks = { enabled = false },
	pkg = { enabled = false },
	performance = {
		rtp = {
			reset = true,
			disabled_plugins = {
				'2html_plugin',
				'tohtml',
				'getscript',
				'getscriptPlugin',
				'gzip',
				'logipat',
				'netrw',
				'netrwPlugin',
				'netrwSettings',
				'netrwFileHandlers',
				'matchit',
				'tar',
				'tarPlugin',
				'rrhelper',
				'spellfile_plugin',
				'vimball',
				'vimballPlugin',
				'zip',
				'zipPlugin',
				'tutor',
				'rplugin',
				'syntax',
				'synmenu',
				'optwin',
				'compiler',
				'bugreport',
				'ftplugin',
			},
		},
	},
})
