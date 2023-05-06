local dap, dapui = require("dap"), require("dapui")
local dap_vs = require("dap.ext.vscode")
local globals = require('zipyx.config.globals')

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

-- Rust debugger setup (using cpptools)
dap.configurations.rust = {

  {
    -- Rust debugger using codelldb does not support
    -- current architecture (aarch64)
    name = "[Codelldb] Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },

  {
    name = "[Cppdbg] Launch",
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
    name = "[Attach] To gdbserver :1234",
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

-- C config
dap.configurations.c = dap.configurations.rust;

-- C++ config
dap.configurations.cpp = dap.configurations.rust;

-- Javascript config
dap.configurations.javascript = {

  {
    name = '[Node] Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },

  {
    name = '[Browser] Firefox',
    type = 'firefox',
    request = 'launch',
    reAttach = true,
    url = 'http://localhost:3000',
    webRoot = '${workspaceFolder}',
    firefoxExecutable = '/usr/bin/firefox',
  },

  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = '[Attach] To process',
    type = 'node2',
    request = 'attach',
    processId = require 'dap.utils'.pick_process,
  },
}

-- Typescript config
dap.configurations.typescript = {

  {
    name = "[Deno] Launch",
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
    name = '[Node] Launch',
    type = 'node',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },

  {
    name = '[Node] SST (Serverless Stack)',
    type = 'node',
    request = 'launch',
    runtimeExecutable = '/home/onahp/work/prototype/sst-build/node_modules/.bin/sst',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },

  {
    name = '[Browser] Firefox',
    type = 'firefox',
    request = 'launch',
    reAttach = true,
    url = 'http://localhost:3000',
    webRoot = '${workspaceFolder}',
    firefoxExecutable = '/usr/bin/firefox',
  },

  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = '[Attach] To process',
    type = 'node',
    request = 'attach',
    processId = require 'dap.utils'.pick_process,
  },

}

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
