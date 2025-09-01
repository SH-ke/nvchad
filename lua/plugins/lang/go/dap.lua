local M = {}

function M.setup()
  require("dap-go").setup({
    dap_configurations = {
      {
        type = "go",
        name = "Launch file",
        request = "launch",
        program = "${file}",
      },
      {
        type = "go",
        name = "Attach remote",
        mode = "remote",
        request = "attach",
        host = "127.0.0.1",
        port = 4444
      }
    },
  })
end

return M