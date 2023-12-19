local formatter = require("formatter")

formatter.setup({
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		python = {
			require("formatter.filetypes.python").black,
		},

		cpp = {
			function()
				return {
					exe = "clang-format",
					args = {
						"-assume-filename=" .. vim.api.nvim_buf_get_name(0),
						"-style=file:$XDG_CONFIG_HOME/clang-format",
					},
					stdin = true,
				}
			end,
		},

		c = {
			function()
				return {
					exe = "clang-format",
					args = {
						"-assume-filename=" .. vim.api.nvim_buf_get_name(0),
						"-style=file:$XDG_CONFIG_HOME/clang-format",
					},
					stdin = true,
				}
			end,
		},

		tex = {
			require("formatter.filetypes.latex").latexindent,
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
