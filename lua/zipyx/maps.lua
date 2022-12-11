local keymap = vim.keymap
local builtin = require('telescope.builtin')


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

-- Move between window buffers
-- keymap.set('n', '<Space>', '<C-w>w')
-- keymap.set('n', '<S-h>', '<C-w>h')
-- keymap.set('n', '<S-k>', '<C-w>k')
-- keymap.set('n', '<S-j>', '<C-w>j')
-- keymap.set('n', '<S-l>', '<C-w>l')

-- Resize window
keymap.set('n', '<leader>wl', ':vertical resize +7<CR>')
keymap.set('n', '<leader>wh', ':vertical resize -4<CR>')
keymap.set('n', '<leader>wk', ':resize +7<CR>')
keymap.set('n', '<leader>wj', ':resize -4<CR>')
keymap.set('n', '<leader>wi', '<C-W>_ \\| <C-W>\\|<CR>')
keymap.set('n', '<leader>wo', '<C-W>=<CR>')

-- Move lines
keymap.set('n', '<C-u>', ':m .-2<CR>==')
keymap.set('n', '<C-d>', ':m .+1<CR>==')
keymap.set('v', '<C-d>', ":m '>+1<CR>gv=gv")
keymap.set('v', '<C-u>', ":m '<-2<CR>gv=gv")

-- Open & exit terminal mode
keymap.set('n', 'term', ':terminal<CR>')
keymap.set('n', 'vterm', ':terminal<CR>')
keymap.set('n', 't;w', '<C-\\><C-n>')
keymap.set('t', 't;w', '<C-w><C-w>')

-- [Plugin] Floating Terminals
keymap.set('n', '<leader>tn', ':FloatermNew<CR>')
keymap.set('n', '<leader>ta', ':FloatermToggle<CR>')
keymap.set('n', '<leader>td', ':FloatermKill<CR>')
keymap.set('n', '<leader>tk', ':FloatermNext<CR>')
keymap.set('n', '<leader>tj', ':FloatermPrev<CR>')
keymap.set('t', '<leader>tn', '<C-\\><C-n>:FloatermNew<CR>')
keymap.set('t', '<leader>ta', '<C-\\><C-n>:FloatermToggle<CR>')
keymap.set('t', '<leader>td', '<C-\\><C-n>:FloatermKill<CR>')
keymap.set('t', '<leader>tk', '<C-\\><C-n>:FloatermNext<CR>')
keymap.set('t', '<leader>tj', '<C-\\><C-n>:FloatermPrev<CR>')

-- [Plugin] Neovim file tree
keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>')
keymap.set('n', '<leader>tc', ':NvimTreeCollapse<CR>')
keymap.set('n', '<leader>tb', ':NvimTreeCollapseKeepBuffers<CR>')
keymap.set('n', '<leader>tf', ':NvimTreeFindFile<CR>')

-- [Plugin] Moving window buffers
keymap.set('n', '<C-j>', "<cmd>lua require('bufMov').movBuf('down')<CR>", { noremap = true })
keymap.set('n', '<C-k>', ':MoveBufferUp<CR>')
keymap.set('n', '<C-h>', ':MoveBufferLeft<CR>')
keymap.set('n', '<C-l>', ':MoveBufferRight<CR>')
-- mA = Mark window buffer with A
-- mB = Mark window buffer with B
-- 'A = Switch current buffer with buffer marked with A
-- 'B = Switch current buffer with buffer marked with B
-- Other helpful window buffer tips

-- [PlugIn] Telescope
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
keymap.set('n', '<leader>fm', builtin.marks, {})
keymap.set('n', '<leader>fq', builtin.quickfix, {})
keymap.set('n', '<leader>fr', builtin.registers, {})
keymap.set('n', '<leader>gg', builtin.git_status, {})
-- keymap.set('n', '<leader>gb', builtin.git_branches, {})
keymap.set('n', '<leader>gc', builtin.git_commits, {})


-- [Plugin] Commenting stuff out
keymap.set('n', '<leader>;;', '<Plug>Commentary')
keymap.set('n', '<leader>;;', '<Plug>CommentaryLine')
keymap.set('x', '<leader>;;', '<Plug>Commentary')
keymap.set('o', '<leader>;;', '<Plug>Commentary')

-- [Plugin] Markdown preview
keymap.set('n', '<leader>mp', '<Plug>MarkdownPreview')
keymap.set('n', '<leader>mps', '<Plug>MarkdownPreviewStop')
keymap.set('n', '<leader>mpt', '<Plug>MarkdownPreviewToggle')

-- [Plugin] Gitsigns & Fugitive
-- <leader>go = Opens the current file in git
-- <leader>gn = Creates a merge request
-- <leader>ga = Get ASCII, Hex and Octal value
-- <leader>gp = Open a pull request
keymap.set('n', '<leader>ga', ':LazyGit<CR>')
keymap.set('n', '<leader>gp', ':Git push<CR>')
keymap.set('n', '<leader>gc', ':Git commit<CR>')
keymap.set('n', '<leader>gj', ':Gitsigns next_hunk<CR>')
keymap.set('n', '<leader>gk', ':Gitsigns prev_hunk<CR>')
keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')
keymap.set('n', '<leader>gu', ':Gitsigns undo_hunk<CR>')
keymap.set('n', '<leader>gS', ':Gitsigns stage_buffer<CR>')
keymap.set('n', '<leader>gR', ':Gitsigns reset_buffer<CR>')
keymap.set('n', '<leader>gU', ':Gitsigns reset_buffer_index<CR>')
keymap.set('n', '<leader>gB', ':Gitsigns toggle_current_line_blame<CR>')

-- [PlugIn] Database
keymap.set('n', '<leader>du', ':VDToggleDatabase<CR>')
keymap.set('n', '<leader>dq', ':VDToggleQuery<CR>')
-- keymap.set('n', '<leader>du', ':DBUIToggle<CR>')
-- keymap.set('n', '<leader>df', ':DBUIFindBuffer<CR>')
-- keymap.set('n', '<leader>dr', ':DBUIRenameBuffer<CR>')
-- keymap.set('n', '<leader>dl', ':DBUILastQueryInfo<CR>')

-- [Plugin] Sending REST http requests
keymap.set('n', '<leader>rn', '<Plug>RestNvim')
keymap.set('n', '<leader>rl', '<Plug>RestNvimLast')
keymap.set('n', '<leader>rp', '<Plug>RestNvimPreview')

-- [PlugIn] Scratchpad
keymap.set('n', '<leader>sn', ':Scratch<CR>')
keymap.set('n', '<leader>si', ':ScratchInsert<CR>')
keymap.set('n', '<leader>sp', ':ScratchPreview<CR>')
