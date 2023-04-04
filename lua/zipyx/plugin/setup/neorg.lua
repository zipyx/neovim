local neorg = require('neorg')

neorg.setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.integrations.treesitter"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.export"] = {
      config = {},
    },
    ["core.export.markdown"] = {
      config = {
        extensions = {
          -- "org",
          "md",
          -- "markdown",
          -- "txt",
          -- "all"
        },
      }
    },                            -- Adds support for exporting to markdown
    ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.norg.dirman"] = {      -- Manages Neorg workspaces
      config = {
        workspaces = {
          personal = "~/vimwiki/neorg/personal",
          research = "~/vimwiki/neorg/research",
          study = "~/vimwiki/neorg/study",
          work = "~/vimwiki/neorg/work",
        },
        -- default_workspace = "study",
      },
    },
  },
}
