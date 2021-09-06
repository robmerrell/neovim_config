return require("packer").startup(function()
  use "wbthomason/packer.nvim"

  -- look and feel
  use "rktjmp/lush.nvim"
  use "~/projects/wavebeam.nvim"
  use "folke/tokyonight.nvim"
  use {
    "hoob3rt/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- editing
  use "b3nj5m1n/kommentary"
  use "tpope/vim-surround"
  use "windwp/nvim-autopairs"
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"

  -- completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-vsnip"
    }
  }

  -- language support 
  use "neovim/nvim-lspconfig"
  use "elixir-editors/vim-elixir"

  -- keybinds
  use "folke/which-key.nvim"
end)
