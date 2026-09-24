local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(opt.undodir:get(), "p")
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = ""

opt.splitbelow = true
opt.splitright = true

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.mouse = "a"

opt.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1