local code_runner = require("code_runner")
local nvim_tree = require("nvim-tree")
local dap, dapui = require("dap"), require("dapui")
local dap_vs = require("dap.ext.vscode")

dap_vs.load_launchjs(nil, {
  node = { 'js', 'javascript', 'typescript', 'ts' },
  node2 = { 'js', 'javascript', 'typescript', 'ts' },
});

dap.adapters.node = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.config/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.config/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

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

-- dap.configurations.typescript = {
--   {
--     name = 'Launch',
--     type = 'node2',
--     request = 'launch',
--     program = '${fileDirname}/node_modules/.bin/sst',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   },

--   {
--     name = 'SST Debug',
--     type = 'node2',
--     request = 'launch',
--     runtimeExecutable = '/home/onahp/work/prototype/sst-build/node_modules/.bin/sst',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   },

--   {
--     -- For this to work you need to make sure the node process is started with the `--inspect` flag.
--     name = 'Attach to process',
--     type = 'node2',
--     request = 'attach',
--     processId = require 'dap.utils'.pick_process,
--   },
-- }

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

code_runner.setup {
  filetype = {
    c = "cd $dir && cc ./$fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
    cs = "cd $dir && mcs ./$fileName -out:$fileNameWithoutExt.exe && mono ./$fileNameWithoutExt.exe",
    cpp = "cd $dir && g++ ./$fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
    lua = "cd $dir && lua ./$fileName",
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    python = "python3 -u",
    javascript = "node",
    typescript = "deno run",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
  },
}

nvim_tree.setup {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    centralize_selection = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    float = {
      -- Tree window will be floating
      enable = false,
      -- Close the floating tree window when it loses focus
      quit_on_focus_loss = true,
      -- Floating window config
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      }
    }
  },
  -- UI rendering setup
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}
