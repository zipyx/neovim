local status, vim_test = pcall(require, "vim_test")
if (not status) then return end

vim.g["test#strategy"] = { nearest = 'neovim', file = 'neovim', suite = 'kitty', }
