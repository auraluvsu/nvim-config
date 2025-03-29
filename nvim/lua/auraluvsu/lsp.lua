-- Load required modules
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- Automatically set up installed servers
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
  end,
})

-- Configure specific LSP servers
lspconfig.lua_ls.setup({
    require'lspconfig'.lua_ls.setup{
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } }, -- Prevent warnings about 'vim' being undefined
        }
      }
  }
})
lspconfig.gopls.setup({
    require'lspconfig'.gopls.setup{
      settings = {
        gopls = {
          gofumpt = true,   -- Use "gofumpt" instead of "gofmt" (optional)
          staticcheck = true,
          analyses = {
            unusedparams = true,
          },
          usePlaceholders = true,
        },
      },
    }

})

