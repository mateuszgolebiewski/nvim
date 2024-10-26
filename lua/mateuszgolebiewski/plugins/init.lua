-- Setup plugins using lazy.nvim
require("lazy").setup({

  require("mateuszgolebiewski.plugins.lazygit"),
  require("mateuszgolebiewski.plugins.treesitter"),
  require("mateuszgolebiewski.plugins.toggleterm-config"),
  require("mateuszgolebiewski.plugins.ui"),
  require("mateuszgolebiewski.plugins.lsp"),
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },
 { "neovim/nvim-lspconfig" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("mateuszgolebiewski.plugins.catppuccin")
    end,
  },
})
require("mateuszgolebiewski.plugins.cmp")
require("mateuszgolebiewski.plugins.toggleterm-config")
require("mateuszgolebiewski.plugins.lualine")
require("mateuszgolebiewski.plugins.formatting")
