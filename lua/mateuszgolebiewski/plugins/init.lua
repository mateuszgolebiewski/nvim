-- Setup plugins using lazy.nvim
require("lazy").setup({

  require("mateuszgolebiewski.plugins.lazygit"),
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  
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
    }
  },
  -- Add nvim-treesitter as a plugin
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",  -- Automatically updates Treesitter parsers
    config = function()
      -- Treesitter configuration
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "terraform", "bash", "python", "javascript" }, -- Add languages here
        highlight = {
          enable = true,          -- Enable highlighting
          additional_vim_regex_highlighting = false, -- Disable Vim's regex-based highlighting
        },
      })
    end,
  },  
  -- LSP Config and Mason for managing LSP servers
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- This updates registry contents
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSPconfig integration
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "terraformls", "pyright" }, -- Automatically install these LSP servers
        automatic_installation = true,
      })
    end,
  },

  { "MunifTanjim/nui.nvim" },         -- Required for Neo-tree
  -- Neo-tree (File Explorer)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",        -- Required dependency
      "nvim-tree/nvim-web-devicons",  -- Optional, for file icons
    }
  },
  
  -- Telescope (File explorer)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  -- Colorscheme
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("mateuszgolebiewski.plugins.catppuccin")
    end,
  },
})
require("mateuszgolebiewski.plugins.completions")
require("mateuszgolebiewski.plugins.lsp")
require("mateuszgolebiewski.plugins.toggleterm-config")
