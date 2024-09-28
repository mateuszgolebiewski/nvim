-- Setup plugins using lazy.nvim
require("lazy").setup({
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
    requires = {
      "nvim-lua/plenary.nvim",        -- Required dependency
      "nvim-tree/nvim-web-devicons",  -- Optional, for file icons
    }
  },
  
  -- Telescope (File explorer)
  {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
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

  -- nvim-cmp (Autocompletion)
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)  -- You can replace this with your snippet engine
          end,
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
        },
        sources = {
          { name = 'nvim_lsp' },  -- LSP source
          { name = 'buffer' },    -- Buffer source
          { name = 'path' },      -- Path source
        }
      })
    end,
  },
})
require("mateuszgolebiewski.plugins.lsp")
