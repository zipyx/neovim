local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('zipyx.os.macos')
end
if is_win then
  require('zipyx.os.windows')
end
