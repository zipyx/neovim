local neorg = require('neorg')

neorg.setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.tangle"] = {},
    ["core.integrations.treesitter"] = {},
    ["core.presenter"] = {
      config = {
        zen_mode = "truezen",
        slide_count = {
          enable = true,
          position = "top",
          count_format = "[%d/%d]"
        },
      },
    },
    ["core.export"] = {
      config = {
        export_dir = "~/vimwiki/neorg/exports",
      },
    },
    ["core.export.markdown"] = {
      config = {
        extensions = {
          "all"
        },
      },
    },
    ["core.manoeuvre"] = {},
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.dirman"] = {      -- Manages Neorg workspaces
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
    ["core.neorgcmd"] = {},
    ["core.neorgcmd.commands.module.list"] = {},
    ["core.neorgcmd.commands.module.load"] = {},
  },
}
