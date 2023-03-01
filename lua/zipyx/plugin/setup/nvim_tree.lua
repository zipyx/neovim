local nvim_tree = require("nvim-tree")

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
