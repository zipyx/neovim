local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end

nvim_tree.setup {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    centralize_selection = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    -- Floating tree window setup
    float = {
      -- Tree window will be floating
      enable = false,
      -- Close the floating tree window when it loses focus
      quit_on_focus_loss = true,
      -- Floating window config
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      }
    }
  },
  -- UI rendering setup
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

-- Clipboard perhaps
vim.g.yankring_clipboard_monitor = 0

-- Globals
-- Neovim file tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
