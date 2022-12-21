vim.cmd("autocmd!")

-- Add database window layout
vim.g.vim_database_window_layout = "below"

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
