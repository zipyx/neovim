require('zipyx.base')
require('zipyx.highlights')
require('zipyx.maps')
require('zipyx.plugins')
require('zipyx.globals')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('zipyx.macos')
end
if is_win then
  require('zipyx.windows')
end
