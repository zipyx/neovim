-- requires
local status, hydra = pcall(require, "hydra")
local status_layer, layer = pcall(require, "hydra.layer")
local status_builtin, builtin = pcall(require, "telescope.builtin")
local status_gitsigns, gitsigns = pcall(require, "gitsigns")
local status_bufmove, bufmove = pcall(require, "bufMov")

-- status
if (not status) then return end
if (not status_layer) then return end
if (not status_builtin) then return end
if (not status_gitsigns) then return end
if (not status_bufmove) then return end

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

-- Side scrolling
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

-- Resize buffer
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

-- ===================================================================================
-- [Plugin] Moving window buffers
-- Rearrange buffers in current window
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

-- ===================================================================================
-- [Plugin] Moving window buffers
-- Rearrange buffers in current window
local opt_buffmover = layer({
  enter = {
    { mode_n, 'mb' },
  },
  layer = {
    { mode_n, 'j', "<cmd>lua require('bufMov').movBuf('down')<CR>",  opts_nowait },
    { mode_n, 'k', "<cmd>lua require('bufMov').movBuf('up')<CR>",    opts_nowait },
    { mode_n, 'h', "<cmd>lua require('bufMov').movBuf('left')<CR>",  opts_nowait },
    { mode_n, 'l', "<cmd>lua require('bufMov').movBuf('right')<CR>", opts_nowait },
  },
  exit = {
    { mode_n, 'i' }
  },
  config = {
    on_enter = function()
      print("enter-layer-buffmover")
      vim.bo.modifiable = false
    end,
    on_exit = function() print("exit-layer-buffmover") end,
    timeout = 3000, --milliseconds
  }
})

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
