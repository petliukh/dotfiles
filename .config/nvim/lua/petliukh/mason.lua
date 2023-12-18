local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

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

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"clangd",
		"pyright",
		"omnisharp",
		"cmake",
		"jsonls",
		"yamlls",
		"dockerls",
		"bashls",
		"texlab",
		"jdtls",
		"html",
		"cssls",
	},
})
