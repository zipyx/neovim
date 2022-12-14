require('zipyx.base')
require('zipyx.highlights')
require('zipyx.maps')
require('zipyx.plugins')
require('zipyx.globals')
require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
    cpp = 'g++ -std=c++17 -O2 -Wall % -o %:r && %:r',
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    python = "python3 -u",
    typescript = "deno run",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
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
