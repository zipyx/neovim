local status, builtin = pcall(require, "telescope.builtin")
if (not status) then return end
local status2, globals = pcall(require, "zipyx.config.globals")
if (not status2) then return end

local keymap = vim.keymap

-- ===================================================================================
-- Set silent noremap
local opts = { noremap = true, silent = true }

-- ===================================================================================
-- Refresh file
keymap.set('n', '<leader>R', ':luafile %<CR>', opts)

-- ===================================================================================
-- Move lines
keymap.set('n', '<C-u>', ':m .-2<CR>==', opts)
keymap.set('n', '<C-d>', ':m .+1<CR>==', opts)
keymap.set('v', '<C-d>', ":m '>+1<CR>gv=gv")
keymap.set('v', '<C-u>', ":m '<-2<CR>gv=gv")

-- ===================================================================================
-- Open & exit terminal mode
keymap.set({ 'n', 't' }, '<Esc>', '<C-\\><C-n><CR>', opts)

-- ===================================================================================
-- [Plugin] Floating Terminals
-- keymap.set('n', '<leader>tn', ':FloatermNew<CR>', opts)
-- keymap.set({ 'n', 't' }, '<leader>tT', ':FloatermToggle<CR>', opts)
-- keymap.set({ 'n', 't' }, '<leader>td', ':FloatermKill<CR>', opts)
-- keymap.set('n', '<leader>tk', ':FloatermNext<CR>', opts)
-- keymap.set('n', '<leader>tj', ':FloatermPrev<CR>', opts)
-- keymap.set('t', '<leader>tn', '<C-\\><C-n>:FloatermNew<CR>', opts)
-- keymap.set('t', '<leader>ta', '<C-\\><C-n>:FloatermToggle<CR>', opts)
-- keymap.set('t', '<leader>td', '<C-\\><C-n>:FloatermKill<CR>', opts)
-- keymap.set('t', '<leader>tk', '<C-\\><C-n>:FloatermNext<CR>', opts)
-- keymap.set('t', '<leader>tj', '<C-\\><C-n>:FloatermPrev<CR>', opts)

-- ===================================================================================
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

-- ===================================================================================
-- [Plugin] Neovim file tree
keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', opts)

-- ===================================================================================
-- [Plugin] Neovim utility calendar
keymap.set('n', '<leader>oc', ':Calendar<CR>', opts)

-- ===================================================================================
-- [Plugin] Moving window buffers
-- Other helpful window buffer tips
-- mA = Mark window buffer with A
-- mB = Mark window buffer with B
-- 'A = Switch current buffer with buffer marked with A
-- 'B = Switch current buffer with buffer marked with B

-- ===================================================================================
-- [PlugIn] Telescope
keymap.set('n', '<leader>ls', builtin.find_files, {})
keymap.set('n', '<leader>lg', builtin.live_grep, {})
keymap.set('n', '<leader>lm', builtin.marks, {})
keymap.set('n', '<leader>lr', builtin.registers, {})
keymap.set('n', '<leader>lk', builtin.keymaps, {})
keymap.set('n', '<leader>lf', builtin.current_buffer_fuzzy_find, {})

-- ===================================================================================
-- [Plugin] Commenting stuff out
keymap.set({ 'n', 'x', 'o' }, '<leader>;;', '<Plug>Commentary', opts)
keymap.set('n', '<leader>;;', '<Plug>CommentaryLine', opts)

-- ===================================================================================
-- [Plugin] Highlighting words with colors
keymap.set('n', '<leader>hw', ':lua require"mywords".hl_toggle()<CR>', opts)
keymap.set('n', '<leader>ho', ':lua require"mywords".uhl_all()<CR>', opts)

-- ===================================================================================
-- [Plugin] Markdown preview
keymap.set('n', '<leader>ov', '<Plug>MarkdownPreview', opts)

-- ===================================================================================
-- [PlugIn] Database
-- keymap.set('n', '<leader>od', ':DBUIToggle<CR>', opts)

-- ===================================================================================
-- [Plugin] Debugging protocol
keymap.set('n', '<leader>et', ':DapToggleBreakpoint<CR>', opts)
keymap.set('n', '<leader>ed', ':DapContinue<CR>', opts)
keymap.set('n', '<leader>ej', ':DapStepOver<CR>', opts)
keymap.set('n', '<leader>ei', ':DapStepInto<CR>', opts)
keymap.set('n', '<leader>eo', ':DapStepOut<CR>', opts)
keymap.set('n', '<leader>eT', ':DapTerminate<CR>', opts)
keymap.set('n', '<leader>er', ':DapRestartFrame<CR>', opts)
keymap.set('n', '<leader>eR', ':DapToggleRepl<CR>', opts)

