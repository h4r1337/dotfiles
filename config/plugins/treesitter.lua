local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

require("base46").load_highlight "treesitter"

local options = {
  ensure_installed = {
    "lua",
    "rust",
    "toml",
    "python",
    "c",
    "c++",
    "javascript",
    "haskell",
  },
  auto_install = true,

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
}

treesitter.setup(options)
