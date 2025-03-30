local plugins = {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css",
        "bash",
        "c",
        "json",
        "markdown",
        "python",
        "rust",
  		},
  	},
}

return plugins
