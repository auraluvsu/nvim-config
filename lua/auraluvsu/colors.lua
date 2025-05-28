require("rose-pine").setup({
    variant = "moon", -- options: "main" | "moon" | "dawn"
    dark_variant = "main",
    disable_background = true,
    disable_float_background = true,
    bold_vert_split = false,
    dim_nc_background = true,
    disable_italics = false,
})
vim.cmd("colorscheme rose-pine")
