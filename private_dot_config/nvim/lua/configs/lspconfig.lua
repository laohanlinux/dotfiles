-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "zls", "gopls"}

-- vim.opt.tabstop = 8, -- Always 8 (see :h tabstop)
-- vim.opt.softtabstop = 2, -- What you expecting
-- vim.opt.shiftwidth = 2, -- What you expecting
vim.opt.tabstop = 4

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

-- https://github.com/zigtools/zls/blob/master/schema.json
lspconfig.zls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    zls = {
      -- zig_exe_path = "/Users/rg/opt/zig/zig",
      zig_fmt_autosave = true,
      enable_autofix = true,
      inlay_hints_hide_redundant_param_names = true,
      inlay_hints_hide_redundant_param_names_last_token = true,
      warn_style = true,
      highlight_global_var_declarations = true,
      completion_label_details = true,
    }
  }
}

-- https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
lspconfig.gopls.setup{
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
      gopls = {
          -- gofumpt = true,
          staticcheck = true,
          -- analyses = {
          --     unusedparams = true,
          --     unusedvariable = true,
          --     unusedwrite = true,
          -- },
          hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              parameterNames = true,
              rangeVariableTypes = true,
          },
      },
  },
}
