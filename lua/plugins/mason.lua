local plugins = {
  "williamboman/mason.nvim",
  install_root_dir = vim.fn.stdpath("data") .. "/mason",
  opts = {
    ensure_installed = {
      "black",
      "debugpy",
      "mypy",
      "ruff",
      "pylsp",
      "python-lsp-server",
      "clangd",
      "clang-format",
      "codelldb",
      "gopls",        -- Golang LSP
      "goimports",    -- Golang 格式化/导入
      "delve",        -- Golang 调试器
    },
    run_on_start = true,
    log_level = vim.log.levels.DEBUG,
  },
}

return plugins
