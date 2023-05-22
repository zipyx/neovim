local status, better_term = pcall(require, "betterTerm")
if (not status) then return end

local keymap = vim.keymap

-- Set silent noremap
local opts = { noremap = true, silent = true }

-- Toggle term
keymap.set({ "n", "t" }, "<leader>ta", better_term.open, { desc = "Open terminal" })

-- Select term focus
keymap.set({ "n", "t" }, "<leader>tn", better_term.select, { desc = "Select terminal" })

-- setup
better_term.setup({
  prefix = "devTerm_",
  startInserted = true,
  position = "bot",
})
