local globals = require('zipyx.config.globals')
-- local dotenv = require('vim-dotenv')
-- local sh = require('sh')

vim.cmd [[packadd vim-dotenv]]
vim.cmd(string.format(':Dotenv %s', globals.dot_env_path))
-- vim.cmd(string.format(':verbose Dotenv %s', globals.dot_env_path))

local name = 'Dotenv'
local exists = pcall(vim.api.nvim_exec, ':lua return type(' .. name .. ') == "function"', true)
if exists then
  local success, result = pcall(vim.call, name)
  if success then
    print(string.format([['Success: Function does exist = %s']], result))
  else
    -- print(string.format([['[Output]: success = %s, result = %s']], success, result))
  end
end

-- Custom env variables
local dh, dk, dm =
    vim.fn.DotenvGet('JD_MACHINE_HOST'),
    vim.fn.DotenvGet('JD_MACHINE_KEY'),
    vim.fn.DotenvGet('JD_MACHINE')

local su, sk, sm =
    vim.fn.DotenvGet('JS_MACHINE_HOST'),
    vim.fn.DotenvGet('JS_MACHINE_KEY'),
    vim.fn.DotenvGet('JS_MACHINE')

local ph, pk, pm =
    vim.fn.DotenvGet('JP_MACHINE_HOST'),
    vim.fn.DotenvGet('JP_MACHINE_KEY'),
    vim.fn.DotenvGet('JP_MACHINE')

local d_db_admin, s_db_admin, p_db_admin =
    vim.fn.DotenvGet('U_D_ADMIN'),
    vim.fn.DotenvGet('U_S_ADMIN'),
    vim.fn.DotenvGet('U_P_ADMIN')

local d_db_api, s_db_api, p_db_api =
    vim.fn.DotenvGet('U_D_API'),
    vim.fn.DotenvGet('U_S_API'),
    vim.fn.DotenvGet('U_P_API')

-- ######################################################################
-- ######################################################################
-- ######################################################################

-- -- Check all variables set
-- print(string.format([['Dev Host = %s']], dh))
-- print(string.format([['Dev Key = %s']], dk))
-- print(string.format([['Dev Machine = %s']], dm))

-- -- Check all variables set for stg
-- print(string.format([['Stg Host = %s']], su))
-- print(string.format([['Stg Key = %s']], sk))
-- print(string.format([['Stg Machine = %s']], sm))

-- -- Check all variables set for prd
-- print(string.format([['Prd Host = %s']], ph))
-- print(string.format([['Prd Key = %s']], pk))
-- print(string.format([['Prd Machine = %s']], pm))

-- ######################################################################
-- ######################################################################
-- ######################################################################


-- Function to load the variables when called from the below function
local connect = {}
function connect:load_variables()
  self.conn_d_db_admin = d_db_admin
  self.conn_s_db_admin = s_db_admin
  self.conn_p_db_admin = p_db_admin
  self.conn_d_db_api = d_db_api
  self.conn_s_db_api = s_db_api
  self.conn_p_db_api = p_db_api

  -- Individiual hosts
  self.key_d_db_host = dh
  self.key_s_db_host = su
  self.key_p_db_host = ph

  -- Individual keys
  self.key_d_db_key = dk
  self.key_s_db_key = sk
  self.key_p_db_key = pk

  -- Individual machines
  self.key_d_db_machine = dm
  self.key_s_db_machine = sm
  self.key_p_db_machine = pm

  --  self.dev = sh('-v', '-N', '-L', dh,
  --    '-i', dk, dm);

  --  self.stg = sh('-v', '-N', '-L', su,
  --    '-i', sk, sm);

  --  self.prd = sh('-v', '-N', '-L', ph,
  --    '-i', pk, pm);
end

connect:load_variables()

return connect
