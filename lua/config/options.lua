local v = vim
local opt = v.opt
local o = v.o
local g = v.g

g.mapleader = ' '
g.maplocalleader = ' '

opt.clipboard = 'unnamedplus' -- system clipboard

o.guicursor = '' -- always block cursor
o.colorcolumn = '80'
opt.cmdheight = 0
opt.laststatus = 0 -- hide statusline
opt.showmode = true -- still see mode when cmdheight=0
opt.showtabline = 0
opt.termguicolors = true

opt.swapfile = false
opt.undofile = true
opt.wrap = false
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

opt.nu = true
opt.rnu = true
opt.numberwidth = 1
opt.scrolloff = 10

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 50
opt.conceallevel = 0 -- show markdown/obsidian syntax
o.title = true -- nice tmux/window title
opt.shortmess:append('sI') -- no splash screen

opt.iskeyword:append('-') -- - is part of words
o.spelloptions = 'camel' -- spellcheck camelCase properly

opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
opt.grepformat = '%f:%l:%c:%m'

-- folding options
o.foldenable = true
o.foldcolumn = '0'
o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldclose:'
o.foldlevel = 99
o.foldlevelstart = 99
opt.foldlevelstart = 99

if g.neovide then
	o.guifont = 'Maple Mono:h9.5:w1.2:#h-none'
	g.neovide_refresh_rate = 60
	g.neovide_cursor_vfx_mode = 'railgun'
end

vim.cmd('colorscheme unokai')
