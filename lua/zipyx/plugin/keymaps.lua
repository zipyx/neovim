local keymap = vim.keymap
local builtin = require('telescope.builtin')

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
keymap.set('n', '<leader>zi', '<C-W>_ \\| <C-W>\\|<CR>')
keymap.set('n', '<leader>zo', '<C-W>=<CR>')

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

-- [Plugin] Himalaya (Email) using floating terminal
-- https://git.sr.ht/~soywod/himalaya-vim
keymap.set('n', '<leader>oe',
  ':FloatermNew --wintype=float --height=0.7 --width=0.7 --name=email --autoclose=0 --border=curved nvim +Himalaya<CR>') -- Email
keymap.set('n', '<leader>mw', '<Plug>(himalaya-email-write)') -- Write email
keymap.set('n', '<leader>mr', '<Plug>(himalaya-email-reply)') -- Reply email
keymap.set('n', '<leader>mR', '<Plug>(himalaya-email-reply-all)') -- Reply all email
keymap.set('n', '<leader>mf', '<Plug>(himalaya-email-forward)') -- Forward email
keymap.set('n', '<leader>ma', '<Plug>(himalaya-email-add-attachment)') -- Add attachment to email
keymap.set('n', '<leader>md', '<Plug>(himalaya-email-download-attachments)') -- Download all attachments of email under cursor
keymap.set('n', '<leader>mC', '<Plug>(himalaya-email-copy)') -- Copy email
keymap.set('n', '<leader>mM', '<Plug>(himalaya-email-move)') -- Move email
keymap.set('n', '<leader>mD', '<Plug>(himalaya-email-delete)') -- Delete email

-- [Terminal] Applications
keymap.set('n', '<leader>ob',
  ':FloatermNew --wintype=float --height=0.7 --width=0.7 --name=browser --autoclose=0 --border=curved browsh<CR>') -- Browser
keymap.set('n', '<leader>oc',
  ':FloatermNew --wintype=float --height=0.5 --width=0.5 --name=calculator --autoclose=0 --border=curved calc<CR>') -- Calculator
keymap.set('n', '<leader>of',
  ':FloatermNew --wintype=float --height=0.8 --width=0.8 --name=firefox --autoclose=0 --border=curved firefox<CR>') -- Firefox

-- [Plugin] Neovim file tree
keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>')
keymap.set('n', '<leader>tc', ':NvimTreeCollapse<CR>')
keymap.set('n', '<leader>tb', ':NvimTreeCollapseKeepBuffers<CR>')
keymap.set('n', '<leader>tf', ':NvimTreeFindFile<CR>')

-- [Plugin] Neovim utility calendar
keymap.set('n', '<leader>uc', ':Calendar<CR>')

-- [Plugin] Moving window buffers
keymap.set('n', '<C-j>', "<cmd>lua require('bufMov').movBuf('down')<CR>", { noremap = true })
keymap.set('n', '<C-k>', ':MoveBufferUp<CR>')
keymap.set('n', '<C-h>', ':MoveBufferLeft<CR>')
keymap.set('n', '<C-l>', ':MoveBufferRight<CR>')
-- Other helpful window buffer tips
-- mA = Mark window buffer with A
-- mB = Mark window buffer with B
-- 'A = Switch current buffer with buffer marked with A
-- 'B = Switch current buffer with buffer marked with B

-- [PlugIn] Telescope
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fG', builtin.live_grep, {})
keymap.set('n', '<leader>fB', builtin.buffers, {})
keymap.set('n', '<leader>fT', builtin.help_tags, {})
keymap.set('n', '<leader>fm', builtin.marks, {})
keymap.set('n', '<leader>fq', builtin.quickfix, {})
keymap.set('n', '<leader>fr', builtin.registers, {})
keymap.set('n', '<leader>fk', builtin.keymaps, {})
keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, {})
keymap.set('n', '<leader>ft', builtin.current_buffer_tags, {})
keymap.set('n', '<leader>gg', builtin.git_status, {})
-- keymap.set('n', '<leader>gb', builtin.git_branches, {})
-- keymap.set('n', '<leader>gc', builtin.git_commits, {})

-- [Plugin] Jester - running unit tests for javascript/typescript
keymap.set('n', '<leader>ra', ':lua require"jester".run()<CR>')
keymap.set('n', '<leader>rf', ':lua require"jester".run_file()<CR>')
keymap.set('n', '<leader>ro', ':lua require"jester".run_last()<CR>')

-- [Plugin] Commenting stuff out
keymap.set('n', '<leader>;;', '<Plug>Commentary')
keymap.set('n', '<leader>;;', '<Plug>CommentaryLine')
keymap.set('x', '<leader>;;', '<Plug>Commentary')
keymap.set('o', '<leader>;;', '<Plug>Commentary')

-- [Plugin] Highlighting words with colors
keymap.set('n', '<leader>h', ':lua require"mywords".hl_toggle()<CR>')
keymap.set('n', '<leader>rh', ':lua require"mywords".uhl_all()<CR>')

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
-- keymap.set('n', '<leader>gp', ':Git push<CR>')
-- keymap.set('n', '<leader>gc', ':Git commit<CR>')
keymap.set('n', '<leader>gj', ':Gitsigns next_hunk<CR>')
keymap.set('n', '<leader>gk', ':Gitsigns prev_hunk<CR>')
keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')
keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>')
keymap.set('n', '<leader>gS', ':Gitsigns stage_buffer<CR>')
keymap.set('n', '<leader>gR', ':Gitsigns reset_buffer<CR>')
keymap.set('n', '<leader>gU', ':Gitsigns reset_buffer_index<CR>')
keymap.set('n', '<leader>gB', ':Gitsigns toggle_current_line_blame<CR>')

-- [PlugIn] Database
keymap.set('n', '<leader>od', ':VDToggleDatabase<CR>')
keymap.set('n', '<leader>oq', ':VDToggleQuery<CR>')
-- keymap.set('n', '<leader>du', ':DBUIToggle<CR>')
-- keymap.set('n', '<leader>df', ':DBUIFindBuffer<CR>')
-- keymap.set('n', '<leader>dr', ':DBUIRenameBuffer<CR>')
-- keymap.set('n', '<leader>dl', ':DBUILastQueryInfo<CR>')

-- [Plugin] Code runner
keymap.set('n', '<leader>el', ':RunCode<CR>', { noremap = true, silent = false })
keymap.set('v', '<leader>el', ':RunCode<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>ef', ':RunFile<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>et', ':RunFile tab<CR>', { noremap = true, silent = false })
-- keymap.set('n', '<leader>ep', ':RunProject<CR>', { noremap = true, silent = false })
-- keymap.set('n', '<leader>eq', ':RunClose<CR>', { noremap = true, silent = false })
-- keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
-- keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })


-- [Plugin] Sending REST http requests
keymap.set('n', '<leader>ei', '<Plug>RestNvim')
keymap.set('n', '<leader>ep', '<Plug>RestNvimLast')
keymap.set('n', '<leader>eP', '<Plug>RestNvimPreview')

-- [PlugIn] Scratchpad
keymap.set('n', '<leader>sn', ':Scratch<CR>')
keymap.set('n', '<leader>si', ':ScratchInsert<CR>')
keymap.set('n', '<leader>sp', ':ScratchPreview<CR>')
