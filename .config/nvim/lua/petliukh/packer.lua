local packer = require("packer")
local use = packer.use

return packer.startup(function()
	-- Base.
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	-- LSP & completion.
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- Debugger.
	use("mfussenegger/nvim-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")

	-- Formatters.
	use("mhartington/formatter.nvim")
	use("Vimjas/vim-python-pep8-indent")
	use("michaeljsmith/vim-indent-object")

	-- Syntax highlighting.
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/playground")
	use("nvim-treesitter/nvim-treesitter-context")

	-- Navigation & searching.
	use("ibhagwan/fzf-lua")
	use("theprimeagen/harpoon")
	use("windwp/nvim-spectre")
	use("mbbill/undotree")

	-- Git integration.
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	-- Databases integration.
	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")
	use("kristijanhusak/vim-dadbod-completion")

	-- Appearence.
	use("nvim-lualine/lualine.nvim")
	use("gruvbox-community/gruvbox")
	use("tjdevries/colorbuddy.nvim")
	use({
		"svrana/neosolarized.nvim",
		config = function()
			require("neosolarized").setup({
				comment_italics = true,
				background_set = true,
			})
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- Misc
	use("numToStr/Comment.nvim")
end)
