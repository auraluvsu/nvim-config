require("auraluvsu.lazy")
require("auraluvsu.set")
require("auraluvsu.cmp")
require("auraluvsu.lsp")
require("auraluvsu.telescope")
require("auraluvsu.remap")
require("auraluvsu.colors")
require("auraluvsu.treesitter")
require("auraluvsu.harpoon")
require("auraluvsu.undotree")
vim.g.python3_host_prog = "C:/Program Files/WindowsApps/PythonSoftwareFoundation.Python.3.11_3.11.2544.0_x64__qbz5n2kfra8p0/python.exe"
vim.keymap.set('n', '<leader>tn', function()
  require('auraluvsu.note').toggle_note()
end, { noremap = true, silent = true, desc = 'Toggle floating notes' })

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("cd C:/Users/ntrea/AppData/Local/nvim")
        vim.cmd("Explore")
    end
})

require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls", "ts_ls", "gopls", "rust_analyzer" },
    automatic_installation = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Save the original working directory on startup
local default_dir = "C:/Users/ntrea/AppData/Local/nvim"

-- Change to the directory of the opened file
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local bufname = vim.fn.expand('%:p')
    if bufname ~= "" and vim.fn.filereadable(bufname) == 1 then
      vim.cmd('lcd ' .. vim.fn.fnamemodify(bufname, ":h"))
    end
  end
})

-- Go back to the default dir when in no file or directory buffer
vim.api.nvim_create_autocmd({"BufLeave", "BufWinLeave"}, {
  callback = function()
    -- Run this after a short delay to let buffer switch finish
    vim.defer_fn(function()
      local current_buf = vim.api.nvim_get_current_buf()
      local bufname = vim.api.nvim_buf_get_name(current_buf)

      -- If we're now in a special buffer like Netrw or no file
      if bufname == "" or bufname:match("^term://") or bufname:match("^NvimTree_") or bufname:match("^%[") then
        vim.cmd('lcd ' .. default_dir)
      end
    end, 100)
  end
})
