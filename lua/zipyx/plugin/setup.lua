local code_runner = require("code_runner")
local nvim_tree = require("nvim-tree")

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
}
