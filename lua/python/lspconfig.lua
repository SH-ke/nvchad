local lspconfig = require("lspconfig")

-- 配置 pylsp
lspconfig.pylsp.setup({
  settings = { pylsp = {
    plugins = {
      -- 启用 python-rope 插件
      rope_autoimport = { enabled = true },
      rope_completion = { enabled = true },
    },
    -- 其他插件配置，如 flake8、yapf 等
    flake8 = {
      enabled = true,
      maxLineLength = 120
    },
    black = {
      enabled = true
    }
  }}, -- settings
  -- 确保附加到 Python 文件类型
  filetypes = { "python" },
})


return plugins
