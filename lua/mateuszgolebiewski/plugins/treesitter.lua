require("nvim-treesitter.configs").setup({
  ensure_installed = { "python", "hcl", "bash" }, -- Install Tree-sitter parsers for Python, Terraform (hcl), and Bash
  highlight = {
    enable = true,               -- Enable Tree-sitter syntax highlighting
    additional_vim_regex_highlighting = false,  -- Disable Vim's regex highlighting for performance
  },
  indent = {
    enable = true,               -- Enable Tree-sitter-based indentation
  },
})

