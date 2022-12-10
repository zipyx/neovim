local home = os.getenv("HOME")
local os_name = vim.loop.os_uname().sysname
local global = {}
local os

if os_name == "Mac" then
  os = "mac"
elseif os_name == "Linux" or os_name == "Arch" then
  os = "linux"
elseif os_name == "Windows" then
  os = "unsuported"
else
  os = "other"
end

function global:load_variables()
  -- OS
  self.os = os
  self.home = home

  -- Syspath
  self.mason_path = home .. "/.local/share/nvim/mason"
  self.db_ui_path = home .. "/.window-manager/dbui/db_ui_history"
  self.dot_env_path = home .. "/.window-manager/dot-env"

  -- Syscommand
  self.bashs_dev_path = "bash " .. home .. "/.window-manager/dot-env/scripts/jump.sh dev"
  self.bashs_stg_path = "bash " .. home .. "/.window-manager/dot-env/scripts/jump.sh stg"
  self.bashs_prd_path = "bash " .. home .. "/.window-manager/dot-env/scripts/jump.sh prd"

  -- Floating terminal
  self.float_dbs_config =
  ':FloatermNew --wintype=float --height=0.5 --width=0.5 --name=dev --autoclose=0 --border=curved'

  -- [Terminal] Applications
  self.float_browser_config =
  ':FloatermNew --wintype=float --height=0.7 --width=0.7 --name=browser --autoclose=0 --border=curved browsh<CR>'
  self.float_calculator_config =
  ':FloatermNew --wintype=float --height=0.5 --width=0.5 --name=calculator --autoclose=0 --border=curved calc<CR>'

  -- General
  self.languages = {}
  self.lvim_packages = false
  self.install_proccess = false

  -- self.lvim_path = home .. "/.config/nvim"
  -- self.cache_path = home .. "/.cache/nvim"
  -- self.packer_path = home .. "/.local/share/nvim/site"
  -- self.snapshot_path = home .. "/.config/nvim/.snapshots"
  -- self.modules_path = home .. "/.config/nvim/lua/modules"
  -- self.global_config = home .. "/.config/nvim/lua/config/global"
  -- self.custom_config = home .. "/.config/nvim/lua/config/custom"
end

global:load_variables()

return global
