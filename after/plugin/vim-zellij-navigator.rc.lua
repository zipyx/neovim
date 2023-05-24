local status, zellij = pcall(require, "zellij")
if (not status) then return end

zellij.setup {
  -- keys with designated default values.
  -- path = "zellij",                            -- Zellij binary path
  replaceVimWindowNavigationKeybinds = false, -- Will set keybinds like <C-w>h to left
  vimTmuxNavigatorKeybinds = false,           -- Will set keybinds like <C-h> to left
  debug = false,                              -- Will log things to /tmp/zellij.nvim
}
