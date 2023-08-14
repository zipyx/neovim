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
    "docker_compose_language_service",
    "dockerls",
    "eslint",
    "gopls",
    "graphql",
    "hls",
    "html",
    -- "js-debug-adapter",
    "jsonls",
    "lemminx",
    "lua_ls",
    "marksman",
    "nil_ls",
    -- "node-debug2-adapter",
    "omnisharp",
    "powershell_es",
    "prismals",
    "pyright",
    "r_language_server",
    "rust_analyzer",
    "spectral",
    "sqlls",
    "svelte",
    "tailwindcss",
    "taplo",
    "terraformls",
    "texlab",
    "tsserver",
    "vimls",
    "volar",
    "yamlls",
    "zls",
  },

  automatic_installation = true
}
