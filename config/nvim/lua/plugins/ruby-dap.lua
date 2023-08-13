return {
  'suketa/nvim-dap-ruby',
  config = function()
    local dap = require('dap')
    dap.set_log_level('TRACE');

    -- dap.adapters.ruby = {
    --   type = 'server';
    --   host = '127.0.0.1';
    --   port = 30000;
    --   options = { source_filetype = 'ruby' };
    -- };

    dap.adapters.ruby = {
      type = 'server',
      host = '127.0.0.1',
      port = 30000,
      -- options = { source_filetype = 'ruby' };
    };

    dap.configurations.ruby = {
      {
        type = "ruby",
        request = "attach",
        name = "Remote Ruby Debugger",
        port = 30000,
        mode = "remote",
        cwd = vim.fn.getcwd(),
        pathMappings = {
          ['/usr/src/app/'] = "${workspaceFolder}",
        },
      },
      {
        type =  "ruby",
        request = "launch",
        name = "Active File",
        program = "./test.rb",
        programArgs = {},
        useBundler = false,
        pathMappings = {
          {
            localRoot = "${workspaceFolder}",
            remoteRoot = "."
          }
        },
      }
    };
  end
}
