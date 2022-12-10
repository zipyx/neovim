local globals = require('zipyx.config.globals')
local connection = require('zipyx.plugin.setup.dot_env')

vim.cmd("autocmd!")

-- Add vim-database window layout
vim.g.vim_database_window_layout = "right"

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

-- Add vimwiki path and set file extension
vim.g.vimwiki_list = { { path = '~/vimwiki/', syntax = 'markdown', ext = '.md' } }
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_command_for_global = 0
vim.g.mkdp_open_to_the_world = 0
vim.g.mkdp_open_ip = ''
vim.g.mkdp_browser = ''
vim.g.mkdp_echo_preview_url = 0
vim.g.mkdp_browserfunc = ''
vim.g.mkdp_markdown_css = ''
vim.g.mkdp_highlight_css = ''
vim.g.mkdp_port = ''
vim.g.mkdp_page_title = '${name}'
vim.g.mkdp_filetypes = { 'markdown' }
vim.g.mkdp_theme = ''

-- Neovim file tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Neovim utility plugins - calendar
vim.g.calendar_google_calendar = 1
vim.g.calendar_google_task = 1

-- Clipboard perhaps
vim.g.yankring_clipboard_monitor = 0

-- Himalaya (email client)
vim.g.himalaya_folder_picker = 'telescope'
vim.g.himalaya_folder_picker_telescope_preview = 1
