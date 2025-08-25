-- lua/plugins/treesitter.lua
local plugins = {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
      --... 其他配置
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css",
        "bash",
        "c",
        "cpp",        -- 添加 C++
        "go",         -- 添加 Golang
        "json",
        "markdown",
        "python",
        "rust",
        "typst",      -- 添加 Typst
        "latex",      -- 添加 LaTeX
  		},
  	},
}

return plugins
