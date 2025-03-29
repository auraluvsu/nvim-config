require("nvim-treesitter.configs").setup({
    ensure_installed = {}, -- Add the languages you need
    sync_install = false,
    auto_install = false,
    ignore_install = {}, -- You can leave this empty if you don't want to ignore any languages
    modules = {},
    highlight = {
        enable = true, -- Enables Treesitter-based highlighting
        additional_vim_regex_highlighting = false,
    },
})

-- Custom Highlights for Variables & Functions
vim.api.nvim_set_hl(0, "@variable", { fg = "#00ffcc" })  -- Variables (cyan)
vim.api.nvim_set_hl(0, "@function", { fg = "#8b0000", bold = true })  -- Functions (orange)
vim.api.nvim_set_hl(0, "@parameter", { fg = "#ffaa00" })  -- Function parameters
vim.api.nvim_set_hl(0, "@comment", { fg = "#888888", italic = true })  -- Comments (gray)
vim.api.nvim_set_hl(0, "@type", { fg = "#ff55ff", bold = true })  -- Types (purple)