-- ===================================================================================
-- [Plugin] Sending REST http requests
keymap.set('n', '<leader>eh', '<Plug>RestNvim', opts)
keymap.set('n', '<leader>ep', '<Plug>RestNvimLast', opts)
keymap.set('n', '<leader>eP', '<Plug>RestNvimPreview', opts)

-- ===================================================================================
-- [PlugIn] Scratchpad
keymap.set('n', '<leader>os', ':Scratch<CR>', opts)
keymap.set('n', '<leader>si', ':ScratchInsert<CR>', opts)
keymap.set('n', '<leader>sp', ':ScratchPreview<CR>', opts)

-- ===================================================================================
-- [Plugin] EasyAlign
keymap.set({ 'n', 'x' }, '<leader>ea', ':LiveEasyAlign<CR>', opts)

-- ===================================================================================
-- [Plugin] Neorg
keymap.set('n', '<leader>ni', globals.neorg_workspace_work_cmd, opts)
keymap.set('n', '<leader>ns', globals.neorg_workspace_study_cmd, opts)
keymap.set('n', '<leader>np', globals.neorg_workspace_personal_cmd, opts)
keymap.set('n', '<leader>nr', globals.neorg_workspace_research_cmd, opts)
keymap.set('n', '<leader>nq', globals.neorg_return_cmd, opts)

-- ===================================================================================
-- [Plugin] True-Zen
keymap.set('n', '<leader>sf', ':TZFocus<CR>', opts)

-- ===================================================================================
-- [Plugin] Pomodoro
keymap.set('n', '<leader>ps', ':PomodoroStart<CR>', opts)
keymap.set('n', '<leader>pc', ':PomodoroStatus<CR>', opts)
keymap.set('n', '<leader>pe', ':PomodoroStop<CR>', opts)

-- ===================================================================================
-- [Plugin] Hacker-like fun stuff
keymap.set('n', '<leader>hl', ':Hack<CR>', opts)
keymap.set('n', '<leader>hf', ':HackFollow<CR>', opts)

-- ===================================================================================
-- [Local Machine] Actions
keymap.set('n', '<leader>ld', globals.dotenv_loadenv_cmd, opts)
keymap.set('n', '<leader>lD', string.format('%s %s<CR>', globals.float_dbs_config, globals.bashs_dev_path), opts)
keymap.set('n', '<leader>lS', string.format('%s %s<CR>', globals.float_dbs_config, globals.bashs_stg_path), opts)
keymap.set('n', '<leader>lP', string.format('%s %s<CR>', globals.float_dbs_config, globals.bashs_prd_path), opts)

-- ===================================================================================
-- [Terminal] Taskwarrior-tui
keymap.set('n', '<leader>ty', '40jV/#<CR>ky:noh<CR>', opts)

-- ===================================================================================
-- [Plugin] Harpoon
keymap.set('n', '<leader>la', ':lua require("harpoon.mark").add_file()<CR>', opts)
keymap.set('n', '<leader>ll', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap.set('n', '<S-l>', ':lua require("harpoon.ui").nav_next()<CR>', opts)
keymap.set('n', '<S-h>', ':lua require("harpoon.ui").nav_prev()<CR>', opts)

-- ===================================================================================
-- [Plugin] Vim-Kitty-Navigator
keymap.set({ "n", "t" }, "<C-w>h", ":KittyNavigateLeft<CR>", opts)
keymap.set({ "n", "t" }, "<C-w>j", ":KittyNavigateDown<CR>", opts)
keymap.set({ "n", "t" }, "<C-w>k", ":KittyNavigateUp<CR>", opts)
keymap.set({ "n", "t" }, "<C-w>l", ":KittyNavigateRight<CR>", opts)

-- ===================================================================================
-- [Plugin] Octo (gh)
-- https://github.com/pwntester/octo.nvim#%EF%B8%8F-configuration
-- ===================================================================================
-- MAPPINGS
-- ----------------------------------
-- Issues (issue)
-- ----------------------------------
-- >> close, reopen, create, edit, list, search, reload, browser, url
-- ----------------------------------
-- Pull Requests (pr)
-- ----------------------------------
-- >> list, search, edit, reopen, create, close, checkout, commits, changes, merge
-- >> ready, checks, reload, browser, url
-- ----------------------------------
-- Repository (repo)
-- ----------------------------------
-- >> list, fork, browser, url, view
-- ----------------------------------
-- Review (review)
-- ----------------------------------
-- >> start, submit, resume, discard, comments, commit, close
keymap.set('n', '<leader>gl', ':Octo issue list<CR>', opts)
keymap.set('n', '<leader>gs', ':Octo issue search<CR>', opts)
keymap.set('n', '<leader>is', ':Octo issue ', opts)
keymap.set('n', '<leader>pr', ':Octo pr ', opts)
keymap.set('n', '<leader>re', ':Octo review ', opts)
