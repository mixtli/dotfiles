local tmux = require("tmux-awesome-manager")
local tmux_term = require('tmux-awesome-manager.src.term')
local setup = {
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,       -- default bindings on <c-w>
      nav = true,           -- misc bindings to work with windows
      z = true,             -- bindings for folds, spelling and others prefixed with z
      g = true,             -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+",      -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>",   -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded",       -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },                                             -- min and max height of the columns
    width = { min = 20, max = 50 },                                             -- min and max width of the columns
    spacing = 3,                                                                -- spacing between columns
    align = "left",                                                             -- align columns left, center or right
  },
  ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                             -- show help message on the command line when the popup is visible
  triggers = "auto",                                                            -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}
local g_opts = {
  mode = "n", -- NORMAL mode
  prefix = "g",
}
local g_mappings = {
  d = { "Goto definition" },
  D = { "Peek definition" },
  h = { "Find Symbol" },
  r = { "Rename" },
  R = { "Rename in project" },
  t = { "Goto type definition" },
  T = { "Peek type definition" },
}

local mappings = {
  a = {
    name = "AI (ChatGPT)",
    q = { "<cmd>ChatGPT<cr>", "ChatGPT" },
    a = { "<cmd>ChatGPTActAs<cr>", "Act As"},
    e = { "<cmd>ChatGPTEditWithInstructions", "Edit with Instructions"},
    f = { "<cmd>ChatGPTRun fix_bugs<cr>", "Fix Bugs"},
    t = { "<cmd>ChatGPTRun add_tests<cr>", "Add Tests"},
    x = { "<cmd>ChatGPTRun explain_code<cr>", "Explain Code"}
  },
  b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Switch Buffer" },

  B = {
    name = "Buffers",
    d = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  },
  c = {
    name = "Copilot",
    a = { "<cmd>lua require('copilot.panel').accept()<cr>", "Accept" },
    c = { "<cmd>:Copilot panel<cr>", "Toggle Panel" },
    n = { "<cmd>lua require('copilot.panel').jump_next()<cr>", "Panel Next" },
    p = { "<cmd>lua require('copilot.panel').jump_prev()<cr>", "Panel Prev" },
    o = { "<cmd>lua require('copilot.panel').open()<cr>", "Open" },
    r = { "<cmd>lua require('copilot.panel').refresh()<cr>", "Refresh" },
    v = { "<cmd>lua require('copilot.suggestion').is_visible()<cr>", "Visible" },
    A = { "<cmd>lua require('copilot.suggestion').accept()<cr>", "Accept" },
    W = { "<cmd>lua require('copilot.suggestion').accept_word()<cr>", "Accept word" },
    L = { "<cmd>lua require('copilot.suggestion').accept_line()<cr>", "Accept line" },
    N = { "<cmd>lua require('copilot.suggestion').next()<cr>", "Suggest Next" },
    P = { "<cmd>lua require('copilot.suggestion').prev()<cr>", "Suggest Prev" },
    D = { "<cmd>lua require('copilot.suggestion').dismiss()<cr>", "Dismiss" },
    T = { "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>", "Toggle auto trigger" },
  },
  d = {
    name = "Debug",
    t = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
    c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
    d = { "<cmd>lua require('dap').clear_breakpoints()<cr>", "Clear breakpoints" },
    s = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
    i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    B = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint Condition: ')<cr>", "Breakpoint Condition" },
    l = { "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log Point Message: ')<cr>", "Log breakpoint" },
    r = { "<cmd>lua require('dap').repl.open()<cr>", "Repl Open" },
    R = { "<cmd>lua require('dap').run_last()<cr>", "Run Last" },
    C = { "<cmd>lua require('dap').close()<cr>", "Close" },
    T = { "<cmd>lua require('dap').terminate()<cr>", "Terminate" },
    D = { "<cmd>lua require('dap').disconnect()<cr>", "Disconnect" },
  },
  D = {
    name = "Devspace",
    b = { "<cmd>lua _TOGGLE_DEVSPACE_BUILD()<CR>", "devspace build" },
    d = { "<cmd>lua _TOGGLE_DEVSPACE_DEV()<CR>", "devspace dev" },
    D = { "<cmd>lua _TOGGLE_DEVSPACE_DEPLOY()<CR>", "devspace deploy" },
    e = { "<cmd>lua _TOGGLE_DEVSPACE_ENTER()<CR>", "devspace enter" },
    l = { "<cmd>lua _TOGGLE_DEVSPACE_DEPLOY_LOCAL()<CR>", "devspace deploy --local" },
    t = { "<cmd>lua _TOGGLE_DEVSPACE_TESTS()<CR>", "devspace run tests" },
  },
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<cr>", "Find files", },
  F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  g = {
    name = "Git",
    a = { "<cmd>Git add %<cr>", "Git add" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    B = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    --    C = { "<cmd>:LazyGitFilterCurrentFile<CR>", "LazygitFilterCurrentFile"},
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = { "<cmd>Git commit<cr>", "Commit" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
    D = { "<cmd>Git difftool<cr>", "Git Difftool", },
    e = { "<cmd>Gdiffsplit<cr>", "Git Diffsplit", },
    f = { "<cmd>LazyGitFilter<CR>", "LazygitFilter" },
    g = { "<cmd>Ggrep<cr>", "Git grep", },
    h = {
      name = "+Github",
      c = {
        name = "+Commits",
        c = { "<cmd>GHCloseCommit<cr>", "Close" },
        e = { "<cmd>GHExpandCommit<cr>", "Expand" },
        o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
        p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
        z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
      },
      i = {
        name = "+Issues",
        p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
      },
      l = {
        name = "+Litee",
        t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
      },
      r = {
        name = "+Review",
        b = { "<cmd>GHStartReview<cr>", "Begin" },
        c = { "<cmd>GHCloseReview<cr>", "Close" },
        d = { "<cmd>GHDeleteReview<cr>", "Delete" },
        e = { "<cmd>GHExpandReview<cr>", "Expand" },
        s = { "<cmd>GHSubmitReview<cr>", "Submit" },
        z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
      },
      p = {
        name = "+Pull Request",
        c = { "<cmd>GHClosePR<cr><cmd>NvimTreeOpen<cr>", "Close" },
        d = { "<cmd>GHPRDetails<cr>", "Details" },
        e = { "<cmd>GHExpandPR<cr>", "Expand" },
        o = { "<cmd>NvimTreeClose<cr><cmd>GHOpenPR<cr>", "Open" },
        p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
        r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
        t = { "<cmd>GHOpenToPR<cr>", "Open To" },
        z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
      },
      t = {
        name = "+Threads",
        c = { "<cmd>GHCreateThread<cr>", "Create" },
        n = { "<cmd>GHNextThread<cr>", "Next" },
        t = { "<cmd>GHToggleThread<cr>", "Toggle" },
      }
    },
    J = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    K = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>Git log<cr>", "Git log" },
    L = { "<cmd>LazyGit<CR>", "Lazygit" },
    m = { "<cmd>Git mergetool<cr>", "Git mergetool" },
    M = { "<cmd>Gvdiffsplit!<cr>", "3 Way Merge" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    p = { "<cmd>Git pull<cr>", "Git pull" },
    P = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    s = { "<cmd>Git<cr>", "Git Status" },
    U = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
    v = { "<cmd>DiffviewOpen<cr>", "DiffviewOpen" },
    V = { "<cmd>DiffviewClose<cr>", "DiffviewClose" },
    w = { "<cmd>GBrowse<cr>", "Browse in Web" },
    X = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    [">"] = { "<cmd>diffget REMOTE<cr>", "Use Remote"},
    ["<"] = { "<cmd>diffget LOCAL<cr>", "Use Local" }
  },
  K = { "<cmd>DevdocsOpenFloat<cr>", "DevDocs"},
  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    b = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "Buffer Diagnostics", },
    C = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor Diagnostics", },
    d = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics", },
    D = { "<cmd>Lspsaga hover_doc<CR>", "Documentation" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
    I = { "<cmd>LspInfo<cr>", "Info" },
    i = { "<cmd>Lspsaga incoming_calls<cr>", "Incoming Calls" },
    o = { "<cmd>Lspsaga outgoing_calls<cr>", "Outgoing Calls" },
    j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic", },
    k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    n = { "<cmd>Navbuddy<cr>", "Navbuddy" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    R = {
      name = "Refactor",
      v = { "<cmd>lua require('jdtls').extract_variable()<cr>", "Extract Variable" },
      c = { "<cmd>lua require('jdtls').extract_constant()<cr>", "Extract Constant" },
      m = { "<cmd>lua require('jdtls').extract_method()<cr>", "Extract Method (visual mode)" },
    },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    z = { "<cmd>Lspsaga outline<CR>", "Outline" }
  },
  m = {
    name = "Tmux",
    o =  { tmux.switch_orientation, "Switch Orientation" }, -- Open new panes as vertical / horizontal?
    a =  { tmux.switch_open_as, "Switch Open As" }, -- Open new terminals as panes or windows?
    k =  { tmux.kill_all_terms, "Kill All Terms" }, -- Kill all open terms.
    p =  { tmux.run_project_terms, "Run Project Terms" },-- Run the per project commands
    m =  { "<cmd>Telescope tmux-awesome-manager list_terms<cr>" , "List all terminals" }, -- List all terminals
    l =  { "<cmd>Telescope tmux-awesome-manager list_open_terms<cr>", "List Open Terminals" }, -- List open terminals
    d = tmux_term.run_wk({ cmd = 'devspace dev', name = 'Devspace Dev', open_as = 'pane', size='30%' }),
    t = tmux_term.run_wk({ cmd = 'make local_test', name = 'make local_test', open_as = 'pane', size='30%' }),
  },
  N = {
    name = "Neovim",
    r = { "<cmd>:source $MYVIMRC<cr>", "Reload config" },
  },
  p = {
    name = "Programs",
    r = { "<cmd>:RnvimrToggle<cr>", "Ranger" },
  },
  r = {
    name = "Repl",
    r = { "<cmd>IronRepl<cr>", "Repl" },
    h = { "<cmd>IronHide<cr>", "Hide" },
    R = { "<cmd>IronRestart<cr>", "Restart" },
    F = { "<cmd>IronFocus<cr>", "Focus" },
    f = { "Send File" },
    l = { "Send Line" },
    m = { "Send Mark" }
  },
  R = { "<cmd>Run<cr>", "Run" },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    s = { "<cmd>Telescope grep_string<cr>", "Grep String Under cursor" },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
  t = {
    name = "Test",
    n = { "<cmd>TestNearest<cr>", "Test Nearest" },
    f = { "<cmd>TestFile<cr>", "Test File" },
    s = { "<cmd>TestSuite<cr>", "Test Suite" },
    l = { "<cmd>TestLast<cr>", "Test Last" },
    v = { "<cmd>TestVisit<cr>", "Test Visit" },
    N = { "<cmd>lua require('neotest').run.run()<cr>", "NeoTest Nearest"},
    F = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "NeoTest File"},
    D = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "NeoTest Debug"},
    S = { "<cmd>lua require('neotest').run.stop()<cr>", "NeoTest Stop"},
    A = { "<cmd>lua require('neotest').run.attach()<cr>", "NeoTest Attach"},
    T = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", "NeoTest Toggle" },
    V = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary Toggle" }
  },

  T = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  u = {
    name = "Trouble",
    x = { function() require("trouble").open() end, "Open" },
    w = { function() require("trouble").open("workspace_diagnostics") end, "Workspace Diagnostics" },
    d = { function() require("trouble").open("document_diagnostics") end, "Document Diagnostics" },
    q = { function() require("trouble").open("quickfix") end, "Quickfix" },
    l = { function() require("trouble").open("loclist") end, "Loclist" },
    R = { function() require("trouble").open("lsp_references") end, "LSP References" },
    t = { "<cmd>TroubleToggle<cr>", "Toggle"}
  },
  w = { "<cmd>:Telescope session-lens search_session<cr>", "Switch Workspace" },
  z = { "<cmd>:Zen<cr>", "Zen Mode" },
  ["*"] = { "<cmd>:Telescope grep_string<cr>", "Grep cursor" },
}

local visual_mappings = {
  a = {
    name = "AI (ChatGPT)",
    q = { "<cmd>ChatGPT<cr>", "ChatGPT" },
    a = { "<cmd>ChatGPTActAs<cr>", "Act As"},
    e = { "<cmd>ChatGPTEditWithInstructions", "Edit with Instructions"},
    f = { "<cmd>ChatGPTRun fix_bugs<cr>", "Fix Bugs"},
    t = { "<cmd>ChatGPTRun add_tests<cr>", "Add Tests"},
    x = { "<cmd>ChatGPTRun explain_code<cr>", "Explain Code"}
  },
  m = {
    name = 'tmux',
    s = { tmux.send_text_to, "Send To Terminal" }
  }
}

return {
  "folke/which-key.nvim",
  dependencies = { { 'glepnir/lspsaga.nvim' } },
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require('which-key').setup(setup)
    require('which-key').register(mappings, opts)
    require('which-key').register(visual_mappings, vopts)
    require('which-key').register(g_mappings, g_opts)
  end
}
