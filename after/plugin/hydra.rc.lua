-- requires
local status, hydra = pcall(require, "hydra")
local status_layer, layer = pcall(require, "hydra.layer")
local status_builtin, builtin = pcall(require, "telescope.builtin")
local status_gitsigns, gitsigns = pcall(require, "gitsigns")

-- status
if (not status) then return end
if (not status_layer) then return end
if (not status_builtin) then return end
if (not status_gitsigns) then return end

-- options / states
local opts = { noremap = true, silent = true }
local opts_nowait = { noremap = true, nowait = true, silent = true }
local state = { exit = true }

-- https://github.com/anuvyklack/hydra.nvim/tree/master/lua/hydra/layer
-- table = { mode, key, command, opts }
local mode_n = 'n'
local mode_v = 'v'
local mode_x = 'x'
local mode_m = { 'n', 'x' }
local opt_side_scroll = layer({
  enter = {
    { mode_m, 'zl', 'zl', opts },
    { mode_m, 'zh', 'zh', opts },
    { mode_m, 'zH', 'zH', opts },
    { mode_m, 'zL', 'zL', opts }
  },

  layer = {
    { mode_m, 'l', '5zl', opts },
    { mode_m, 'h', '5zh', opts },
    { mode_m, 'H', 'zH',  opts },
    { mode_m, 'L', 'zL',  opts }
  },

  exit = {
    { mode_m, 'i' }
  },

  config = {
    on_enter = function()
      print("enter-layer-side-scroll")
      vim.bo.modifiable = false
    end,
    on_exit = function() print("exit-layer-side-scroll") end,
    timeout = 3000, --milliseconds
  }
})

local opt_resize_buffer = layer({
  enter = {
    { mode_n, '<leader>wl', ':vertical resize +7<CR>', opts_nowait },
    { mode_n, '<leader>wh', ':vertical resize -7<CR>', opts_nowait },
    { mode_n, '<leader>wk', ':resize +7<CR>',          opts_nowait },
    { mode_n, '<leader>wj', ':resize -7<CR>',          opts_nowait },
    { mode_n, '<leader>wz', '<C-W>_ \\| <C-W>\\|<CR>', opts_nowait },
    { mode_n, '<leader>wo', '<C-W>=<CR>',              opts_nowait }
  },

  layer = {
    { mode_n, 'l', ':vertical resize +7<CR>', opts_nowait },
    { mode_n, 'h', ':vertical resize -7<CR>', opts_nowait },
    { mode_n, 'k', ':resize +7<CR>',          opts_nowait },
    { mode_n, 'j', ':resize -7<CR>',          opts_nowait },
    { mode_n, 'z', '<C-W>_ \\| <C-W>\\|<CR>', opts_nowait },
    { mode_n, 'o', '<C-W>=<CR>',              opts_nowait }
  },

  exit = {
    { mode_n, 'i' }
  },
  config = {
    on_enter = function()
      print("enter-layer-resize-buffer")
      vim.bo.modifiable = false
    end,
    on_exit = function() print("exit-layer-resize-buffer") end,
    timeout = 3000, --milliseconds
  }
})

local opt_gitsigns = layer({
  enter = {
    { mode_n, '<leader>gg' },
    -- { mode_n, '<leader>gk', gitsigns.prev_hunk, opts_nowait },
  },
  layer = {
    { mode_n, 'j', gitsigns.next_hunk,                 opts_nowait },
    { mode_n, 'k', gitsigns.prev_hunk,                 opts_nowait },
    { mode_n, 's', gitsigns.stage_hunk,                opts_nowait },
    { mode_n, 'r', gitsigns.reset_hunk,                opts_nowait },
    { mode_n, 'u', gitsigns.undo_stage_hunk,           opts_nowait },
    { mode_n, 'a', gitsigns.stage_buffer,              opts_nowait },
    { mode_n, 'U', gitsigns.reset_buffer,              opts_nowait },
    { mode_n, 'x', gitsigns.reset_buffer_index,        opts_nowait },
    { mode_n, 't', gitsigns.toggle_current_line_blame, opts_nowait },
  },
  exit = {
    { mode_n, 'i' }
  },
  config = {
    on_enter = function()
      print("enter-layer-gitsigns")
      vim.bo.modifiable = false
    end,
    on_exit = function() print("exit-layer-gitsigns") end,
    timeout = 3000, --milliseconds
  }
})

