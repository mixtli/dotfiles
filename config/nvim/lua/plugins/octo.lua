return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  enabled = false,
  config = function ()
    require"octo".setup({
      use_local_fs = false,                    -- use local files on right side of reviews
      suppress_missing_scope = {
        projects_v2 = true,
      },
      enable_builtin = false,
    })
  end
}
