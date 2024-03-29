return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    require"octo".setup({
      use_local_fs = false,                    -- use local files on right side of reviews
      enable_builtin = false,
    })
  end
}
