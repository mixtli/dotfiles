return {
  "rmagatti/auto-session", 
  dependencies = {{ 'nvim-tree/nvim-tree.lua'}},
  config = function() 
    require('auto-session').setup({
      pre_save_cmds = {"tabdo NvimTreeClose"},
      post_restore_cmds = {"tabdo NvimTreeOpen"}
    })
  end
}
