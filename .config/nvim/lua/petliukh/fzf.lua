local fzf = require("fzf-lua")
local actions = require("fzf-lua.actions")

fzf.setup({
	"max-perf",
	winopts = {
		win_height = 1,
		win_width = 1,
		win_row = 0,
		win_col = 0,
	},
	keymap = {
		builtin = {
			["<F1>"] = "toggle-help",
			["}"] = "preview-page-down",
			["{"] = "preview-page-up",
		},
		fzf = {
			["ctrl-u"] = "unix-line-discard",
			["ctrl-f"] = "half-page-down",
			["ctrl-b"] = "half-page-up",
			["ctrl-a"] = "beginning-of-line",
			["ctrl-e"] = "end-of-line",
			["alt-a"] = "toggle-all",
			["}"] = "preview-page-down",
			["{"] = "preview-page-up",
		},
	},
	actions = {
		files = {
			["default"] = actions.file_edit_or_qf,
			["ctrl-s"] = actions.file_split,
			["ctrl-v"] = actions.file_vsplit,
			["ctrl-t"] = actions.file_tabedit,
			["alt-q"] = actions.file_sel_to_qf,
			["alt-l"] = actions.file_sel_to_ll,
		},
		buffers = {
			["default"] = actions.buf_edit,
			["ctrl-s"] = actions.buf_split,
			["ctrl-v"] = actions.buf_vsplit,
			["ctrl-t"] = actions.buf_tabedit,
		},
	},
	previewers = {
		bat = {
			cmd = "bat",
			args = "--style=numbers,changes --color always",
			theme = "Solarized (light)", -- bat preview theme (bat --list-themes)
			config = nil, -- nil uses $BAT_CONFIG_PATH
		},
	},
})
