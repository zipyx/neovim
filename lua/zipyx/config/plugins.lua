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
  -- Using packer
  use { 'redbug312/cactusbuddy', requires = 'tjdevries/colorbuddy.vim' }
  use 'nvim-lua/plenary.nvim'             -- Common utilities
  use 'nvim-lualine/lualine.nvim'         -- Statusline
  use 'onsails/lspkind-nvim'              -- Vscode-like pictograms
  use 'hrsh7th/cmp-buffer'                -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'              -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                  -- Completion
  use 'neovim/nvim-lspconfig'             -- LSP
  use 'williamboman/mason.nvim'           -- Install language servers
  use 'williamboman/mason-lspconfig.nvim' -- Language server configuration files
  use 'jay-babu/mason-nvim-dap.nvim'      -- Debugging langauage protocol (update)
  use 'jose-elias-alvarez/null-ls.nvim'   -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

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
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- File tree neovim
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use 'itchyny/calendar.vim'                       -- Utility Calendar
  use 'kyazdani42/nvim-web-devicons'               -- File icons
  use 'nvim-telescope/telescope.nvim'              -- Browsing, fuzzy finder etc
  use 'nvim-telescope/telescope-file-browser.nvim' -- File Browser
  use 'pwntester/octo.nvim'                        -- Github commandline (gh)
  use 'windwp/nvim-autopairs'                      -- Pairs such as quotes and brackers etc
  -- use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'                -- Color and theme related
  use 'wojciechkepka/vim-github-dark'              -- Github dark theme
  use 'Pocco81/TrueZen.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Vimwiki (Can't use plugin to export from neorg to markdown as per this issue below)
  -- https://github.com/nvim-neorg/neorg/issues/668
  -- [Solution]: We need to temp disable plugin before exporting in neorg
  -- use 'vimwiki/vimwiki'

  -- ===================================================================================
  -- [Productivity]
  use 'folke/todo-comments.nvim' -- TODO comments
  use 'mtth/scratch.vim'         -- Scratchpad (temp)
  use {                          -- Pomodoro timer
    'wthollingsworth/pomodoro.nvim',
    requires = 'MunifTanjim/nui.nvim',
  }

  -- ===================================================================================
  -- [Vim-Specific]
  use 'c60cb859/bufMov.nvim'        -- Moving buffers around
  use 'rcarriga/nvim-notify'        -- Notifications (nvim notifications)
  use 'akinsho/nvim-bufferline.lua' -- Bufferline

  -- ===================================================================================
  -- [Development]
  use 'github/copilot.vim'                            -- GitHub copilot
  use 'NTBBloodbath/rest.nvim'                        -- REST client
  use 'https://git.sr.ht/~soywod/himalaya-vim'        -- Email client
  use { 'michaelb/sniprun', run = 'sh ./install.sh' } -- Code execution (1)
  use 'CRAG666/code_runner.nvim'                      -- Code execution (2)
  use 'voldikss/vim-floaterm'                         -- Floating terminal (1)
  use 'numToStr/FTerm.nvim'                           -- Floating terminal (2)
  use 'CRAG666/betterTerm.nvim'                       -- Terminal
  use 'NeogitOrg/neogit'                              -- Git actions
  use 'lewis6991/gitsigns.nvim'                       -- Git signs along lines
  use { 'rcarriga/nvim-dap-ui', requires = {          -- Debugging
    'mfussenegger/nvim-dap',
    'jbyuki/one-small-step-for-vimkind'
  } }
  use 'dinhhuy258/vim-database'                      -- Database (1)
  use { 'kristijanhusak/vim-dadbod-ui', requires = { -- Database (2)
    'tpope/vim-dadbod',                              -- Database UI
    'tpope/vim-dotenv',                              -- Environment variables
    'kristijanhusak/vim-dadbod-completion'           -- Database auto completion
  } }


  -- ===================================================================================
  -- [Text-Manipulation]
  use 'tpope/vim-surround'      -- Text wrapper (quotes, brackets etc)
  use 'junegunn/vim-easy-align' -- Text aligning (expression)
  use 'dwrdx/mywords.nvim'      -- Text highlighting
  use 'lervag/vimtex'           -- Latex support

  -- ===================================================================================
  -- [Utilities]
  use 'tpope/vim-commentary'       -- Code commenting
  use 'jbyuki/venn.nvim'           -- Draw ASCII diagrams in vim
  use 'anuvyklack/hydra.nvim'      -- Keybindings with layers
  use 'letieu/hacker.nvim'         -- Hacker fun stuff
  use 'ThePrimeagen/harpoon'       -- File naviation
  use 'knubie/vim-kitty-navigator' -- Navigating vim panes along kitty
end)
