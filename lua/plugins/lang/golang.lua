-- lua/plugins/lang/golang.lua
local plugins = {
  -- 1. Golang LSP
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = "go", -- 仅在 Go 文件时加载
    -- gopls 通常不需要太多额外配置，依赖 Mason 和 nvim-lspconfig 默认即可
  },

  -- 2. Golang DAP
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    ft = "go",
    dependencies = {
      -- 依赖 nvim-dap-go
      "leoluz/nvim-dap-go",
    },
    config = function()
      -- 配置 nvim-dap-go
      require("dap-go").setup()
    end,
  },

  -- 3. Golang 辅助插件 (可选)
  {
    "ray-x/go.nvim",
    lazy = true,
    ft = "go",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "ray-x/guihua.nvim",
    },
    config = function()
      require("go").setup({
        -- 可选配置
        luasnip = true,
        -- ...
      })
    end,
  },
}

return plugins
