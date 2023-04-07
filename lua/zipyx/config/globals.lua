local home = os.getenv("HOME")
local os_name = vim.loop.os_uname().sysname:lower()
local config = require('zipyx.plugin.setup.dot_env')
local global = {}
local os

if os_name == "mac" then
  os = "mac"
elseif os_name == "linux" or os_name == "arch" then
  os = "linux"
elseif os_name == "windows" then
  os = "unsuported"
else
  os = "other"
end

function global:load_variables()
  -- OS
  self.os = os
  self.home = home

  -- Workspaces
  self.workspace_personal = "personal"
  self.workspace_research = "research"
  self.workspace_study = "study" -- Default space
  self.workspace_work = "work"

  -- Keymaps
  self.neorg_return_cmd = ':Neorg return<CR>'
  self.neorg_workspace_work_cmd = ':Neorg workspace work<CR>'
  self.neorg_workspace_study_cmd = ':Neorg workspace study<CR>'
  self.neorg_workspace_personal_cmd = ':Neorg workspace personal<CR>'
  self.neorg_workspace_research_cmd = ':Neorg workspace research<CR>'
  self.dotenv_loadenv_cmd = ':Dotenv ' .. home .. config.key_p_path .. '<CR>'

  -- Syspath
  self.mason_path = home .. config.key_p_mason
  self.http_path = home .. config.key_p_path
  self.db_ui_path = home .. config.key_p_dbui
  self.dot_env_path = home .. config.key_p_dot

  -- Syscommand
  self.bashs_dev_path = "bash " .. home .. config.key_p_script .. " dev"
  self.bashs_stg_path = "bash " .. home .. config.key_p_script .. " stg"
  self.bashs_prd_path = "bash " .. home .. config.key_p_script .. " prd"

  -- Floating terminal
  self.float_generic_config =
  ':FloatermNew --wintype=float --height=0.7 --width=0.7 --name=dev --autoclose=0 --border=curved'
  self.float_dbs_config =
  ':FloatermNew --wintype=float --height=0.5 --width=0.5 --name=dev --autoclose=0 --border=curved'

  -- [Terminal] Applications
  self.float_taskui_config =
  ':FloatermNew --wintype=float --height=0.7 --width=0.7 --name=task --autoclose=0 --border=curved tt<CR>'
  self.float_ranger_config =
  ':FloatermNew --wintype=float --height=0.7 --width=0.7 --name=ranger --autoclose=0 --border=curved ranger<CR>'
  self.float_browser_config =
  ':FloatermNew --wintype=float --height=0.7 --width=0.7 --name=browser --autoclose=0 --border=curved browsh<CR>'
  self.float_calculator_config =
  ':FloatermNew --wintype=float --height=0.5 --width=0.5 --name=calculator --autoclose=0 --border=curved calc<CR>'
  self.float_email_config =
  ':FloatermNew --wintype=float --height=0.7 --width=0.7 --name=email --autoclose=0 --border=curved nvim +Himalaya<CR>'

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
