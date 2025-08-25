-- lua/plugins/lang/python.lua
-- 所有插件都设置为 lazy = true，并使用 ft = "python" 触发加载

local plugins = {
  -- 1. LSP 和通用 Python 工具
  {
    "neovim/nvim-lspconfig",
    -- 注意：基础的 lspconfig 已经在 plugins/init.lua 中加载，
    -- 但这里可以用来加载额外的 python 特定配置。
    -- 由于之前的配置是将 python.lspconfig 独立 require，
    -- 我们在这里使用 'require-setup' 模式确保它只在 python 文件时执行。
    lazy = true,
    ft = "python",
    config = function()
      -- 加载 python 独有的 lsp 配置 (如 pylsp settings)
      require "plugins.lang.python.lspconfig"
    end,
  },

  -- 2. 格式化和诊断工具 
  -- Mason 负责安装工具，Conform 负责调用。

  -- 3. DAP 调试相关 (所有 DAP 组件都应使用 ft 隔离)
  { "nvim-neotest/nvim-nio", lazy = true, ft = "python" },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    ft = "python", -- 仅在 Python 文件时加载基础 DAP
    dependencies = {
      -- 将 nvim-dap-ui 作为 nvim-dap 的依赖加载，并配置它。
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup()
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },
    },
    config = function()
      -- 在这里做基础的 dap setup，如果有的话
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    ft = "python", -- 仅在 Python 文件时加载
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
}

return plugins
