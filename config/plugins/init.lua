return {
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["folke/which-key.nvim"] = {
    disable = false,
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["alexghergh/nvim-tmux-navigation"] = {
    disable_when_zoomed = true, -- defaults to false
    keybindings = {
      left = "<C-h>",
      down = "<C-j>",
      up = "<C-k>",
      right = "<C-l>",
    },
  },
  ["williamboman/mason-lspconfig.nvim"] = {
    ensure_installed = {
      "sumneko_lua",
      "rust_analyzer",
    }
  },
  ["simrat39/rust-tools.nvim"] = {
    config = function()
      require "custom.plugins.rust-tools"
    end,
  },
  ["tpope/vim-surround"] = {
    disable = false,
  },
  ["hrsh7th/nvim-cmp"] = {
    override_options = function()
      return {
        sources = {
          { name = "nvim_lsp", keyword_length = 3 },
          { name = "buffer", keyword_length = 2 },
          { name = "nvim_lua", keyword_length = 2 },
          { name = "path" },
          { name = "nvim_lsp_signature_help" },
          { name = "luasnip", keyword_length = 2 },
        },
      }
    end,
  },
  ["hrsh7th/cmp-nvim-lsp-signature-help"] = {
    disable = false,
  },
  ["leafOfTree/vim-matchtag"] = {
    disable = false,
  },
  ["NvChad/ui"] = {
    override_options = {
      tabufline = {
        lazy = false,
        diaable = false,
      },
    },
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    disable = false,
    lazy = false,
    config = function()
      require "indent_blankline".setup {
        buftype_exclude = { 'terminal', 'nofile' },
        filetype_exclude = { 'Trouble', 'trouble', 'noice', 'help', 'startify', 'alpha', 'dashboard', 'lazy', 'packer', 'neogitstatus', 'NvimTree', 'mason.nvim'},
        char = '▏',
        show_current_context = true,
        show_current_context_start = true,  -- underline first line
        use_treesitter = true,
        show_trailing_blankline_indent = false,
      }
    end
  },
}
