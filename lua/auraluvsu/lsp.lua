local lspconfig = require("lspconfig")
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.ts_ls.setup({
    capabilities = cmp_capabilities,
})

lspconfig.gopls.setup({
    require'lspconfig'.gopls.setup {
        settings = {
            gopls = {
                gofumpt = true,
                staticcheck = true,
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                usePlaceholders = true,
            },
        },
    },
})
-- Lua
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({
    capabilities = cmp_capabilities,
    settings = {
        ["rust_analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = { allTargets = true },
            suggest = {
                imports = {
                    organize = true,
                },
            },
        },
    },
})
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    severity_sort = true,
})
