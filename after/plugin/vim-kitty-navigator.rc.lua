vim.g.kitty_navigator_no_mappings = 1

-- Set keymap alias
local keymap = vim.keymap

-- Set silent noremap
local opts = { noremap = true, silent = true }

-- vim kitty navigator
keymap.set({ "n", "t" }, "<C-w>h", ":KittyNavigateLeft<CR>", opts)
keymap.set({ "n", "t" }, "<C-w>j", ":KittyNavigateDown<CR>", opts)
keymap.set({ "n", "t" }, "<C-w>k", ":KittyNavigateUp<CR>", opts)
keymap.set({ "n", "t" }, "<C-w>l", ":KittyNavigateRight<CR>", opts)
