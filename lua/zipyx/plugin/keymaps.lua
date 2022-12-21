local keymap = vim.keymap
local builtin = require('telescope.builtin')

-- Move between window buffers
-- keymap.set('n', '<Space>', '<C-w>w', opts)
-- keymap.set('n', '<S-h>', '<C-w>h', opts)
-- keymap.set('n', '<S-k>', '<C-w>k', opts)
-- keymap.set('n', '<S-j>', '<C-w>j', opts)
-- keymap.set('n', '<S-l>', '<C-w>l', opts)

-- Set silent noremap
local opts = { noremap = true, silent = true }

-- Resize window
keymap.set('n', '<leader>wl', ':vertical resize +7<CR>', opts)
keymap.set('n', '<leader>wh', ':vertical resize -4<CR>', opts)
keymap.set('n', '<leader>wk', ':resize +7<CR>', opts)
keymap.set('n', '<leader>wj', ':resize -4<CR>', opts)
keymap.set('n', '<leader>zi', '<C-W>_ \\| <C-W>\\|<CR>', opts)
keymap.set('n', '<leader>zo', '<C-W>=<CR>', opts)

-- Move lines
keymap.set('n', '<C-u>', ':m .-2<CR>==', opts)
keymap.set('n', '<C-d>', ':m .+1<CR>==', opts)
keymap.set('v', '<C-d>', ":m '>+1<CR>gv=gv")
keymap.set('v', '<C-u>', ":m '<-2<CR>gv=gv")

-- Open & exit terminal mode
keymap.set('n', 'term', ':terminal<CR>', opts)
keymap.set('n', 'vterm', ':terminal<CR>', opts)
keymap.set('n', 't;w', '<C-\\><C-n>', opts)
keymap.set('t', 't;w', '<C-w><C-w>', opts)

-- [Plugin] Floating Terminals
keymap.set('n', '<leader>tn', ':FloatermNew<CR>', opts)
keymap.set('n', '<leader>ta', ':FloatermToggle<CR>', opts)
keymap.set('n', '<leader>td', ':FloatermKill<CR>', opts)
keymap.set('n', '<leader>tk', ':FloatermNext<CR>', opts)
keymap.set('n', '<leader>tj', ':FloatermPrev<CR>', opts)
keymap.set('t', '<leader>tn', '<C-\\><C-n>:FloatermNew<CR>', opts)
keymap.set('t', '<leader>ta', '<C-\\><C-n>:FloatermToggle<CR>', opts)
keymap.set('t', '<leader>td', '<C-\\><C-n>:FloatermKill<CR>', opts)
keymap.set('t', '<leader>tk', '<C-\\><C-n>:FloatermNext<CR>', opts)
keymap.set('t', '<leader>tj', '<C-\\><C-n>:FloatermPrev<CR>', opts)

-- [Plugin] Himalaya (Email) using floating terminal
-- https://git.sr.ht/~soywod/himalaya-vim
keymap.set('n', '<leader>oe',
  ':FloatermNew --wintype=float --height=0.7 --width=0.7 --name=email --autoclose=0 --border=curved nvim +Himalaya<CR>',
  opts) -- Email
keymap.set('n', '<leader>mw', '<Plug>(himalaya-email-write)', opts) -- Write email
keymap.set('n', '<leader>mr', '<Plug>(himalaya-email-reply)', opts) -- Reply email
keymap.set('n', '<leader>mR', '<Plug>(himalaya-email-reply-all)', opts) -- Reply all email
keymap.set('n', '<leader>mf', '<Plug>(himalaya-email-forward)', opts) -- Forward email
keymap.set('n', '<leader>ma', '<Plug>(himalaya-email-add-attachment)', opts) -- Add attachment to email
keymap.set('n', '<leader>md', '<Plug>(himalaya-email-download-attachments)', opts) -- Download all attachments of email under cursor
keymap.set('n', '<leader>mC', '<Plug>(himalaya-email-copy)', opts) -- Copy email
keymap.set('n', '<leader>mM', '<Plug>(himalaya-email-move)', opts) -- Move email
keymap.set('n', '<leader>mD', '<Plug>(himalaya-email-delete)', opts) -- Delete email

-- [Terminal] Applications
keymap.set('n', '<leader>ob',
  ':FloatermNew --wintype=float --height=0.7 --width=0.7 --name=browser --autoclose=0 --border=curved browsh<CR>', opts) -- Browser
keymap.set('n', '<leader>oc',
  ':FloatermNew --wintype=float --height=0.5 --width=0.5 --name=calculator --autoclose=0 --border=curved calc<CR>', opts) -- Calculator
keymap.set('n', '<leader>of',
  ':FloatermNew --wintype=float --height=0.8 --width=0.8 --name=firefox --autoclose=0 --border=curved firefox<CR>', opts) -- Firefox

