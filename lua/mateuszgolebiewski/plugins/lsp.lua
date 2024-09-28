-- Initialize Mason and Mason-lspconfig
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "terraformls", "pyright" }, -- Ensures Terraform and Python LSPs are installed
    automatic_installation = true,
})

local lspconfig = require("lspconfig")

-- Setup Terraform LSP
lspconfig.terraformls.setup({
  on_attach = function(client, bufnr)
    -- Key mappings for Terraform LSP
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
  end,
  filetypes = { "terraform", "hcl" }, -- Specify filetypes for Terraform
  root_dir = lspconfig.util.root_pattern(".terraform", ".git", "main.tf"),
  
  -- Enable linting by adding `settings`
  settings = {
    terraform = {
      lint = {
        enable = true,  -- Enable linting support
      },
    },
  },
})
-- Setup Pyright LSP for Python
lspconfig.pyright.setup({
  on_attach = function(client, bufnr)
    print("Pyright attached to buffer " .. bufnr)
    -- Key mappings for LSP functionality
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  end,
  filetypes = { "python" },  -- Ensure it's set for Python filetypes
  root_dir = lspconfig.util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt"),
})

