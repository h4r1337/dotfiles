local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "emmet_ls",
  "html",
  "cssls",
  "clangd",
  "tsserver",
  "pyright",
  "jedi_language_server",
  "phpactor",
  "intelephense",
  "rust_analyzer",
  "rome",
  "remark_ls",
  "eslint",
  "codeqlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.intelephense.setup({
--   settings = {
--     intelephense = {
--       files = {
--         maxSize = 5000000;
--       };
--     };
--   }
-- });
