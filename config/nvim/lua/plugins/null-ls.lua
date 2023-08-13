return {
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black
      }
    })

  end
}
