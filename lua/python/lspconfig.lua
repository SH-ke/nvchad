-- local config = require("configs.lspconfig")
require("nvchad.configs.lspconfig").defaults()
local nvlsp = require "nvchad.configs.lspconfig"

local lspconfig = require("lspconfig")

local servers = {
  -- "pyright",
  -- "python-lsp-server",
  "pylsp",
  "ruff",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = nvlsp.capabilities,
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    filetypes = {"python"},
  })
end
