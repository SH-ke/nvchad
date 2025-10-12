-- lua/plugins/lang/go/lsp.lua
local M = {}

function M.setup()
  -- 使用新的 LSP 配置 API（Neovim 0.11+）
  local config = vim.lsp.config({
    name = "gopls",
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.work", "go.mod", ".git" },
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          unreachable = true,
        },
        staticcheck = true,
        gofumpt = true,
        usePlaceholders = true,
        completeUnimported = true,
      },
    },

    -- 附加时回调（格式化、键位绑定等）
    on_attach = function(client, bufnr)
      -- 启用格式化功能（如果可用）
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end

      -- 基本 LSP 快捷键
      local opts = { noremap = true, silent = true, buffer = bufnr }
      local map = vim.keymap.set
      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
    end,

    capabilities = vim.lsp.protocol.make_client_capabilities(),
  })

  -- 启动或附加到当前 buffer
  vim.lsp.start(config)
end

return M
