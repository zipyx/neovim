local neorg = require('neorg')

neorg.setup {
  load = {
    ["core.defaults"] = {},        -- Loads default behaviour
    ["core.export.markdown"] = {}, -- Adds support for exporting to markdown
    ["core.norg.concealer"] = {},  -- Adds pretty icons to your documents
    ["core.norg.dirman"] = {       -- Manages Neorg workspaces
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
