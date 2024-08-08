-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "zls", "gopls"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    vim.lsp.inlay_hint.enable(true),
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- https://neovimcraft.com/plugin/junnplus/lsp-setup.nvim/
lspconfig.zls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    zls = {
      zig_exe_path = "/Users/rg/opt/zig/zig",
      -- enable_ast_check_diagnostics = true,
      -- enable_import_embedfile_argument_completions = true,
      -- operator_completions = true,
      -- include_at_in_builtins = true,
      enable_inlay_hints = true,
      inlay_hints_hide_redundant_param_names = true,
      inlay_hints_hide_redundant_param_names_last_token = true,
      enable_auto_fix = true,
    }
  }
}

-- https://oneofone.dev/post/neovim-lsp-go-rust/
lspconfig.gopls.setup({
  cmd = { "gopls" },
  single_file_support = true,
 
  settings = {
      gopls = {
          gofumpt = true,
          staticcheck = true,
          analyses = {
              unusedparams = true,
              unusedvariable = true,
              unusedwrite = true,
          },
          hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              parameterNames = true,
              rangeVariableTypes = true,
          },
      }
  },
})
