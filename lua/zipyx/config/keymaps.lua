local keymap = vim.keymap

-- Set leader key
vim.g.mapleader = " "

-- Customed key bindings
keymap.set('n', '<leader>q', ':q<CR>')
-- keymap.set('i', 'jj', '<ESC>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')
-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
keymap.set('n', 'tn', ':tabnew<CR>')

-- Split window
keymap.set('n', 'sp', ':split<Return><C-w>w')
keymap.set('n', 'vsp', ':vsplit<Return><C-w>w')

-- Clipboard (pacman xclip)
keymap.set({ 'n', 'v' }, '<leader>y', '"+y<CR>')
keymap.set({ 'n', 'v' }, '<leader>p', '"+p<CR>')
