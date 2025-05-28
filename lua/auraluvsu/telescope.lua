require('telescope').setup({
    defaults = {
        -- This enables the border around Telescope windows
        border = true,
        borderchars = { '─', '│', '─', '│', '┌', '┐', '└', '┘' },  -- Customize border style if needed
        prompt_prefix = " ",
        selection_caret = " ",
        layout_config = {
            width = 0.9,
            height = 0.8,
        },
    },
})

-- Ensure floating windows and Telescope have borders and transparent background
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ff00ff", bg = "NONE" }) -- Set color for border
vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#ff00ff", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#ff00ff", bg = "NONE" })  -- Apply border styling to Telescope
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#ffd700", bg = "NONE" })  -- Border color for prompt
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#000080", bg = "NONE" })  -- Border color for results
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#ffd700", bg = "NONE" })  -- Border color for preview
