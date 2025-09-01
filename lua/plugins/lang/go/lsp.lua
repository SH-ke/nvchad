local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local util = require("lspconfig/util")
  
  lspconfig.gopls.setup({
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
    end,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        completeUnimported = true,
        usePlaceholders = true,
      },
    },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  })
end

return M