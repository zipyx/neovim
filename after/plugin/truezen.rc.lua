local status, truezen = pcall(require, "TrueZen")
if (not status) then return end

truezen.setup({})

-- TrueZen (zen mode) disable call backs
-- vim.g.tz_disable_mode_status_when
vim.g.tz_disable_ataraxis_open_pre = true
vim.g.tz_disable_ataraxis_open_pos = true
vim.g.tz_disable_ataraxis_close_pre = true
vim.g.tz_disable_ataraxis_close_pos = true

vim.g.tz_disable_minimalist_open_pre = true
vim.g.tz_disable_minimalist_open_pos = true
vim.g.tz_disable_minimalist_close_pre = true
vim.g.tz_disable_minimalist_close_pos = true

vim.g.tz_disable_narrow_open_pre = true
vim.g.tz_disable_narrow_open_pos = true
vim.g.tz_disable_narrow_close_pre = true
vim.g.tz_disable_narrow_close_pos = true

vim.g.tz_disable_focus_open_pre = true
vim.g.tz_disable_focus_open_pos = true
vim.g.tz_disable_focus_close_pre = true
vim.g.tz_disable_focus_close_pos = true
