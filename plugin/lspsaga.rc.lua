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
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
keymap.set('n', '<C-n>', diagnostic.goto_next, opts)
keymap.set('n', '<C-p', diagnostic.goto_prev, opts)
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap.set('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap.set('n', 'g,', '<Cmd>Lspsaga references<CR>', opts)

-- Code action
local codeaction = require("lspsaga.codeaction")
keymap.set('n', 'g.', function() codeaction:code_action() end, { silent = true })
keymap.set("v", 'g.', function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  codeaction:range_code_action()
end, { silent = true })
