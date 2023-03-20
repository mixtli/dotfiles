return {
  "rmagatti/auto-session", 
  config = {
    pre_save_cmds = {"tabdo NvimTreeClose"},
    post_restore_cmds = {"tabdo NvimTreeOpen"}
  }
}
