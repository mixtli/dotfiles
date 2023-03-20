local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
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
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
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
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  a = { "<cmd>Alpha<cr>", "Alpha" },
  b = {
    name = "Buffers",
    l = {"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Switch Buffer"},
    d = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  },
  B = { "<cmd>:Telescope file_browser<cr>", "Browse Files", },
  d = {
    name = "Debug",
    t = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI"},
    c = { "<cmd>lua require('dap').continue()<cr>", "Continue"},
    d = { "<cmd>lua require('dap').clear_breakpoints()<cr>", "Clear breakpoints"},
    s = { "<cmd>lua require('dap').step_over()<cr>", "Step Over"},
    i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into"},
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint"},
    B = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint Condition: ')<cr>", "Breakpoint Condition"},
    l = { "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log Point Message: ')<cr>", "Log breakpoint"},
    r = { "<cmd>lua require('dap').repl.open()<cr>", "Repl Open"},
    R = { "<cmd>lua require('dap').run_last()<cr>", "Run Last"},
    C = { "<cmd>lua require('dap').close()<cr>", "Close"},
    T = { "<cmd>lua require('dap').terminate()<cr>", "Terminate"},
    D = { "<cmd>lua require('dap').disconnect()<cr>", "Disconnect"},
  },
  D = {
    name = "Devspace",
    d = { ":VtrSendCommandToRunner! devspace dev<cr>", "dev"},
    t = { ":VtrSendCommandToRunner! devspace dev -p test<cr>", "test"}
  },
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<cr>", "Find files", },
  F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  g = {
    name = "Git",
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
            },
        },
    g = { "<cmd>:LazyGit<CR>", "Lazygit" },
    f = { "<cmd>:LazyGitFilter<CR>", "LazygitFilter"},
    C = { "<cmd>:LazyGitFilterCurrentFile<CR>", "LazygitFilterCurrentFile"},
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
  },

  h = { "<cmd>nohlsearch<CR>", "No Highlight" },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  P = { "<cmd>Telescope projects<cr>", "Projects" },
  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    b = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "Buffer Diagnostics", },
    c = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor Diagnostics", },
    d = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics", },
    D = { "<cmd>Lspsaga hover_doc<CR>", "Documentation"},
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    I = { "<cmd>LspInfo<cr>", "Info" },
    i = { "<cmd>Lspsaga incoming_calls<cr>", "Incoming Calls" },
    o = { "<cmd>Lspsaga outgoing_calls<cr>", "Incoming Calls" },
    j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic", },
    k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", t = {"<cmd>Lspsaga term_toggle<CR>", "Terminal Toggle"},
    z = {"<cmd>Lspsaga outline<CR>", "Outline"}
    },
  },
  N = { 
    name = "Neovim",
    b = { "<cmd>:source $MYVIMRC<cr>", "Reload config" },
  },
  r = { "<cmd>:RnvimrToggle<cr>", "Ranger"},
  R = { "<cmd>Run<cr>", "Run"},
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    s = { "<cmd>Telescope grep_string<cr>", "Grep String Under cursor" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
  t = {
    name = "Test",
    n = { "<cmd>TestNearest<cr>", "Test Nearest"},
    f = { "<cmd>TestFile<cr>", "Test File"},
    s = { "<cmd>TestSuite<cr>", "Test Suite"},
    l = { "<cmd>TestLast<cr>", "Test Last"},
    v = { "<cmd>TestVisit<cr>", "Test Visit"},
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
  w = { "<cmd>:Telescope session-lens search_session<cr>", "Switch Workspace"},
}

return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require('which-key').setup(setup)
    require('which-key').register(mappings, opts)
  end
}