-- [Plugin] Neovim file tree
keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', opts)
keymap.set('n', '<leader>tc', ':NvimTreeCollapse<CR>', opts)
keymap.set('n', '<leader>tb', ':NvimTreeCollapseKeepBuffers<CR>', opts)
keymap.set('n', '<leader>tf', ':NvimTreeFindFile<CR>', opts)

-- [Plugin] Neovim utility calendar
keymap.set('n', '<leader>uc', ':Calendar<CR>', opts)

-- [Plugin] Moving window buffers
keymap.set('n', '<C-j>', "<cmd>lua require('bufMov', opts).movBuf('down', opts)<CR>", opts)
keymap.set('n', '<C-k>', ':MoveBufferUp<CR>', opts)
keymap.set('n', '<C-h>', ':MoveBufferLeft<CR>', opts)
keymap.set('n', '<C-l>', ':MoveBufferRight<CR>', opts)
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
keymap.set('n', '<leader>ra', ':lua require"jester".run()<CR>', opts)
keymap.set('n', '<leader>rf', ':lua require"jester".run_file()<CR>', opts)
keymap.set('n', '<leader>ro', ':lua require"jester".run_last()<CR>', opts)

-- [Plugin] Commenting stuff out
keymap.set('n', '<leader>;;', '<Plug>Commentary', opts)
keymap.set('n', '<leader>;;', '<Plug>CommentaryLine', opts)
keymap.set('x', '<leader>;;', '<Plug>Commentary', opts)
keymap.set('o', '<leader>;;', '<Plug>Commentary', opts)

-- [Plugin] Highlighting words with colors
keymap.set('n', '<leader>h', ':lua require"mywords".hl_toggle()<CR>', opts)
keymap.set('n', '<leader>rh', ':lua require"mywords".uhl_all()<CR>', opts)

-- [Plugin] Markdown preview
keymap.set('n', '<leader>pm', '<Plug>MarkdownPreview', opts)
-- keymap.set('n', '<leader>pm', '<Plug>MarkdownPreviewStop', opts)
-- keymap.set('n', '<leader>mpt', '<Plug>MarkdownPreviewToggle', opts)

-- [Plugin] Gitsigns & Fugitive
-- <leader>go = Opens the current file in git
-- <leader>gn = Creates a merge request
-- <leader>ga = Get ASCII, Hex and Octal value
-- <leader>gp = Open a pull request
keymap.set('n', '<leader>ga', ':LazyGit<CR>', opts)
-- keymap.set('n', '<leader>gp', ':Git push<CR>', opts)
-- keymap.set('n', '<leader>gc', ':Git commit<CR>', opts)
keymap.set('n', '<leader>gj', ':Gitsigns next_hunk<CR>', opts)
keymap.set('n', '<leader>gk', ':Gitsigns prev_hunk<CR>', opts)
keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', opts)
keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', opts)
keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', opts)
keymap.set('n', '<leader>gS', ':Gitsigns stage_buffer<CR>', opts)
keymap.set('n', '<leader>gR', ':Gitsigns reset_buffer<CR>', opts)
keymap.set('n', '<leader>gU', ':Gitsigns reset_buffer_index<CR>', opts)
keymap.set('n', '<leader>gB', ':Gitsigns toggle_current_line_blame<CR>', opts)

-- [PlugIn] Database
keymap.set('n', '<leader>od', ':VDToggleDatabase<CR>', opts)
keymap.set('n', '<leader>oq', ':VDToggleQuery<CR>', opts)
-- keymap.set('n', '<leader>du', ':DBUIToggle<CR>', opts)
-- keymap.set('n', '<leader>df', ':DBUIFindBuffer<CR>', opts)
-- keymap.set('n', '<leader>dr', ':DBUIRenameBuffer<CR>', opts)
-- keymap.set('n', '<leader>dl', ':DBUILastQueryInfo<CR>', opts)

-- [Plugin] Code runner
keymap.set('n', '<leader>el', ':RunCode<CR>', opts)
keymap.set('v', '<leader>el', ':RunCode<CR>', opts)
keymap.set('n', '<leader>ef', ':RunFile<CR>', opts)
keymap.set('n', '<leader>et', ':RunFile tab<CR>', opts)
-- keymap.set('n', '<leader>ep', ':RunProject<CR>', opts)
-- keymap.set('n', '<leader>eq', ':RunClose<CR>', opts)
-- keymap.set('n', '<leader>crf', ':CRFiletype<CR>', opts)
-- keymap.set('n', '<leader>crp', ':CRProjects<CR>', opts)


-- [Plugin] Sending REST http requests
keymap.set('n', '<leader>ei', '<Plug>RestNvim', opts)
keymap.set('n', '<leader>ep', '<Plug>RestNvimLast', opts)
keymap.set('n', '<leader>eP', '<Plug>RestNvimPreview', opts)

-- [PlugIn] Scratchpad
keymap.set('n', '<leader>sn', ':Scratch<CR>', opts)
keymap.set('n', '<leader>si', ':ScratchInsert<CR>', opts)
keymap.set('n', '<leader>sp', ':ScratchPreview<CR>', opts)
