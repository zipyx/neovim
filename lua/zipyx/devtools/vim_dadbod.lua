local status, connection = pcall(require, "zipyx.config.dotenv")
if (not status) then return end

local status2, globals = pcall(require, "zipyx.config.globals")
if (not status2) then return end

-- =================================================================
-- Not currently in use, but may be useful in the future
-- The below config breaks connection
-- =================================================================
-- local status3, vim_dadbod_ui = pcall(require, "vim-dadbod-ui")
-- if (not status3) then return end

-- local status4, vim_dadbod = pcall(require, "vim-dadbod")
-- if (not status4) then return end

-- -- Not currently used specifically
-- vim_dadbod.setup({})
-- vim_dadbod_ui.setup({})
-- =================================================================
-- =================================================================

-- local connection = require("zipyx.config.dotenv")
-- local globals = require("zipyx.config.globals")
vim.cmd("autocmd!")

-- Add vim-database window layout
-- vim.g.vim_database_window_layout = "right"

-- db_ui connection settings
vim.g.dbs = {
  {
    ["name"] = "u_dev_ad",
    ["url"] = connection.conn_d_db_admin,
  },
  {
    ["name"] = "u_dev_ap",
    ["url"] = connection.conn_d_db_api,
  },
  {
    ["name"] = "u_stg_ad",
    ["url"] = connection.conn_s_db_admin,
  },
  {
    ["name"] = "u_stg_ap",
    ["url"] = connection.conn_s_db_api,
  },
  {
    ["name"] = "u_prd_ad",
    ["url"] = connection.conn_p_db_admin,
  },
  {
    ["name"] = "u_prd_ap",
    ["url"] = connection.conn_p_db_api,
  },
}

-- db_ui UI settings
vim.g.db_ui_winwidth = 37
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_win_position = "right"
vim.g.db_ui_save_location = globals.db_ui_path
vim.cmd(
  "autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })"
)

-- db_ui table helpers
vim.g.db_ui_table_helpers = {
  ["mysql"] = {
    ["Rename"] = "RENAME TABLE '{table}' TO ",
    ["Count"] = "SELECT COUNT(*) FROM {table};",
    ["Table Info"] = "SHOW TABLE STATUS LIKE '{table}' \\G;",
    ["Table Schema"] = "SHOW CREATE TABLE {table} \\G;",
    ["ID Locked Tables"] = "SHOW OPEN TABLES WHERE in_use > 1;",
    ["Drop Table (Delete Table)"] = "DROP TABLE IF EXISTS {table};",
    ["Truncate Table (Remove Values)"] = "TRUNCATE TABLE {table};",
  },
  ["sqlite"] = {
    ["count"] = "SELECT COUNT(*) FROM {table};",
  },
  ["postgresql"] = {
    ["count"] = "SELECT COUNT(*) FROM {table}",
    ["truncate_delete"] = "TRUNCATE TABLE {table}; DELETE FROM {table};",
  },
}
