-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.cino = "(2s,us,U1,m1,M0,Ls,:0,l1,g0,N-s,t0,+2s,k2s,j1,J1,P1"
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- Options
vim.opt.number = true
vim.opt.updatetime = 100
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.ignorecase = false
vim.opt.laststatus = 3
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.guicursor = ""
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Globals
vim.g.mapleader = " "
vim.g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"
vim.g.netrw_banner = 0
vim.g.netrw_fastbrowse = 2
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.cmd([[
	" Do not automatically continue the comment on the next line
	autocmd BufEnter * set formatoptions-=cro
	autocmd BufEnter * setlocal formatoptions-=cro
]])