-- local v_himalaya = layer({
--   enter = {
--     { mode_m, '<leader>mw', '<Plug>(himalaya-email-write)',                opts }, -- Write email
--     { mode_m, '<leader>mr', '<Plug>(himalaya-email-reply)',                opts }, -- Reply email
--     { mode_m, '<leader>mR', '<Plug>(himalaya-email-reply-all)',            opts }, -- Reply all email
--     { mode_m, '<leader>mf', '<Plug>(himalaya-email-forward)',              opts }, -- Forward email
--     { mode_m, '<leader>ma', '<Plug>(himalaya-email-add-attachment)',       opts }, -- Add attachment to email
--     { mode_m, '<leader>md', '<Plug>(himalaya-email-download-attachments)', opts }, -- Download all attachments of email under cursor
--     { mode_m, '<leader>mC', '<Plug>(himalaya-email-copy)',                 opts }, -- Copy email
--     { mode_m, '<leader>mM', '<Plug>(himalaya-email-move)',                 opts }, -- Move email
--     { mode_m, '<leader>mD', '<Plug>(himalaya-email-delete)',               opts }  -- Delete email
--   },

--   layer = {
--     { mode_m, 'w', '<Plug>(himalaya-email-write)',                opts }, -- Write email
--     { mode_m, 'r', '<Plug>(himalaya-email-reply)',                opts }, -- Reply email
--     { mode_m, 'R', '<Plug>(himalaya-email-reply-all)',            opts }, -- Reply all email
--     { mode_m, 'f', '<Plug>(himalaya-email-forward)',              opts }, -- Forward email
--     { mode_m, 'a', '<Plug>(himalaya-email-add-attachment)',       opts }, -- Add attachment to email
--     { mode_m, 'd', '<Plug>(himalaya-email-download-attachments)', opts }, -- Download all attachments of email under cursor
--     { mode_m, 'C', '<Plug>(himalaya-email-copy)',                 opts }, -- Copy email
--     { mode_m, 'M', '<Plug>(himalaya-email-move)',                 opts }, -- Move email
--     { mode_m, 'D', '<Plug>(himalaya-email-delete)',               opts }  -- Delete email
--   },

--   exit = {
--     { mode_m, 'q' }
--   },
--   config = {
--     on_enter = function()
--       print("enter-layer...")
--       vim.bo.modifiable = false
--     end,
--     on_exit = function() print("exit layer...") end,
--     timeout = 3000, --milliseconds
--   }
-- })

-- local opt_navigation = layer({
--   enter = {
--     { mode_n, '<leader>ls', builtin.find_files,                                   opts_nowait },
--     { mode_n, '<leader>lL', builtin.live_grep,                                    opts_nowait },
--     { mode_n, '<leader>lm', builtin.marks,                                        opts_nowait },
--     { mode_n, '<leader>lr', builtin.registers,                                    opts_nowait },
--     { mode_n, '<leader>lk', builtin.keymaps,                                      opts_nowait },
--     { mode_n, '<leader>lf', builtin.current_buffer_fuzzy_find,                    opts_nowait },
--     { mode_n, '<leader>l1', builtin.treesitter,                                   opts_nowait },
--     { mode_n, '<leader>ll', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts_nowait },
--     -- { mode_n, '<leader>la', ':lua require("harpoon.mark").add_file()<CR>',        opts_nowait },
--     { mode_n, '<leader>lj', ':lua require("harpoon.ui").nav_next()<CR>',          opts_nowait },
--     { mode_n, '<leader>lk', ':lua require("harpoon.ui").nav_prev()<CR>',          opts_nowait },
--     { mode_n, '<leader>lg', ':Octo issue list<CR>',                               opts_nowait },
--   },

--   layer = {
--     { mode_n, 's', builtin.find_files,                                   opts_nowait },
--     { mode_n, 'L', builtin.live_grep,                                    opts_nowait },
--     { mode_n, 'm', builtin.marks,                                        opts_nowait },
--     { mode_n, 'r', builtin.registers,                                    opts_nowait },
--     { mode_n, 'k', builtin.keymaps,                                      opts_nowait },
--     { mode_n, 'f', builtin.current_buffer_fuzzy_find,                    opts_nowait },
--     { mode_n, '1', builtin.treesitter,                                   opts_nowait },
--     { mode_n, 'l', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts_nowait },
--     -- { mode_n, 'a', ':lua require("harpoon.mark").add_file()<CR>',        opts_nowait },
--     { mode_n, 'j', ':lua require("harpoon.ui").nav_next()<CR>',          opts_nowait },
--     { mode_n, 'k', ':lua require("harpoon.ui").nav_prev()<CR>',          opts_nowait },
--     { mode_n, 'g', ':Octo issue list<CR>',                               opts_nowait },
--   },

--   exit = {
--     { mode_n, 'i' }
--   },
--   config = {
--     on_enter = function()
--       print("enter-layer...")
--       vim.bo.modifiable = true
--     end,
--     on_exit = function() print("exit layer...") end,
--     timeout = 3000, --milliseconds
--   }

-- })

