return {
 'rmagatti/session-lens',
  dependencies = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
  enabled = false,
  config = function()
    require('session-lens').setup({})
  end
}
