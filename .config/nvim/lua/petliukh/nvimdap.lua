local dap = require("dap")

-- Adapters
dap.adapters.coreclr = {
	type = "executable",
	command = "/usr/bin/netcoredbg",
	args = { "--interpreter=vscode" },
}

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode",
	name = "lldb",
}

-- Configurations
dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to DLL > ", vim.fn.getcwd() .. "/bin/Debug/", "file")
		end,
	},
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

dap.configurations.c = dap.configurations.cpp

dap.configurations.rust = dap.configurations.cpp

-- DAP UI
local dapui = require("dapui")
local dvirttext = require("nvim-dap-virtual-text")

dapui.setup({
	icons = { expanded = "v", collapsed = ">", current_frame = "->" },
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expand_lines = vim.fn.has("nvim-0.7") == 1,
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.33 },
				"breakpoints",
			},
			size = 53,
			position = "right",
		},
	},
	controls = {
		enabled = true,
		element = "repl",
		icons = {
			pause = "PS",
			play = "PL",
			step_into = "SI",
			step_over = "SV",
			step_out = "SO",
			step_back = "SB",
			run_last = "RL",
			terminate = "T",
			disconnect = "DC",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	},
})

dvirttext.setup({})
