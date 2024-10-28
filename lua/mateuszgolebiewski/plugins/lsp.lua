local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true }

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
end

return {
  { "neovim/nvim-lspconfig" },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = { "terraformls", "pyright", "bashls", "yamlls", "jsonls", "dockerls", "gopls", "ansiblels" },
        automatic_installation = true,
      })

      lspconfig.terraformls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "terraform", "hcl" },
        root_dir = lspconfig.util.root_pattern("tf"),
        settings = {
          terraform = {
            lint = {
              enable = true,
            },
          },
        },
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "python" },
        root_dir = lspconfig.util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt"),
      })

      lspconfig.bashls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "sh" },
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "go", "gomod", "gowork", "gotmpl"},
        root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,   
            },
            staticcheck = true,     
          },
        },
      })
    end,
  },
}
