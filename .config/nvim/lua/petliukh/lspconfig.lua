local lspconfig = require("lspconfig")
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<c-space>"] = cmp.mapping.complete(),
		["<c-e>"] = cmp.mapping.abort(),
		["<c-y>"] = cmp.mapping.confirm({ select = true }),
		["<c-p>"] = cmp.mapping.select_prev_item(),
		["<c-n>"] = cmp.mapping.select_next_item(),
		["<c-b>"] = cmp.mapping.scroll_docs(-4),
		["<c-f>"] = cmp.mapping.scroll_docs(4),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	}),
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(client, bufnr)
	vim.diagnostic.config({
		virtual_text = false,
		underline = true,
		update_in_insert = false,
	})
	-- client.server_capabilities.semanticTokensProvider = nil
end

local auto_setup_servers = {
	clangd = lspconfig.clangd,
	pyright = lspconfig.pyright,
	omnisharp = lspconfig.omnisharp,
	cmake = lspconfig.cmake,
	jsonls = lspconfig.jsonls,
	yamlls = lspconfig.yamlls,
	dockerls = lspconfig.dockerls,
	bashls = lspconfig.bashls,
	jdtls = lspconfig.jdtls,
	html = lspconfig.html,
	cssls = lspconfig.cssls,
	prolog_ls = lspconfig.prolog_ls,
}

for _, server in pairs(auto_setup_servers) do
	server.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

------------ Manual setup ------------
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

lspconfig.texlab.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern(".texproj"),
	settings = {
		texlab = {
			rootDirectory = ".texproj",
			build = {
				executable = "pdflatex",
				args = { "-output-directory=build" },
				onSave = false,
				forwardSearchAfter = false,
			},
			auxDirectory = "build",
			forwardSearch = {
				executable = nil,
				args = {},
			},
			chktex = {
				onOpenAndSave = false,
				onEdit = false,
			},
			diagnosticsDelay = 300,
			latexFormatter = "latexindent",
			latexindent = {
				["local"] = nil, -- local is a reserved keyword
				modifyLineBreaks = false,
			},
			bibtexFormatter = "texlab",
			formatterLineLength = 80,
		},
	},
})

vim.filetype.add({ extension = { pro = 'prolog' } })

------------ Border setup ------------
local setup_floating_border = function(border)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = border,
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = border,
	})
	vim.diagnostic.config({
		float = { border = border },
	})

	require("lspconfig.ui.windows").default_options = {
		border = border,
	}
end

setup_floating_border("single")
