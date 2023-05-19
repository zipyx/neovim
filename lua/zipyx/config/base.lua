vim.cmd("autocmd!")

-- Encoding ============================================================================
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Filings =============================================================================
vim.opt.swapfile = false
vim.opt.title = true

-- Editing =============================================================================
vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.breakindent = true
vim.opt.cmdheight = 1
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2


-- UI ===================================================================================
--vim.opt.shell = 'fish'
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.showcmd = true
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.wrap = false -- No Wrap lines
vim.wo.number = true
-- vim.opt.ttymouse = 'sgr'


-- Folding ==============================================================================
-- vim.o.foldmethod = 'nested'
-- vim.o.foldnestmax = 10

-- Undercurl ============================================================================
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert ==============================================
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add Astericks ========================================================================
vim.opt.formatoptions:append { 'r' }
