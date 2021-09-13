vim.g.mapleader = " "

-- I constantly press this by accident
vim.api.nvim_set_keymap("", "I", "<Nop>", {noremap = true, silent = true})

local wk = require("which-key")

-- normal mode
wk.register({
  -- top level
  n = {"<cmd>noh<cr>", "Clear Search"},

  -- Buffers
  b = {
    name = "buffers",
    n = {"<cmd>bnext<cr>", "Next Buffer"},
    p = {"<cmd>bnext<cr>", "Previous Buffer"},
    s = {"<cmd>Telescope buffers<cr>", "Switch Buffer"}
  },

  -- General code binds
  c = {
    name = "code",
    d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Jump to Definition"},
    f = {"<cmd>Telescope lsp_document_symbols symbols=function<cr>", "Find Function"},
    k = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Documentation"},
    l = {"<Plug>kommentary_line_default<cr>", "Toggle Comments"},
    x = {"<cmd>Trouble<cr>", "Problems"}
  },

  -- Files
  f = {
    name = "file", -- optional group name
    e = {"<cmd>Fern %:h<cr>", "Explore at Dir"},
    f = {"<cmd>Telescope find_files<cr>", "Find File"},
    r = {"<cmd>Fern .<cr>", "Explore at Root"}
  },

  -- Testing
  t = {
    name = "Testing",
    a = {"<cmd>TestSuite<cr>", "Run All Tests"},
    c = {"<cmd>TestNearest<cr>", "Run Current Test"},
    f = {"<cmd>TestFile<cr>", "Run File's Test"},
    p = {"<cmd>TestLast<cr>", "Run Previous Test"},
    v = {"<Plug>SetTmuxVars<cr>", "Set Tmux Vars"}
  },

  -- Window
  w = {
    name = "window",
    ["1"] = {"<cmd>1wincmd w<cr>", "Window 1"},
    ["2"] = {"<cmd>2wincmd w<cr>", "Window 2"},
    ["3"] = {"<cmd>3wincmd w<cr>", "Window 3"},
    ["4"] = {"<cmd>4wincmd w<cr>", "Window 4"},
    h = {"<cmd>wincmd h<cr>", "Select Left Window"},
    j = {"<cmd>wincmd j<cr>", "Select Lower Window"},
    k = {"<cmd>wincmd k<cr>", "Select Upper Window"},
    l = {"<cmd>wincmd l<cr>", "Select Right Window"},
    s = {"<cmd>split<cr>", "Split Horizontally"},
    v = {"<cmd>vsplit<cr>", "Split Vertically"}
  }
}, { prefix = "<leader>" })


-- visual mode
wk.register({
  -- General code binds
  c = {
    name = "code",
    l = {"<Plug>kommentary_visual_default<C-c><cr>", "Toggle Comments"}
  }
}, { prefix = "<leader>", mode = "v" })
