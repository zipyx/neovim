local status, nvim_notify = pcall(require, "nvim-notify")
if (not status) then return end

vim.opt.termguicolors = true

nvim_notify.setup {
  background_colour = "#002b36",
}
