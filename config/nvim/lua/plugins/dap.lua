return {
  'mfussenegger/nvim-dap',
  config = function()
    -- require('dap-ruby').setup()
    require("dapui").setup()
    require('nvim-dap-virtual-text').setup()
    require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
  end
}
