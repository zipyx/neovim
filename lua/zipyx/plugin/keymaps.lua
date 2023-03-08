local keymap = vim.keymap
local builtin = require('telescope.builtin')
local globals = require('zipyx.config.globals')

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
-- keymap.set('n', 'term', ':terminal<CR>', opts)
-- keymap.set('n', 'vterm', ':terminal<CR>', opts)
-- keymap.set('n', 't;w', '<C-\\><C-n>', opts)
-- keymap.set('t', 't;w', '<C-w><C-w>', opts)

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
keymap.set('n', '<leader>mw', '<Plug>(himalaya-email-write)', opts)                -- Write email
keymap.set('n', '<leader>mr', '<Plug>(himalaya-email-reply)', opts)                -- Reply email
keymap.set('n', '<leader>mR', '<Plug>(himalaya-email-reply-all)', opts)            -- Reply all email
keymap.set('n', '<leader>mf', '<Plug>(himalaya-email-forward)', opts)              -- Forward email
keymap.set('n', '<leader>ma', '<Plug>(himalaya-email-add-attachment)', opts)       -- Add attachment to email
keymap.set('n', '<leader>md', '<Plug>(himalaya-email-download-attachments)', opts) -- Download all attachments of email under cursor
keymap.set('n', '<leader>mC', '<Plug>(himalaya-email-copy)', opts)                 -- Copy email
keymap.set('n', '<leader>mM', '<Plug>(himalaya-email-move)', opts)                 -- Move email
keymap.set('n', '<leader>mD', '<Plug>(himalaya-email-delete)', opts)               -- Delete email

-- [Terminal] Applications
keymap.set('n', '<leader>oe', globals.float_email_config, opts)      -- Email
keymap.set('n', '<leader>ob', globals.float_browser_config, opts)    -- Browser
keymap.set('n', '<leader>oc', globals.float_calculator_config, opts) -- Calculator

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
keymap.set('n', '<leader>oD', ':VDToggleDatabase<CR>', opts)
keymap.set('n', '<leader>oQ', ':VDToggleQuery<CR>', opts)
keymap.set('n', '<leader>od', ':DBUIToggle<CR>', opts)
-- keymap.set('n', '<leader>du', ':DBUIToggle<CR>', opts)
-- keymap.set('n', '<leader>df', ':DBUIFindBuffer<CR>', opts)
-- keymap.set('n', '<leader>dr', ':DBUIRenameBuffer<CR>', opts)
-- keymap.set('n', '<leader>dl', ':DBUILastQueryInfo<CR>', opts)

-- [Plugin] Code runner
keymap.set('n', '<leader>el', ':RunCode<CR>', opts)
keymap.set('v', '<leader>el', ':RunCode<CR>', opts)
keymap.set('n', '<leader>ef', ':RunFile<CR>', opts)
-- keymap.set('n', '<leader>et', ':RunFile tab<CR>', opts)
-- keymap.set('n', '<leader>ep', ':RunProject<CR>', opts)
-- keymap.set('n', '<leader>eq', ':RunClose<CR>', opts)
-- keymap.set('n', '<leader>crf', ':CRFiletype<CR>', opts)
-- keymap.set('n', '<leader>crp', ':CRProjects<CR>', opts)

-- [Plugin] Debugging protocol
keymap.set('n', '<leader>et', ':DapToggleBreakpoint<CR>', opts)
keymap.set('n', '<leader>ed', ':DapContinue<CR>', opts)
keymap.set('n', '<leader>ej', ':DapStepOver<CR>', opts)
keymap.set('n', '<leader>ei', ':DapStepInto<CR>', opts)
keymap.set('n', '<leader>eo', ':DapStepOut<CR>', opts)
keymap.set('n', '<leader>eT', ':DapTerminate<CR>', opts)
keymap.set('n', '<leader>er', ':DapRestartFrame<CR>', opts)
keymap.set('n', '<leader>eR', ':DapToggleRepl<CR>', opts)

-- [Plugin] Sending REST http requests
keymap.set('n', '<leader>eh', '<Plug>RestNvim', opts)
keymap.set('n', '<leader>ep', '<Plug>RestNvimLast', opts)
keymap.set('n', '<leader>eP', '<Plug>RestNvimPreview', opts)

-- [PlugIn] Scratchpad
keymap.set('n', '<leader>sn', ':Scratch<CR>', opts)
keymap.set('n', '<leader>si', ':ScratchInsert<CR>', opts)
keymap.set('n', '<leader>sp', ':ScratchPreview<CR>', opts)

-- [Plugin] EasyAlign
keymap.set('n', 'ea', ':LiveEasyAlign<CR>', opts)
keymap.set('x', 'ea', ':LiveEasyAlign<CR>', opts)

-- [Plugin] Neorg
keymap.set('n', '<leader>ni', globals.neorg_workspace_work_cmd, opts)
keymap.set('n', '<leader>ns', globals.neorg_workspace_study_cmd, opts)
keymap.set('n', '<leader>np', globals.neorg_workspace_personal_cmd, opts)
keymap.set('n', '<leader>nr', globals.neorg_workspace_research_cmd, opts)
keymap.set('n', '<leader>nq', globals.neorg_return_cmd, opts)

-- [Plugin] LSP Lines
-- keymap.set('', '<leader>nl', require('lsp_lines').toggle, { desc = "Toggle lsp_lines" }, opts)

-- [Plugin] Pomodoro
keymap.set('n', '<leader>ps', ':PomodoroStart<CR>', opts)
keymap.set('n', '<leader>pc', ':PomodoroStatus<CR>', opts)
keymap.set('n', '<leader>pe', ':PomodoroStop<CR>', opts)

-- [Local Machine] Actions
keymap.set('n', '<leader>ld', globals.dotenv_loadenv_cmd, opts)
keymap.set('n', '<leader>lD', string.format('%s %s<CR>', globals.float_dbs_config, globals.bashs_dev_path), opts)
keymap.set('n', '<leader>lS', string.format('%s %s<CR>', globals.float_dbs_config, globals.bashs_stg_path), opts)
keymap.set('n', '<leader>lP', string.format('%s %s<CR>', globals.float_dbs_config, globals.bashs_prd_path), opts)
