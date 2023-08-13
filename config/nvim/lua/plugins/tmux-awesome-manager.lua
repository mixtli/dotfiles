return {
  "otavioschwanck/tmux-awesome-manager.nvim",
  config = function()
    require('tmux-awesome-manager').setup({
      per_project_commands = { -- Configure your per project servers with
        -- project name = { { cmd, name } }
      },
      session_name = 'Neovim Terminals',
      use_icon = false, -- use prefix icon
      icon = ' ', -- Prefix icon to use
      -- project_open_as = 'window', -- Open per_project_commands as.  Default: separated_session
      -- default_size = '30%', -- on panes, the default size
      -- open_new_as = 'window' -- open new command as.  options: pane, window, separated_session.
    })
  end
}

