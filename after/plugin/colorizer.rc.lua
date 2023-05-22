local status, colorizer = pcall(require, "colorizer")
if (not status) then return end

vim.opt.termguicolors = true

colorizer.setup {
  '*',
}
