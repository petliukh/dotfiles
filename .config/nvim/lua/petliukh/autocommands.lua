local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

local petliukh_group = create_augroup("PetliukhGroup", { clear = true })

create_autocmd({ "FileType" }, {
	pattern = { "sql", "mysql", "plsql" },
	callback = function()
		require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
	end,
	group = petliukh_group,
})
