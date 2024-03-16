local v = vim
local opt = v.opt
local o = v.o
local g = v.g

g.mapleader = ' '
g.maplocalleader = ' '

opt.clipboard = 'unnamedplus'

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.showmode = true
opt.showtabline = 0
opt.guicursor = ''

opt.swapfile = false
opt.undofile = true
opt.wrap = false

o.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.cmdheight = 0

opt.nu = true
opt.rnu = true
opt.numberwidth = 1

opt.hlsearch = true
opt.incsearch = true
opt.smartcase = false
opt.ignorecase = false

opt.scrolloff = 5
opt.signcolumn = 'yes:1'
opt.colorcolumn = '80'
opt.isfname:append('@-@')

-- update statusline
opt.laststatus = 0
-- opt.statusline = ' %f%m%r%h%w'

opt.updatetime = 50

opt.termguicolors = true

-- folding options
-- NOTE: zc,zo,za,zC,zO,zM
o.foldenable = true
o.foldcolumn = '0'
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()' -- "v:lua.vim.lsp.foldexpr()"
o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldclose:'
o.foldlevel = 99
o.foldlevelstart = 99
opt.foldlevelstart = 99

-- for obsidian
opt.conceallevel = 2

opt.spell = false
opt.spelllang = { 'en_us', 'es_mx' }

-- set spell file
opt.spellfile = '/home/bryant/.config/spell/en.utf-8.add'

-- disable nvim startup screen
opt.shortmess:append('sI')

-- neovide
if v.g.neovide then
	v.o.guifont = 'Maple Mono:h9.5:w1.2:#h-none'
	v.g.neovide_refresh_rate = 60
	v.g.neovide_cursor_vfx_mode = 'railgun'
end
