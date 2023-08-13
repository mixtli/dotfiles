return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim"
  },
  config = function ()
    local navbuddy = require("nvim-navbuddy")
    navbuddy.setup({
      window = {
        border = "double"
      },
      lsp = {auto_attach = true}
    })
  end
}
