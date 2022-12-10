local keymap = vim.keymap

-- Set leader key
vim.g.mapleader = " "

-- Customed key bindings
keymap.set('n', '<leader>q', ':q<CR>')
-- keymap.set('n', '<S-Q>', ':quitall<CR>')
-- keymap.set('i', 'jj', '<ESC>')

-- Delete single character
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
keymap.set('n', 'tn', ':tabnew<CR>')

-- Access Tabs
keymap.set('n', 'tj', ':tabnext<CR>')
keymap.set('n', 'tl', ':tablast<CR>')

-- Split window
keymap.set('n', 'sp', ':split<Return><C-w>w')
keymap.set('n', 'vsp', ':vsplit<Return><C-w>w')

-- Clipboard (pacman xclip)
keymap.set('n', '<leader>cy', '"+y<CR>')
keymap.set('v', '<leader>cy', '"+y<CR>')
keymap.set('n', '<leader>cp', '"+p<CR>')
keymap.set('v', '<leader>cp', '"+p<CR>')
