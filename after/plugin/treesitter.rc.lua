local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "c",
    "cpp",
    "c_sharp",
    "css",
    "go",
    "html",
    "http",
    "javascript",
    "json",
    "lua",
    "markdown",
    "norg",
    "php",
    "prisma",
    "python",
    "r",
    "rust",
    "sql",
    "swift",
    "terraform",
    "toml",
    "tsx",
    "typescript",
    "yaml"
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
