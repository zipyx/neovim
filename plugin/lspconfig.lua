--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup_format,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
  })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.flow.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- ###########################################
-- Setting up typescript and javascript
-- language server
-- ###########################################
nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
    cmd = { "typescript-language-server", "--stdio" },
    capabilities = capabilities,
}

nvim_lsp.sourcekit.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- ###########################################
-- Setting up lua langage server
-- ###########################################
nvim_lsp.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      enable_format_on_save(client, bufnr)
    end,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },

            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
        },
    },
}

-- ###########################################
-- Setting up tailwindcss language server
-- ###########################################
nvim_lsp.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- ###########################################
-- Setting up css language server
-- ###########################################
nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.astro.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- ###########################################
-- Setting up javascript and typescript linter
-- ###########################################
nvim_lsp.quick_lint_js.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- ###########################################
-- Setting up golang language server
-- ###########################################
nvim_lsp.gopls.setup {
    on_attach = on_attach,
    filetypes = { "go" },
    capabilities = capabilities,
}

-- ###########################################
-- Setting up SQL language server, works but
-- callback causing issue to always print
-- ###########################################
-- nvim_lsp.sqlls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }
-- ###########################################

-- ###########################################
-- Setting up python language server
-- ###########################################
nvim_lsp.pyright.setup {
    on_attach = on_attach,
    filetypes = { "py" },
    capabilities = capabilities,
}

-- ###########################################
-- Setting up C/C++ language server
-- ###########################################
nvim_lsp.clangd.setup {
    on_attach = on_attach,
    filetypes = { "cpp", "c" },
    capabilities = capabilities,
}

-- ###########################################
-- Setting up C# language server
-- ###########################################
local omnisharp_bin = "/usr/bin/omnisharp"
nvim_lsp.omnisharp.setup {
    on_attach = on_attach,
    filetypes = { "cs", "vb" },
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    capabilities = capabilities,
}

-- ###########################################
-- Setting up Rust language server
-- ###########################################
nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    filetypes = { "rust", "rs" },
    capabilities = capabilities,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
    })

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
})
