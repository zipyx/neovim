local status, neorg = pcall(require, "neorg")
if (not status) then return end

neorg.setup {
  load = {
    ["core.tempus"] = {},
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.ui.calendar"] = {},
    ["core.tangle"] = {},
    ["core.integrations.treesitter"] = {},
    ["core.integrations.truezen"] = {},
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
