local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Base.
	"wbthomason/packer.nvim",
	"nvim-lua/plenary.nvim",

	-- LSP & completion.
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",

	-- Debugger.
	"mfussenegger/nvim-dap",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",

	-- Formatters.
	"mhartington/formatter.nvim",
	"Vimjas/vim-python-pep8-indent",
	"michaeljsmith/vim-indent-object",

	-- Syntax highlighting.
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/playground",
	"nvim-treesitter/nvim-treesitter-context",

	-- Navigation & searching.
	"ibhagwan/fzf-lua",
	"theprimeagen/harpoon",
	"windwp/nvim-spectre",
	"mbbill/undotree",

	-- Git integration.
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",

	-- Databases integration.
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-ui",
	"kristijanhusak/vim-dadbod-completion",

	-- Appearence.
	"nvim-lualine/lualine.nvim",
	"gruvbox-community/gruvbox",
	"tjdevries/colorbuddy.nvim",
	{
		"svrana/neosolarized.nvim",
		config = function()
			require("neosolarized").setup({
				comment_italics = true,
				background_set = true,
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- Misc
	"numToStr/Comment.nvim",
}, {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
