local fzf = require("fzf-lua")
local dap = require("dap")
local dapui = require("dapui")
local spectre = require("spectre")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Handy functions

local function nnoremap(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true })
end

local function vnoremap(lhs, rhs)
	vim.keymap.set("v", lhs, rhs, { noremap = true, silent = true })
end

local function inoremap(lhs, rhs)
	vim.keymap.set("i", lhs, rhs, { noremap = true, silent = true })
end

local function tnoremap(lhs, rhs)
	vim.keymap.set("t", lhs, rhs, { noremap = true, silent = true })
end

-- Common
nnoremap("<c-h>", "5<c-w><")
nnoremap("<c-l>", "5<c-w>>")
nnoremap("<c-j>", "5<c-w>-")
nnoremap("<c-k>", "5<c-w>+")

nnoremap("<c-u>", "<c-u>zz")
nnoremap("<c-d>", "<c-d>zz")

vnoremap(">", ">gv")
vnoremap("<", "<gv")
vnoremap("J", ":m'>+1<cr>gv=gv")
vnoremap("K", ":m-2<cr>gv=gv")
inoremap("jj", "<Esc>")
inoremap("<c-j>", "<cmd>lua require('luasnip').jump(1)<cr>")
inoremap("<c-k>", "<cmd>lua require('luasnip').jump(-1)<cr>")
tnoremap("jj", "<c-\\><c-n>")

nnoremap("<leader>p", '"+p')
vnoremap("<leader>p", '"+P')
vnoremap("<leader>y", '"+y')
vnoremap("p", '"_dP')

-- Git
nnoremap("<leader>gg", ":Git<cr>:only<cr>")
nnoremap("<leader>gm", ":Git mergetool<cr>:only<cr>")
nnoremap("<leader>gd", ":Gvdiffsplit!<cr>")
nnoremap("<leader>co", ":diffget //2<cr>")
nnoremap("<leader>ct", ":diffget //3<cr>")
nnoremap("<leader>cb", "?<<<<<<<<cr>dd/=======<cr>dd/>>>>>>><cr>dd")
nnoremap("<leader>cn", "?<<<<<<<<cr>V/>>>>>>><cr>d")

-- Netrw
nnoremap("<leader>.", [[:Explore <bar> :sil! /<c-R>=expand("%:t")<cr><cr>:noh<cr>]])
nnoremap("<leader><Tab>", ":Texplore<cr>")

-- LSP
nnoremap("[d", vim.diagnostic.goto_prev)
nnoremap("]d", vim.diagnostic.goto_next)
nnoremap("gd", vim.lsp.buf.definition)
nnoremap("L", vim.diagnostic.open_float)
nnoremap("K", vim.lsp.buf.hover)
nnoremap("<leader>R", vim.lsp.buf.rename)

-- DAP
nnoremap("<m-b>", dap.toggle_breakpoint)
nnoremap("<m-c>", dap.continue)
nnoremap("<m-o>", dap.step_over)
nnoremap("<m-i>", dap.step_into)
nnoremap("<m-t>", dap.terminate)
nnoremap("<m-e>", dapui.eval)

nnoremap("<bslash>d", dapui.toggle)
nnoremap("<bslash>f", function()
	dapui.float_element(nil, { enter = true })
end)

-- Fzf
nnoremap("<leader>f", fzf.files)
nnoremap("<leader>e", fzf.live_grep)
nnoremap("<leader>s", fzf.blines)

nnoremap("<leader>d", fzf.diagnostics_document)
nnoremap("<leader>r", fzf.lsp_references)

nnoremap("<leader>gf", fzf.git_files)
nnoremap("<leader>gb", fzf.git_branches)
nnoremap("<leader>gs", fzf.git_stash)
nnoremap("<leader>bl", fzf.buffers)
nnoremap("<leader>m", fzf.resume)

-- Spectre
nnoremap("<leader>S", function()
	spectre.open()
	vim.cmd([[only]])
end)

-- DBUI
nnoremap("<leader>D", ":DBUI<cr>:only<cr>")

-- Formatter
nnoremap("<leader>F", ":Format<cr>")

-- Harpoon
nnoremap("<leader>a", mark.add_file)
nnoremap("<leader>h", ui.toggle_quick_menu)

-- Undotree
nnoremap("<leader>u", vim.cmd.UndotreeToggle)
