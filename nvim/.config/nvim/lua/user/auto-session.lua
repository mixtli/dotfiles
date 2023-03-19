local function restore_nvim_tree()
    local nvim_tree = require('nvim-tree')
    nvim_tree.change_dir(vim.fn.getcwd())
end

require('auto-session').setup {
  pre_save_cmds = {"tabdo NvimTreeClose"},
  post_restore_cmds = {"tabdo NvimTreeOpen"}
  
}