-- -- ===================================================================================
-- -- ===================================================================================
-- -- ===================================================================================
-- -- ===================================================================================
-- hydra(
-- -- Instructions
-- -- name = name of your custom
-- -- mode = vim modes (i.e - normal, visual, command etc) {'n', 'v', 'c'}
-- -- body = refers to the command to be executed which then allows you to invoke any of the "heads" commands.
-- -- heads = refers to the keybindings and commands executed after the body command is typed in the respective mode.

-- -- ===================================================================================
-- -- [PlugIn] Telescope
-- --  {
-- --    name = 'v-find-*/telescope',
-- --    mode = 'n',
-- --    body = '<leader>l',
-- --    heads = {
-- --      { 's', builtin.find_files,                state },
-- --      { 'g', builtin.live_grep,                 state },
-- --      { 'm', builtin.marks,                     state },
-- --      { 'r', builtin.registers,                 state },
-- --      { 'k', builtin.keymaps,                   state },
-- --      { 'f', builtin.current_buffer_fuzzy_find, state },
-- --      { '1', builtin.treesitter,                state },
-- --    }
-- --  },

-- -- ===================================================================================
-- -- [Plugin] Commenting stuff out
--   {
--     name = 'v-commentary',
--     mode = { 'n', 'x', 'o' },
--     body = '<leader>;',
--     heads = {
--       { ';', '<Plug>Commentary' },
--       { ';', '<Plug>CommentaryLine' },
--     }
--   },

--   -- ===================================================================================
--   -- [Plugin] Gitsigns & Fugitive
--   -- <leader>go = Opens the current file in git
--   -- <leader>gn = Creates a merge request
--   -- <leader>ga = Get ASCII, Hex and Octal value
--   -- <leader>gp = Open a pull request
--   {
--     name = 'v-git',
--     mode = 'n',
--     body = '<leader>g',
--     -- config = {
--     --   invoke_on_body = true,
--     --   on_enter = function()
--     --     vim.cmd("silent! %foldopen!")
--     --     vim.bo.modifiable = false
--     --     gitsigns.toggle_signs(true)
--     --     gitsigns.toggle_lineh1(true)
--     --   end,
--     --   on_exit = function()
--     --     local cursor_pos = vim.api.nvim_win_get_cursor(0)
--     --     vim.cmd 'loadview'
--     --     vim.api.nvim_win_set_cursor(0, cursor_pos)
--     --     vim.cmd 'normal zv'
--     --     gitsigns.toggle_signs(false)
--     --     gitsigns.toggle_lineh1(false)
--     --     gitsigns.toggle_deleted(false)
--     --   end,
--     -- },
--     heads = {
--       { 'a', ':Lazygit' },
--       { 'j', gitsigns.next_hunk },
--       { 'k', gitsigns.prev_hunk },
--       { 'b', gitsigns.blame_line },
--     }
--   },

--   -- ===================================================================================
--   -- [Plugin] Debugging protocol
--   {
--     name = 'debugging-protocol',
--     mode = 'n',
--     body = '<leader>e',
--     heads = {
--       { 't', ':DapToggleBreakpoint<CR>' },
--       { 'd', ':DapContinue<CR>' },
--       { 'j', ':DapStepOver<CR>' },
--       { 'i', ':DapStepInto<CR>' },
--       { 'o', ':DapStepOut<CR>' },
--       { 'T', ':DapTerminate<CR>' },
--       { 'r', ':DapRestartFrame<CR>' },
--       { 'R', ':DapToggleRepl<CR>' },
--     }
--   }
-- )
