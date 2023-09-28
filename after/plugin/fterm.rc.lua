local status, fterm = pcall(require, "FTerm")
if (not status) then return end

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

fterm.setup {}

-- ===================================================================================
-- [Terminal] Applications

local calculator = fterm:new({
  ft = 'fterm_calculator',
  cmd = 'calc',
  dimensions = {
    height = 0.4,
    width = 0.4,
  },
})

local lazygit = fterm:new({
  ft = 'fterm_lazygit',
  cmd = 'lazygit',
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

local taskwarrior = fterm:new({
  ft = 'fterm_taskwarrior',
  cmd = 'taskwarrior-tui',
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

local ranger = fterm:new({
  ft = 'fterm_ranger',
  cmd = 'ranger',
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

local browsh = fterm:new({
  ft = 'fterm_browsh',
  cmd = 'browsh',
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

local ghdash = fterm:new({
  ft = 'fterm_ghdash',
  cmd = 'gh dash',
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

-- ===================================================================================
-- [(N)Vim] Plugins
local v_database = fterm:new({
  ft = 'fterm_v_database',
  cmd = 'nvim +DBUIToggle',
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

-- ===================================================================================
-- [Terminal] Keymaps

keymap.set({ 'n', 'v', 't' }, '<leader>ok', function() calculator:toggle() end, opts)
keymap.set({ 'n', 'v' }, '<leader>ob', function() browsh:toggle() end, opts)
keymap.set({ 'n', 'v' }, '<leader>og', function() lazygit:toggle() end, opts)
keymap.set({ 'n', 'v' }, '<leader>ot', function() taskwarrior:toggle() end, opts)
keymap.set({ 'n', 'v' }, '<leader>or', function() ranger:toggle() end, opts)
keymap.set({ 'n', 'v' }, '<leader>oo', function() ghdash:toggle() end, opts)

-- ===================================================================================
-- [(N)Vim] Keymaps
keymap.set('n', '<leader>od', ':DBUIToggle<CR>', opts)
-- keymap.set({ 'n', 'v' }, '<leader>od', function() v_database:toggle() end, opts)
