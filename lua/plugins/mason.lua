local plugins = {
  -- Run the MasonInstallAll command
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
    },
    run_on_start = true,
    log_level = vim.log.levels.DEBUG,
  },
}

return plugins
