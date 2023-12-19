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
	lspconfig.clangd,
	lspconfig.pyright,
	lspconfig.jsonls,
	lspconfig.yamlls,
	lspconfig.bashls,
	lspconfig.texlab,
}

for _, server in ipairs(auto_setup_servers) do
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
