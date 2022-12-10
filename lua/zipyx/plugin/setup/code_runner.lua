local code_runner = require("code_runner")
local globals = require('zipyx.config.globals')

code_runner.setup {
  -- Mode options = ["term", "toggle", "float", "tab", "toggleterm", "buf"]
  mode = "term",
  focus = false,
  -- Configurations for the intergrated terminal fields.
  term = {
    position = "bot",
    size = 20,
  },
  -- Float mode settings
  float = {
    -- Position options = ["center", "top", "bottom"]
    -- position = "bottom",
    -- Width of the float window
    width = 1,
    -- Height of the float window
    height = 1,
    -- Border options = ["single", "double", "shadow", "curved", "rounded", "none"]
    border = "double",
    -- Transparency of the float window
    blend = 35,
  },
  -- Filetypes and their running command to execute
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
