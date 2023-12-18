local formatter = require("formatter")

formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
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
						"-style=file:$HOME/.clang-format",
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
						"-style=file:$HOME/.clang-format",
					},
					stdin = true,
				}
			end,
		},

		cmake = {
			require("formatter.filetypes.cmake").cmakeformat,
		},

		sql = {
			require("formatter.filetypes.sql").pgformat,
		},

		mysql = {
			require("formatter.filetypes.sql").pgformat,
		},

		cs = {
			require("formatter.filetypes.cs").dotnet_format,
		},

		html = {
			require("formatter.filetypes.html").prettier,
		},

		css = {
			require("formatter.filetypes.css").prettier,
		},

		tex = {
			require("formatter.filetypes.latex").latexindent,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
