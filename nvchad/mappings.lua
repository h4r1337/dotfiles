local M = {}

M.nvimtree = {
  n = {
    ["<leader>e"] = {"<cmd> NvimTreeToggle <CR>", "   toggle nvimtree"},
    ["<leader>o"] = {"<cmd> NvimTreeFocus <CR>", "   focus nvimtree"},
  }
}

return M
