local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({
})

lspconfig.setup {

  -- Commented out files are related to debuggers that we need, just for note
  ensure_installed = {
    "astro",
    "bashls",
    "clangd",
    -- "cpptools",
    "cssls",
    "denols",
    "dockerls",
    "eslint",
    "gopls",
    "graphql",
    "html",
    -- "js-debug-adapter",
    "jsonls",
    "lua_ls",
    "marksman",
    -- "node-debug2-adapter",
    "omnisharp",
    "prismals",
    "pyright",
    "quick_lint_js",
    "rust_analyzer",
    -- "sqlls",
    "tailwindcss",
    "terraformls",
    "tsserver",
    "yamlls",
  },

  automatic_installation = true
}
