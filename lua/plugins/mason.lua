return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  opts = {
    ensure_installed = {
      "black",
      "debugpy",
      "python-lsp-server",
      "clangd",
      "clang-format",
      "codelldb",
      "gopls",
      "goimports-reviser",
      "delve",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    require("mason-tool-installer").setup({
      ensure_installed = opts.ensure_installed,
      run_on_start = true,        -- ⬅ 让它在启动时自动安装
      log_level = vim.log.levels.DEBUG,
    })
  end,
}
