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

M.vimspector = {
  n = {
    ["<F9>"] = { "<cmd>:call vimspector#Launch()<cr>", "Vimspector launch " },
    ["<F8>"] = { "<cmd>:call vimspector#Reset()<cr>", "Vimspector reset" },
    ["<F5>"] = { "<cmd>:call vimspector#StepOver()<cr>", "Vimspector stepover" },
    ["<F4>"] = { "<cmd>:call vimspector#StepOut()<cr>", "Vimspector stepout" },
    ["<F6>"] = { "<cmd>:call vimspector#StepInto()<cr>", "Vimspector stepinto" },
    ["<leader>Db"] = { "<Plug>VimspectorToggleBreakpoint", "Vimspector toggle breakpoint" },
    ["<leader>Dw"] = { "<cmd>:call vimspector#AddWatch()<cr>", "Vimspector add watch" },
    ["<leader>De"] = { "<cmd>:call vimspector#Evaluate()<cr>", "Vimspector evaluate" },
  }
}

return M
