local Terminal = require("toggleterm.terminal").Terminal

local devspace_dev = Terminal:new({ cmd = "devspace dev", hidden = true })
function _TOGGLE_DEVSPACE_DEV()
  devspace_dev:toggle()
end

local devspace_build = Terminal:new({ cmd = "devspace build", hidden = true })
function _TOGGLE_DEVSPACE_BUILD()
  devspace_build:toggle()
end

local devspace_deploy_local = Terminal:new({ cmd = "devspace deploy --local", hidden = true })
function _TOGGLE_DEVSPACE_DEPLOY_LOCAL()
  devspace_deploy_local:toggle()
end

local devspace_deploy = Terminal:new({ cmd = "devspace deploy", hidden = true })
function _TOGGLE_DEVSPACE_DEPLOY()
  devspace_deploy:toggle()
end

local devspace_enter = Terminal:new({ cmd = "devspace enter", hidden = true, direction = 'horizontal' })
function _TOGGLE_DEVSPACE_ENTER()
  devspace_enter:toggle()
end

local devspace_tests = Terminal:new({ cmd = "devspace run tests", hidden = true, direction = 'horizontal' })
function _TOGGLE_DEVSPACE_TESTS()
  devspace_tests:toggle()
end

function _DEVSPACE_SEND_TEST(cmd)
  devspace_tests:send(cmd, false)
end

local tt = require "toggleterm"
local ttt = require "toggleterm.terminal"

vim.g["test#custom_strategies"] = {
  tterm = function(cmd)
    _DEVSPACE_SEND_TEST(cmd)
  end
}

vim.g["test#strategy"] = "tterm"


