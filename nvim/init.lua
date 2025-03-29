require("auraluvsu.lazy")
require("auraluvsu.set")
require("auraluvsu.cmp")
require("auraluvsu.lsp")
require("auraluvsu.telescope")
require("auraluvsu.remap")
require("auraluvsu.colors")
require("auraluvsu.treesitter")
require("auraluvsu.harpoon")
local lspconfig = require("lspconfig")

-- Ensure Mason is properly set up
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "tsserver", "gopls", "lua_ls" }, -- Add the LSPs you need
    automatic_installation = true,
})

-- Attach each LSP properly
require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({})
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    command = "cd C:/Users/ntrea/AppData/Local/nvim | Explore"
})
require("mason").setup()
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
require'lspconfig'.lua_ls.setup{
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    }
  }
}
require("auraluvsu.sqlformat")
vim.api.nvim_create_user_command(
  'FormatSQL',
  'execute "!Mason tools sql-formatter --stdin" | edit',
  {}
)
vim.cmd([[
  augroup FormatOnSave
    autocmd!
    autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.html Prettier
  augroup END
]])

-- Optionally, use :Prettier command to format manually
vim.cmd([[
  command! Prettier execute 'silent !prettierd ' . shellescape(expand('%:p')) | redraw!
]])
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
vim.g.netrw_lifestyle = 3
