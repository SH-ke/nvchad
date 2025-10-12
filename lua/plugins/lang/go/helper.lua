-- 原 go.nvim 配置迁移至此
local M = {}

function M.setup()
  require("go").setup({
    gofmt = "gopls",
    goimport = "gopls",
    max_line_len = 120,
    tag_transform = false,
    test_dir = "",
    verbose = false,
    luasnip = true,
  })
  
  -- 保存时自动导入和格式化
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      require("go.format").goimport()
    end,
  })
end

return M
