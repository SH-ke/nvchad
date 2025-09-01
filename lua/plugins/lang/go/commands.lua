local M = {}

function M.setup()
  -- 添加自定义命令
  vim.api.nvim_create_user_command("GoRunCurrent", function()
    vim.cmd("GoRun")
  end, { desc = "Run current Go file" })
  
  vim.api.nvim_create_user_command("GoTestCurrent", function()
    vim.cmd("GoTest")
  end, { desc = "Test current Go package" })
  
  vim.api.nvim_create_user_command("GoDebugCurrent", function()
    require('dap-go').debug_test()
  end, { desc = "Debug current Go test" })
end

return M