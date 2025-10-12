-- 提取原 init.lua 中的基础设置
local M = {}

function M.setup()
  -- Go 文件类型基础配置
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
      vim.bo.tabstop = 4
      vim.bo.shiftwidth = 4
      vim.bo.expandtab = true  -- 使用空格而非制表符
    end,
  })
end

return M
