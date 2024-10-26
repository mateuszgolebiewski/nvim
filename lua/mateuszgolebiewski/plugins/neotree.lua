require("neo-tree").setup({
  close_if_last_window = true,  
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_hidden = true, 
    },
    follow_current_file = true,  
    hijack_netrw_behavior = "open_default",  
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


