vim.g.mapleader = " "

local wk = require("which-key")

-- normal mode
wk.register({
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
    k = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Documentation"},
    l = {"<Plug>kommentary_line_default<cr>", "Toggle Comments"}
  },

  -- Files
  f = {
    name = "file", -- optional group name
    f = {"<cmd>Telescope find_files<cr>", "Find File"}
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
    l = {"<cmd>wincmd l<cr>", "Select Right Window"}
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
