vim.opt.number = true
vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.signcolumn = "yes"

vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 0
vim.opt.statusline = " "
vim.opt.shortmess = vim.opt.shortmess + "lmwsI"
vim.opt.fillchars = "eob: "

vim.opt.mouse = ""

vim.opt.cursorline = true

vim.opt.colorcolumn = "120"

vim.opt.sessionoptions = "buffers,curdir,terminal"

-- fixes nasty bug when fast press of <esc><key> is treated as <m-key>
-- https://github.com/neovim/neovim/issues/2454#issuecomment-98403203
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0

vim.g.no_man_maps = true

vim.g.editorconfig = false
