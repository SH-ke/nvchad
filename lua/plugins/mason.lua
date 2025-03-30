local plugins = {
      "williamboman/mason.nvim",
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
