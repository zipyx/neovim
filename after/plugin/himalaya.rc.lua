local status, himalaya = pcall(require, "himalaya")
if (not status) then return end

himalaya.setup({})

-- Himalaya (email client)
vim.g.himalaya_folder_picker = 'telescope'
vim.g.himalaya_folder_picker_telescope_preview = 1
