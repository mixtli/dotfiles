return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
    telescope = {}, -- passed to the telescope picker
    telescope_alt = { -- when searching globally without preview
      layout_config = {
        width = 75,
      },
    },
    float_win = { -- passed to nvim_open_win(), see :h api-floatwin
      relative = "editor",
      height = 25,
      width = 100,
      border = "rounded",
    },
    previewer_cmd = "glow", -- like glow
    cmd_args =  { "-s", "dark", "-w", "80" } , -- example using glow { "-s", "dark", "-w", "80" }
    wrap = false, -- text wrap, only applies to floating window
    ensure_installed = {}, -- get automatically installed
  }
}
