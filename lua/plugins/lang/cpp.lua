-- lua/plugins/lang/cpp.lua
local plugins = {
  -- C/C++ LSP
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = { "c", "cpp" },
    config = function()
      require("lspconfig").clangd.setup {
        -- 针对 clangd 的额外配置，例如：
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=never",
        },
      }
    end,
  },

  -- C/C++ DAP
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    ft = { "c", "cpp" },
    dependencies = {
      "mfussenegger/nvim-dap-ui",
    },
    config = function()
      -- 配置 C/C++ DAP (codelldb)
      -- 确保 mason 已安装 codelldb
      require("dap").adapters.cppdbg = {
        type = "server",
        host = "localhost",
        port = 13000,
        executable = {
          command = "codelldb",
          args = { "--port", "13000" },
        },
      }

      require("dap").configurations.cpp = {
        {
          name = "Launch file",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
        },
      }
    end,
  },
}

return plugins
