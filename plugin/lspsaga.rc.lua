local status, saga = pcall(require, "lspsaga")
if (not status) then return end

-- DO NOT USE THIS!!!! THIS IS CAUSING THE CONFIG FILE TO BREAK
-- saga.init_lsp_saga {
--   server_filetype_map = {
--     typescript = 'typescript',
--     javascript = 'javascript',
--     json = 'json',
--     lua = 'lua',
--     python = 'python',
--     go = 'go',
--     rust = 'rust',
--     cpp = 'cpp',
--     c = 'c',
--     csharp = 'csharp',
--   }
-- }

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-n>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'g.', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', 'g,', '<Cmd>Lspsaga references<CR>', opts)
