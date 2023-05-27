local status, harpoon = pcall(require, "harpoon")
if (not status) then return end

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

harpoon.setup {
  projects = {
    ["~/work/lumio"] = {
      term = {
        cmds = {
          "pnpm dev:app",
        },
        pos = "bottom",
      },
    },
    ["~/work/lumio/packages/db"] = {
      term = {
        cmds = {
          "pnpm db:generate",
          "pnpm db:push",
          "pnpm db:mysql:introspect",
        },
        pos = "bottom",
      },
    },
  },
}