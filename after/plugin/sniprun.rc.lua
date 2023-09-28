local status, sniprun = pcall(require, "sniprun")
if (not status) then return end

sniprun.setup {
  display = {
    -- "VirtualText",
    -- "VirtualTextErr",
    -- "Classic",
    -- "VirtualTextOk",
    -- "VirtualTextErr",
    -- "TempFloatingWindowOk",
    -- "LongTempFloatingWindow",
    "Terminal",
  },

  display_options = {
    terminal_scrollback = vim.o.scrollback, -- change terminal display scrollback lines
    terminal_line_number = false,           -- whether show line number in terminal window
    terminal_signcolumn = false,            -- whether show signcolumn in terminal window
    terminal_width = 70,                    -- change the terminal display option width
    notification_timeout = 4000,            -- timeout (in seconds) before clearing the output
  },

  live_display = { "VirtualText" },
  live_mode_toggle = 'off',

  borders = 'double'
}
