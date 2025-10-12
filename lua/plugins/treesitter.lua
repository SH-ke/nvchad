-- lua/plugins/treesitter.lua
local plugins = {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua", "python", "c", "cpp",
  		"vim", "lua", "vimdoc",
      "html", "css",
  		"bash",
  		"go",         -- 添加 Golang
  		"json",
  		"markdown",
  		"rust",
  		"typst",      -- 添加 Typst
  		"latex",      -- 添加 LaTeX
    },
  },

  config = function(_, opts)
    -- 🌱 先设置安装行为
    local install = require("nvim-treesitter.install")
    install.prefer_git = false
    install.compilers = { "zig", "clang" }

    -- 🌳 再加载 treesitter 主配置
    require("nvim-treesitter.configs").setup(opts)
  end,
}

return plugins
