local mason = require("mason")
local mason_installer = require("mason-tool-installer")

mason.setup({
	ui = {
		icons = {
			package_installed = "i",
			package_pending = "p",
			package_uninstalled = "u",
		},
		border = "single",
		width = 1,
		height = 0.9,
	},
})

mason_installer.setup({
	ensure_installed = {
		-- LSP
		"lua_ls",
		"clangd",
		"pyright",
		"jsonls",
		"yamlls",
		"bashls",
		"texlab",

		-- Formatters
		"stylua",
		"black",
		"clang-format",
		"latexindent",
	},
})
