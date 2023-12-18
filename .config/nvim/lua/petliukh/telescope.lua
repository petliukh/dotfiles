local telescope = require("telescope")

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"venv",
		},
		layout_strategy = "center",
		layout_config = { height = 0.9, width = 0.9 },
		scroll_strategy = "limit",
		color_devicons = false,
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})
