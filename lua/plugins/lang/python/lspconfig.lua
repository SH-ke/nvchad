-- lua/plugins/lang/python/lspconfig.lua
-- 注意：这里仅放置 Python 特定的 lspconfig，不影响 init.lua 中加载的核心 lspconfig
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
