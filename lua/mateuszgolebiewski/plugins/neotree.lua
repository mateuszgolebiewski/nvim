-- Neo-tree configuration
require("neo-tree").setup({
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded", -- Border style for popups
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    filtered_items = {
      hide_dotfiles = false, -- Show dotfiles by default
      hide_gitignored = true,
      hide_hidden = true,    -- Hide hidden files
    },
    follow_current_file = true, -- Follow the current file in the tree
    hijack_netrw_behavior = "open_default", -- Replace netrw with Neo-tree
  },
  buffers = {
    show_unloaded = true,
  },
  git_status = {
    window = {
      position = "float",
    },
  },
})


