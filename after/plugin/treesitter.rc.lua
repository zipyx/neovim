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
    "dockerfile",
    "go",
    "haskell",
    "hcl",
    "html",
    "http",
    "javascript",
    "json",
    "kdl",
    "latex",
    "lua",
    "make",
    "markdown",
    "nix",
    "norg",
    "ocaml",
    "org",
    "php",
    "prisma",
    "python",
    "r",
    "regex",
    "ruby",
    "rust",
    "scala",
    "scss",
    "swift",
    "svelte",
    "terraform",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
    "zig",
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
