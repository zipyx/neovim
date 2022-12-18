require('zipyx.base')
require('zipyx.highlights')
require('zipyx.maps')
require('zipyx.plugins')
require('zipyx.globals')
require('code_runner').setup({
  -- put here the commands by filetype
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
})
require('nvim-tree').setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('zipyx.macos')
end
if is_win then
  require('zipyx.windows')
end
