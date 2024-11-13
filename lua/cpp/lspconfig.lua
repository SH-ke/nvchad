-- local base = require("configs.lspconfig")
require("nvchad.configs.lspconfig").defaults()
local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- require("nvchad.configs.lspconfig").defaults()
-- local nvlsp = require "nvchad.configs.lspconfig"
--
-- local lspconfig = require("lspconfig")
--
-- local servers = {
--   -- "pyright",
--   -- "python-lsp-server",
--   "pylsp",
--   "ruff",
-- }
--
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup({
--     capabilities = nvlsp.capabilities,
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     filetypes = {"python"},
--   })
-- end
