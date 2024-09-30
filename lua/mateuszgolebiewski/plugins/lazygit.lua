-- nvim v0.8.0
return {
  {
    "nvim-lua/plenary.nvim",
    lazy = false  -- This forces plenary.nvim to load eagerly
  },
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
}

