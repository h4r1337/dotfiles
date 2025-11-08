-- general
lvim.colorscheme = "gruvbox"
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.colorcolumn = "100"
vim.opt.display = "truncate"

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.insert_mode["<C-j>"] = "<C-o>gj"
lvim.keys.insert_mode["<C-h>"] = "<Left>"
lvim.keys.insert_mode["<C-k>"] = "<C-o>gk"
lvim.keys.insert_mode["<C-l>"] = "<Right>"
-- delete single character without copying into register
lvim.keys.normal_mode["x"] = '"_x'
-- spit windows verticall and horizontally
lvim.keys.normal_mode["<leader>|"] = ":vsplit<CR>"
lvim.keys.normal_mode["<leader>sv"] = ":vsplit<CR>"
lvim.keys.normal_mode["<leader>-"] = ":split<CR>"
-- aligh cursor on screen center during scroll
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

-- nvim spectre (find and replace)
lvim.keys.normal_mode["<leader>S"] = "<cmd>lua require('spectre').open()<CR>"

-- search current word
lvim.keys.normal_mode["<leader>Sw"] = "<cmd>lua require('spectre').open_visual({select_word=true})<CR>"
lvim.keys.normal_mode["<leader>SS"] = "<esc>:lua require('spectre').open_visual()<CR>"
--  search in current file
lvim.keys.normal_mode["<leader>Sf"] = "viw:lua require('spectre').open_file_search()<cr>"
-- run command :Spectre

-- Trouble keybindings
lvim.keys.normal_mode["<leader>xx"] = "<cmd>TroubleToggle<cr>"
lvim.keys.normal_mode["<leader>xw"] = "<cmd>TroubleToggle workspace_diagnostics<cr>"
lvim.keys.normal_mode["<leader>xd"] = "<cmd>TroubleToggle document_diagnostics<cr>"
lvim.keys.normal_mode["<leader>xq"] = "<cmd>TroubleToggle quickfix<cr>"
lvim.keys.normal_mode["<leader>xl"] = "<cmd>TroubleToggle loclist<cr>"
lvim.keys.normal_mode["<leader>xt"] = "<cmd>TroubleToggle todo<cr>"
lvim.keys.normal_mode["gR"] = "<cmd>TroubleToggle lsp_references<cr>"

-- True-zen
lvim.keys.normal_mode["<leader>zn"] = ":TZNarrow<CR>"
lvim.keys.visual_mode["<leader>zn"] = ":'<,'>TZNarrow<CR>"
lvim.keys.normal_mode["<leader>zf"] = ":TZFocus<CR>"
lvim.keys.normal_mode["<leader>zm"] = ":TZMinimalist<CR>"
lvim.keys.normal_mode["<leader>za"] = ":TZAtaraxis<CR>"

-- Terminal
-- toggle horizontal terminal
lvim.builtin.terminal.execs[1][2] = "tth"
-- toggle vertical terminal
lvim.builtin.terminal.execs[2][2] = "ttv"
-- toggle floating terminal
lvim.builtin.terminal.execs[3][2] = "ttf"

-- Python REPL
lvim.keys.normal_mode["ttp"] = ":botright 15split term://python | startinsert<CR>"

lvim.transparent_window = true
lvim.format_on_save = true


-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

lvim.builtin.telescope.on_config_done = function(telescope)
  telescope.load_extension "flutter"
end

-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["F"] = {
  name = "+Flutter",
  c = { "<cmd>Telescope flutter commands<cr>", "Open Flutter Commans" },
  dAntoniozinchenko = { "<cmd>FlutterDevices<cr>", "Flutter Devices" },
  e = { "<cmd>FlutterEmulators<cr>", "Flutter Emulators" },
  r = { "<cmd>FlutterReload<cr>", "Hot Reload App" },
  R = { "<cmd>FlutterRestart<cr>", "Hot Restart app" },
  q = { "<cmd>FlutterQuit<cr>", "Quit running application" },
  v = { "<cmd>Telescope flutter fvm<cr>", "Flutter version" },
}

-- lvim.builtin.which_key.mappings["T"] = {
--   name = "+Tests",
--   t = { "<cmd>lua require('neotest').run.run()<CR>", "Run nearest test" },
--   T = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", "Debug nearest test" },
--   f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', "Run test for entire file" },
--   o = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Output summary panel" },
-- }

-- vim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }


-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "typescript",
  "tsx",
  "css",
  "yaml",
  "dart",
  "ruby",
  "markdown",
  "markdown_inline",
  "haskell",
  "python"
}

lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "jsonls",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
---`:LvimInfo` lists which server(s) are skipped for the current filetype
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "emmet_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", 'javascript', 'javascriptreact' },
  },
  -- {
  --   command = "eslint_d",
  --   filetypes = {
  --     "javascript", "javascriptreact",
  --     "typescript", "typescriptreact"
  --   }
  -- }
}

-- Flutter snippets enable
local luasnip = require("luasnip")
luasnip.filetype_extend("dart", { "flutter" })

-- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   {
--     command = "eslint_d",
--     filetypes = {
--       "javascript", "javascriptreact",
--       "typescript", "typescriptreact"
--     }
--   }
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  {
    "tanvirtin/monokai.nvim",
    lazy = false,
  },
  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {
        ui = {
          bottom = {
            laststatus = 0,
            ruler = false,
            showmode = false,
            showcmd = false,
            cmdheight = 1,
          },
          top = {
            showtabline = 0,
          },
          left = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
          },
        },
        modes = {
          ataraxis = {
            left_padding = 5,
            right_padding = 5,
            top_padding = 1,
            bottom_padding = 1,
            ideal_writing_area_width = 0,
            just_do_it_for_me = false,
            keep_default_fold_fillchars = true,
            custome_bg = "",
            bg_configuration = true,
            affected_higroups = {
              NonText = {},
              FoldColumn = {},
              ColorColumn = {},
              VertSplit = {},
              StatusLine = {},
              StatusLineNC = {},
              SignColumn = {},
            }
          },
          focus = {
            margin_of_error = 5,
            focus_method = "expermimental"
          },
        },
        integration = {
          tmux = false,
          twilight = false,
          lualine = false
        }
      }
    end,
  },
  {
    "ellisonleao/gruvbox.nvim"
  },
  { "mg979/vim-visual-multi" },
  -- Flutter plugin
  { "stevearc/dressing.nvim" },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require('flutter-tools').setup {
        -- flutter_path = "~/development/flutter",
        fvm = true, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
        ui = {
          -- the border type to use for all floating windows, the same options/formats
          -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
          border = "rounded",
          -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
          -- please note that this option is eventually going to be deprecated and users will need to
          -- depend on plugins like `nvim-notify` instead.
          notification_style = "plugin",
        },
        decorations = {
          statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = true,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
          },
        },
        outline = {
          open_cmd = "30vnew", -- command to use to open the outline buffer
          auto_open = false,   -- if true this will open the outline automatically when it is first populated
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          register_configurations = function(_)
            local dap = require("dap")
            -- dap.adapters.dart = {
            -- 	type = "executable",
            -- 	command = "node",
            -- 	args = { debugger_path, "flutter" },
            -- }
            dap.set_log_level("TRACE")
            dap.configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
          end,
        },
        dev_log = {
          enabled = false,
          -- open_cmd = "tabedit", -- command to use to open the log buffer
        },
        lsp = {
          color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = false, -- highlight the background
            foreground = false, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt", -- "always"
            enableSnippets = true,
            enableSdkFormatter = true,
          },
        },

      }
    end
  },
  -- Syntax highlight for mdx files: used by Storybook
  { "jxnblk/vim-mdx-js" },
  -- { "github/copilot.vim" },
  -- tmux navigation support
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup {
        navigation = {
          -- cycles to opposite pane while navigating into the border
          -- cycle_navigation = true,

          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,

          -- prevents unzoom tmux when navigating beyond vim border
          persist_zoom = true,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = true,
        },
      }
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    config = function()
      local saga = require("lspsaga")

      saga.setup({
        -- keybinds for navigation in lspsaga window
        move_in_saga = { prev = "<C-k>", next = "<C-j>" },
        -- use enter to open file with finder
        finder = {
          open = "<CR>",
        },
        -- use enter to open file with definition preview
        definition = {
          edit = "<CR>",
        },
      })

      local keymap = vim.keymap.set

      -- Lsp finder find the symbol definition implement reference
      -- if there is no implement it will hide
      -- when you use action in finder like open vsplit then you can
      -- use <C-t> to jump back
      keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

      -- Rename
      keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

      -- Peek Definition
      -- you can edit the definition file in this flaotwindow
      -- also support open/vsplit/etc operation check definition_action_keys
      -- support tagstack C-t jump back
      keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

      -- Hover Doc
      keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

      -- Float terminal
      keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
      keymap("n", "∂", "<cmd>Lspsaga open_floaterm<CR>", { silent = true }) -- macos ALT+d(Option+d) binding
      -- close floaterm
      keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
      keymap("t", "∂", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true }) -- macos ALT+d(Option+d) binding
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "sidlatau/neotest-dart",
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "css", "scss", "html", "javascript", "dart", "*" }, {
          RGB = true,      -- #RGB hex codes
          RRGGBB = true,   -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true,   -- CSS rgb() and rgba() functions
          hsl_fn = true,   -- CSS hsl() and hsla() functions
          css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
        })
      end,
    },
    {
      "ellisonleao/glow.nvim",
      config = true,
      cmd = "Glow",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require("neotest-dart") {
            command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
            -- Change it to `fvm flutter` if using FVM
            -- change it to `dart` for Dart only tests
            use_lsp = true -- When set Flutter outline information is used when constructing test name.
          },
        }
      }
    end
  },
}

-- copilot additional configs
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""
-- lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
--   local copilot_keys = vim.fn["copilot#Accept"]()
--   if copilot_keys ~= "" then
--     vim.api.nvim_feedkeys(copilot_keys, "i", true)
--   else
--     fallback()
--   end
-- end


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc", "*.arb" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})
-- Flutter .arb files should be concidered as json files
vim.filetype.add {
  extension = {
    arb = 'json',
  }
}

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
