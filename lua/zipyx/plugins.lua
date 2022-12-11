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
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- Vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim' -- Install language servers
  use 'williamboman/mason-lspconfig.nvim' -- Language server configuration files
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  use 'glepnir/lspsaga.nvim' -- LSP UIs
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

  use 'itchyny/calendar.vim' -- Utility plugins open mail
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope.nvim' -- Browsing, fuzzy finder etc
  use 'nvim-telescope/telescope-file-browser.nvim' -- File Browser
  use 'windwp/nvim-autopairs' -- Pairs such as quotes and brackers etc
  -- use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua' -- Color and theme related
  use 'folke/zen-mode.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'akinsho/nvim-bufferline.lua'
  use 'github/copilot.vim'

  -- Database
  use 'dinhhuy258/vim-database'
  -- use 'tpope/vim-dadbod' -- Imported from vim
  -- use 'kristijanhusak/vim-dadbod-ui' -- Imported from vim

  -- Running unit tests for javascript / typescript
  use 'David-Kunz/jester'

  -- Commenting stuff out
  use 'tpope/vim-commentary'

  -- Vimwiki, notes stuff
  use 'vimwiki/vimwiki'

  -- Scratchpad
  use 'mtth/scratch.vim'

  -- Floating terminals
  use 'voldikss/vim-floaterm'

  -- Moving window buffers
  use 'c60cb859/bufMov.nvim'

  -- Presentations (slides)
  use 'Chaitanyabsprip/present.nvim'

  -- Git
  use 'tpope/vim-fugitive' -- Git actions
  use 'lewis6991/gitsigns.nvim' -- Git signs along lines
  use 'dinhhuy258/git.nvim' -- Git blame and browse
  use 'kdheepak/lazygit.nvim' -- Floating git window with actions

  -- Sending REST http requests
  use 'NTBBloodbath/rest.nvim'

  -- NodeJS & javascript linting
  use { 'quick-lint/quick-lint-js', rtp = 'plugin/vim/quick-lint-js.vim', tag = '2.10.0', opt = true }

end)
