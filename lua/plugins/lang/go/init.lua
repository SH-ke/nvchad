-- 整合所有配置入口，保持插件定义与配置分离
local M = {}

function M.setup()
  -- 基础设置（缩进等）
  require("plugins.lang.go.settings").setup()
  
  -- 加载映射配置
  require("plugins.lang.go.mapping").setup()
  
  -- 加载命令配置
  require("plugins.lang.go.commands").setup()
end

-- 插件定义（保持懒加载特性）
return {
  -- LSP 配置
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = "go",
    config = function()
      require("plugins.lang.go.lsp").setup()
    end,
  },

  -- 调试配置
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    ft = "go",
    dependencies = "leoluz/nvim-dap-go",
    config = function()
      require("plugins.lang.go.dap").setup()
    end,
  },

  -- 辅助工具插件
  {
    "ray-x/go.nvim",
    lazy = true,
    ft = "go",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "ray-x/guihua.lua",
    },
    config = function()
      require("plugins.lang.go.helper").setup()
    end,
  },
}
