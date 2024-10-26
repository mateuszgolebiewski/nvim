return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  { "MunifTanjim/nui.nvim" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    }
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("mateuszgolebiewski.plugins.catppuccin")
    end,
  },
}
