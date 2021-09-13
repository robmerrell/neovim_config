-- Any configuration that needs to be done before packages are loaded
vim.g.kommentary_create_default_mappings = false

require("packages")
require("keybinds")
require("languages/elixir")


-- hidden buffers
vim.o.hidden = true


-- yank to clipboard
vim.o.clipboard = "unnamedplus"


-- indentation
vim.cmd("filetype plugin indent on")
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.backspace= "start,indent"


-- comments
require('kommentary.config').configure_language("default", {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true
})


-- line numbering
vim.o.number = true


-- colorscheme
vim.o.termguicolors = true
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_comments = true
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme wavebeam]]


-- autocomplete
local cmp = require("cmp")
cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- snippet support
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  -- installed sources
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" }
  },
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)


-- snippet setup
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets"


-- auto surround
require("nvim-autopairs").setup()


-- status bar
local function window_id()
  return tostring(vim.api.nvim_eval("tabpagewinnr(tabpagenr())"))
end
require("lualine").setup {
  options = {
    theme = "tokyonight"
  },
  sections = {
    lualine_a = {window_id}
  },
  inactive_sections = {
    lualine_a = {window_id}
  }
}


-- tree sitter
require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained", 
  highlight = {
    enable = true,
    custom_captures = {
      ["elixir.docs"] = "comment",
      ["elixir.spec"] = "comment"
    }
  }
})

local query = require("vim.treesitter.query")
local function override_ts_query(language, query_name)
  local path = (vim.fn.stdpath("config") .. ("/treesitter/" .. language .. "/" .. query_name .. ".scm"))
  local contents = vim.fn.join(vim.fn.readfile(path), "\n")
  query.set_query(language, query_name, contents)
end
override_ts_query("elixir", "highlights")


-- lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


-- testing
vim.g["test#strategy"] = "tslime"

