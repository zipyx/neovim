-- Nvim base configuration
require('zipyx.config.base')
require('zipyx.config.highlights')
require('zipyx.config.keymaps')
require('zipyx.config.plugins')
require('zipyx.config.globals')

-- Plugin related settings
require('zipyx.plugin.setup.nvim_terminal')
require('zipyx.plugin.setup.code_runner')
require('zipyx.plugin.setup.nvim_tree')
require('zipyx.plugin.setup.pomodoro')
require('zipyx.plugin.setup.nvim_dap')
require('zipyx.plugin.setup.dot_env')
require('zipyx.plugin.setup.neorg')
require('zipyx.plugin.globals')
require('zipyx.plugin.keymaps')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('zipyx.macos')
end
if is_win then
  require('zipyx.windows')
end
