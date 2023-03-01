local dap, dapui = require("dap"), require("dapui")
local dap_vs = require("dap.ext.vscode")
local globals = require('zipyx.config.globals')


-- #####################################
-- VSCode interface
-- #####################################
dap_vs.load_launchjs(nil, {
  node = { 'js', 'javascript', 'typescript', 'ts' },
  node2 = { 'js', 'javascript', 'typescript', 'ts' },
});

-- #####################################
-- Debug adapters
-- #####################################

dap.adapters.node = {
  type = 'executable',
  command = 'deno',
  args = globals.mason_path .. '/packages/node-debug2-adapter/out/src/nodeDebug.js',
  -- args = { os.getenv('HOME') .. '/.config/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = globals.mason_path .. '/packages/node-debug2-adapter/out/src/nodeDebug.js',
  -- args = { os.getenv('HOME') .. '/.config/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = globals.mason_path .. '/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

-- dap.adapters.codelldb = {
--   type = 'server',
--   port = "${port}",
--   executable = {
--     command = os.getenv('HOME') .. "/.local/share/nvim/mason/packages/codelldb/codelldb",
--     args = { "--port", "${port}" },
--   }
-- }

-- #####################################
-- Rust debugger setup (using cpptools)
dap.configurations.rust = {
  {
    name = "Launch file",
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
    name = "Attach to gdbserver :1234",
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
}

-- #####################################
-- C debugger setup
dap.configurations.c = dap.configurations.rust;

-- #####################################
-- CPP debugger setup
dap.configurations.cpp = dap.configurations.rust;

-- #####################################
-- Rust debugger using codelldb does not support
-- current architecture (aarch64)
-- #####################################
-- dap.configurations.rust = {
--   {
--     name = 'Launch file',
--     type = 'codelldb',
--     request = 'launch',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--   }
-- }
-- #####################################

-- #####################################
-- Javascript debugger setup
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },

  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require 'dap.utils'.pick_process,
  },
}

-- #####################################
-- Typescript debugger setup
dap.configurations.typescript = {
  {
    name = 'Launch',
    type = 'node',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },

  {
    name = 'SST Debug',
    type = 'node',
    request = 'launch',
    runtimeExecutable = '/home/onahp/work/prototype/sst-build/node_modules/.bin/sst',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },

  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node',
    request = 'attach',
    processId = require 'dap.utils'.pick_process,
  },
}

-- #####################################
-- Debuugger UI integration
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
