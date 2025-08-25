-- lua/plugins/lang/web.lua
local plugins = {
  -- Web LSP (html, cssls, jsonls)
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = { "html", "css", "json" },
    config = function()
      -- lspconfig 将自动为这些服务器应用默认设置
      -- 如果需要特定配置，可以像下面这样添加：
      -- require("lspconfig").html.setup({})
      -- require("lspconfig").cssls.setup({})
    end,
  },
}

return plugins
