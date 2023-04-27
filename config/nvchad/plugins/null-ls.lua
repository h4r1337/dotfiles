local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettierd,
  b.formatting.prettier,

  -- markdown
  b.formatting.markdownlint,

  -- python
  b.formatting.black,
  b.formatting.autopep8,
  b.formatting.autoflake,

  -- templates
  b.formatting.djlint,
  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- C/C++
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
