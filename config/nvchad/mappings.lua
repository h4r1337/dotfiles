local M = {}

M.nvimtree = {
  n = {
    ["<leader>e"] = {"<cmd> NvimTreeToggle <CR>", "   toggle nvimtree"},
    ["<leader>o"] = {"<cmd> NvimTreeFocus <CR>", "   focus nvimtree"},
  }
}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft() <CR>", "Go to the left window"},
    ["<C-l>"] = { "<cmd> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight() <CR>", "Go to the right window"},
    ["<C-j>"] = { "<cmd> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown() <CR>", "Go to the down window"},
    ["<C-k>"] = { "<cmd> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp() <CR>", "Go to the up window"},
    ["<C-Space>"] = { "<cmd> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext() <CR>", "Go to the next window"},
    ["<C-\\>"] = { "<cmd> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive() <CR>", "Go to the last active window"},
  }
}

return M
