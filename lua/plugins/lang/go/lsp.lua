-- 修改 lua/plugins/lang/go/lsp.lua
local M = {}

function M.setup()
  -- 确保 gopls 存在
  if vim.fn.executable("gopls") == 0 then
    vim.notify("gopls not found in PATH", vim.log.levels.WARN)
    return
  end

  -- 修正 LSP 配置格式（关键修复）
  local cfg = {  -- 移除 vim.lsp.config() 包装，直接使用配置表
    name = "gopls",  -- 确保这是字符串类型
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = vim.fs.dirname(vim.fs.find({ "go.work", "go.mod", ".git" }, { upward = true })[1] or "."),
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

    on_attach = function(client, bufnr)
      -- 自动格式化
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end

      -- 基本快捷键
      local opts = { noremap = true, silent = true, buffer = bufnr }
      local map = vim.keymap.set
      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
  }

  -- 启动 LSP 服务器（使用修正后的配置）
  vim.lsp.start(cfg)
end

return M
