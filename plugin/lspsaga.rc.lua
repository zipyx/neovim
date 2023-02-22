local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  ui = {
    winblend = 10,
    border = 'rounded',
    colors = {
      normal_bg = '#002b36'
    }
  }
})

local diagnostic = require("lspsaga.diagnostic")
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<C-j>', diagnostic.goto_next, opts)
keymap('n', 'gl', diagnostic.show_diagnostics, opts)
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
keymap('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap('n', 'g,', '<Cmd>Lspsaga references<CR>', opts)

-- Code action
local codeaction = require("lspsaga.codeaction")
keymap('n', 'g.', function() codeaction:code_action() end, { silent = true })
keymap("v", 'g.', function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  codeaction:range_code_action()
end, { silent = true })
