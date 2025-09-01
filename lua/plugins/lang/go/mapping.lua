local M = {}

function M.setup()
  local map = vim.keymap.set
  
  -- LSP 相关映射
  map('n', '<leader>gf', vim.lsp.buf.format, { desc = "Format Go code" })
  
  -- DAP 调试映射
  map('n', '<leader>db', require('dap').toggle_breakpoint, { desc = "Toggle breakpoint" })
  map('n', '<leader>dc', require('dap').continue, { desc = "Continue debugging" })
  map('n', '<leader>do', require('dap').step_over, { desc = "Step over" })
  map('n', '<leader>di', require('dap').step_into, { desc = "Step into" })
  map('n', '<leader>dt', function()
    require('dap-go').debug_test()
  end, { desc = "Debug test" })
  
  -- 运行和构建映射
  map('n', '<leader>gr', ':GoRun<CR>', { silent = true, desc = "Run Go program" })
  map('n', '<leader>gb', ':GoBuild<CR>', { silent = true, desc = "Build current package" })
  map('n', '<leader>gt', ':GoTest<CR>', { silent = true, desc = "Run tests" })
  map('n', '<leader>gi', ':GoImport<CR>', { silent = true, desc = "Manage imports" })
end

return M