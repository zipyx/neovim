local status, better_term = pcall(require, "betterTerm")
if (not status) then return end

local keymap = vim.keymap

-- Set silent noremap
local opts = { noremap = true, silent = true }

-- Toggle term
keymap.set({ "n", "t" }, "<leader>ta", better_term.open, { desc = "Open terminal" })

-- Select term focus
keymap.set({ "n", "t" }, "<leader>ts", better_term.select, { desc = "Select terminal" })

-- Create new term
local current = 2
vim.keymap.set(
  { "n" }, "<leader>tn",
  function()
    better_term.open(current)
    current = current + 1
  end,
  { desc = "New terminal" }
)

-- setup
better_term.setup({
  prefix = "devTerm_",
  startInserted = true,
  position = "bot",
})
