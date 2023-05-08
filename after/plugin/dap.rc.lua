local status, dap = pcall(require, "dap")
if (not status) then return end

-- dapui
local status2, dapui = pcall(require, "dapui")
if (not status2) then return end

-- Dap ext vscode
local status3, dap_vs = pcall(require, "dap.ext.vscode")
if (not status3) then return end

-- config
local status4, globals = pcall(require, "zipyx.config.globals")
if (not status4) then return end

-- #####################################
-- #####################################
-- VSCode interface
-- #####################################
-- #####################################

dap_vs.load_launchjs(nil, {
	node = { 'js', 'javascript', 'typescript', 'ts' },
	node2 = { 'js', 'javascript', 'typescript', 'ts' },
});

-- #####################################
-- #####################################
-- Debug adapters
-- #####################################
-- #####################################

-- Bash debug adapter
dap.adapters.bashdb = {
	type = 'executable',
	command = globals.mason_path .. '/packages/bash-debug-adapter/bash-debug-adapter',
	name = 'bashdb'
}

-- Lua debug adapter for (n)vim
dap.adapters.nlua = function(callback, config)
	callback({
		type = 'server',
		host = config.host or "127.0.0.1",
		port = config.port or 8086,
	})
end

-- Deno based debug adapter works on typescript
dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		args = { globals.mason_path .. "/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
	},
}

-- DENO ADAPTER
-- node / typescript using deno debug adapter
dap.adapters.node = {
	type = 'executable',
	command = 'deno',
	args = { globals.mason_path .. '/packages/node-debug2-adapter/out/src/nodeDebug.js' },
	-- outFiles = { 'out/**/*.js' },
	-- args = { os.getenv('HOME') .. '/.config/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

-- NODE ADAPTER
-- node / typescript using node debug adapter
dap.adapters.node2 = {
	type = 'executable',
	command = 'node',
	args = { globals.mason_path .. '/packages/node-debug2-adapter/out/src/nodeDebug.js' },
	-- args = { os.getenv('HOME') .. '/.config/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

-- cppdbg debug adapter
-- C / C++ / Rust debug adapter
dap.adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = globals.mason_path .. '/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

-- codelldb debug adapter
-- C / C++ / Rust debug adapter
-- If using host, then comment out the port with variable, executable key and it's scope
dap.adapters.codelldb = {
	type = 'server',
	host = '127.0.0.1',
	port = 6000,
	-- port = "${port}",
	-- executable = {
	--   command = globals.mason_path .. "/bin/codelldb",
	--   args = { "--port", "${port}" },
	-- }
}

-- lldb (new) debug adapter
-- C / C++ / Rust debug adapter
dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode',
	name = "lldb",
}

-- Browser firefox debug adapter
dap.adapters.firefox = {
	type = 'executable',
	command = 'node',
	args = { globals.mason_path .. '/packages/vscode-firefox-debug/extension/dist/adapter.bundle.js' },
}

-- #####################################
-- #####################################
-- Debug configurations
-- #####################################
-- #####################################

-- Bash debug config
dap.configurations.sh = {
	{
		name = '[Debug] Launch',
		type = 'bashdb',
		request = 'launch',
		showDebuggerOutput = true,
		pathBashdb = globals.mason_path .. '/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
		pathBashdbLib = globals.mason_path .. '/packages/bash-debug-adapter/extension/bashdb_dir',
		trace = true,
		file = "${file}",
		program = "${file}",
		cwd = '${workspaceFolder}',
		pathCat = "cat",
		pathBash = "/bin/bash",
		pathMkfifo = "mkfifo",
		pathPkill = "pkill",
		args = {},
		env = {},
		terminalKind = "integrated",
	}
}

-- Lua for (n)vim config
dap.configurations.lua = {
	{
		name = "[Attach] To running (n)vim instance",
		type = 'nlua',
		request = 'attach',
	}
}

-- Rust debug config
dap.configurations.rust = {

	{
		-- Rust latest debug protocol (lldb)
		name = "[lldb] Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
	},

	{
		-- Rust debugger using codelldb does not support
		-- current architecture (aarch64)
		name = "[codelldb] Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},

	{
		name = "[cppdbg] Launch",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		-- cwd = vim.fn.getcwd(),
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},

	{
		name = "[attach] To gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		-- cwd = vim.fn.getcwd(),
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
	},

	{
		name = "[attach] To process",
		type = "lldb",
		request = "attach",
		pid = require('dap.utils').pick_process,
		args = {},
	}

}

-- C config
dap.configurations.c = dap.configurations.rust;

-- C++ config
dap.configurations.cpp = dap.configurations.rust;

-- Javascript config
dap.configurations.javascript = {

	{
		name = '[node] Launch',
		type = 'node2',
		request = 'launch',
		program = '${file}',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		console = 'integratedTerminal',
	},

	{
		name = '[browser] Firefox',
		type = 'firefox',
		request = 'launch',
		reAttach = true,
		url = 'http://localhost:3000',
		webRoot = '${workspaceFolder}',
		firefoxExecutable = '/usr/bin/firefox',
	},

	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = '[attach] To process',
		type = 'node2',
		request = 'attach',
		processId = require 'dap.utils'.pick_process,
	},
}

-- Typescript config
dap.configurations.typescript = {

	{
		name = "[deno] Launch",
		type = 'pwa-node',
		request = 'launch',
		runtimeExecutable = "deno",
		runtimeArgs = {
			"run",
			"--inspect-wait",
			"--allow-all"
		},
		program = '${file}',
		cwd = "${workspaceFolder}",
		attachSimplePort = 9229,
	},

	{
		name = '[node] Launch',
		type = 'node',
		request = 'launch',
		program = '${file}',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		console = 'integratedTerminal',
	},

	{
		name = '[node] SST (Serverless Stack)',
		type = 'node',
		request = 'launch',
		runtimeExecutable = '/home/onahp/work/prototype/sst-build/node_modules/.bin/sst',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		console = 'integratedTerminal',
	},

	{
		name = '[browser] Firefox',
		type = 'firefox',
		request = 'launch',
		reAttach = true,
		url = 'http://localhost:3000',
		webRoot = '${workspaceFolder}',
		firefoxExecutable = '/usr/bin/firefox',
	},

	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = '[attach] To process',
		type = 'node',
		request = 'attach',
		processId = require 'dap.utils'.pick_process,
	},

}

-- Typescript React config
dap.configurations.typescriptreact = dap.configurations.typescript;

-- #####################################
-- #####################################
-- Debuugger UI integration
-- #####################################
-- #####################################
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
