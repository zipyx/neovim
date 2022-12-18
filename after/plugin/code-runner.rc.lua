local status, coderunner = pcall(require, "code-runner")
if (not status) then return end

coderunner.setup {
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
}

-- vim.keymap.set('n', '<C-w>o', '<cmd>ZenMode<cr>', { silent = true })
