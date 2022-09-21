local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettierd,

  -- markdown
  b.formatting.markdownlint,

  -- python
  b.formatting.black,
  b.formatting.autopep8,

  -- templates
  b.formatting.djlint,
  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
