local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lualine/lualine.nvim'         -- Statusline
  use 'nvim-lua/plenary.nvim'             -- Common utilities
  use 'onsails/lspkind-nvim'              -- Vscode-like pictograms
  use 'hrsh7th/cmp-buffer'                -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'              -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                  -- Completion
  use 'neovim/nvim-lspconfig'             -- LSP
  use 'williamboman/mason.nvim'           -- Install language servers
  use 'williamboman/mason-lspconfig.nvim' -- Language server configuration files
  use 'jay-babu/mason-nvim-dap.nvim'      -- Debugging langauage protocol (update)
  use 'jose-elias-alvarez/null-ls.nvim'   -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  -- use 'glepnir/lspsaga.nvim' -- LSP UIs
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require('lspsaga').setup({})
    end,
  })
  use 'L3MON4D3/LuaSnip' -- LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- File tree neovim
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- use 'itchyny/calendar.vim' -- Utility plugins open mail
  use 'kyazdani42/nvim-web-devicons'               -- File icons
  use 'nvim-telescope/telescope.nvim'              -- Browsing, fuzzy finder etc
  use 'nvim-telescope/telescope-file-browser.nvim' -- File Browser
  use 'pwntester/octo.nvim'                        -- Github commandline (gh)
  use 'windwp/nvim-autopairs'                      -- Pairs such as quotes and brackers etc
  -- use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'                -- Color and theme related
  -- use 'folke/zen-mode.nvim'
  use 'Pocco81/TrueZen.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'akinsho/nvim-bufferline.lua'
  use 'github/copilot.vim'

  -- Debugging
  use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap', 'jbyuki/one-small-step-for-vimkind' } }

  -- Database Access
  use 'dinhhuy258/vim-database'
  use { 'kristijanhusak/vim-dadbod-ui', requires = {
    'tpope/vim-dadbod',
    'tpope/vim-dotenv',
    -- 'ellisonleao/dotenv.nvim',
    'kristijanhusak/vim-dadbod-completion'
  } }

  -- Running unit tests for javascript / typescript
  use 'David-Kunz/jester'

  -- Highlighting words
  use 'dwrdx/mywords.nvim'

  -- Vimwiki (Can't use plugin to export from neorg to markdown as per this issue below)
  -- https://github.com/nvim-neorg/neorg/issues/668
  -- [Solution]: We need to temp disable plugin before exporting in neorg
  -- use 'vimwiki/vimwiki'

  -- Neorg
  -- use {
  --   "nvim-neorg/neorg",
  --   run = ":Neorg sync-parsers",
  --   requires = "nvim-lua/plenary.nvim",
  -- }

  -- Pomodoro
  use {
    'wthollingsworth/pomodoro.nvim',
    requires = 'MunifTanjim/nui.nvim',
  }

  -- Scratchpad
  use 'mtth/scratch.vim'

  -- Floating terminals
  use 'voldikss/vim-floaterm'
  -- Moving window buffers
  use 'c60cb859/bufMov.nvim'

  -- Git
  use 'tpope/vim-fugitive'      -- Git actions
  use 'lewis6991/gitsigns.nvim' -- Git signs along lines
  use 'dinhhuy258/git.nvim'     -- Git blame and browse
  use 'kdheepak/lazygit.nvim'   -- Floating git window with actions

  -- Code runner within neovim
  use 'CRAG666/code_runner.nvim'

  -- Email Client based on Himalaya CLI installation
  use 'https://git.sr.ht/~soywod/himalaya-vim'

  -- Sending REST http requests
  use 'NTBBloodbath/rest.nvim'

  -- Vim utilties
  use 'tpope/vim-commentary'    -- Commenting stuff out
  use 'tpope/vim-surround'      -- Wrapping text with quotes, brackets etc
  use 'junegunn/vim-easy-align' -- Aligning text/syntax based on selector
  use 'lotabout/skim'           -- Rust fuzzy finder = blazingly fast
  use 'jbyuki/venn.nvim'        -- Draw ASCII diagrams in vim
  use 'anuvyklack/hydra.nvim'   -- Heads (keybindings)

  -- Fun stuff
  use 'letieu/hacker.nvim'

  -- Navigating just the immediate working files in a project
  use 'ThePrimeagen/harpoon'
end)
