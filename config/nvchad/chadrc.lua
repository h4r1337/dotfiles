-- Just an example, supposed to be placed in /lua/custom/

local M = {}

M.mappings = require "custom.mappings"

M.plugins = {
  user = require "custom.plugins",
}

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "onedark", "gruvbox" },
}

return M
