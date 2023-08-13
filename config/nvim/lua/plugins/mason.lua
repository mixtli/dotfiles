return {
  "williamboman/mason.nvim",
  config = function()
    require('mason').setup({
      ensure_installed = {
        "autoflake",
        "black",
        "mypy",
        "ruff",
        "pyright",
        "debugpy"
      }
    })
  end
}
