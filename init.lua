require('zipyx.config.base')
require('zipyx.config.highlights')
require('zipyx.config.keymaps')
require('zipyx.config.plugins')
require('zipyx.plugin.globals')
require('zipyx.plugin.keymaps')

-- require('zipyx.base')
-- require('zipyx.highlights')
-- require('zipyx.keymaps')
-- require('zipyx.plugins')
-- require('zipyx.globals')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('zipyx.macos')
end
if is_win then
  require('zipyx.windows')
end
