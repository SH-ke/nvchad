-- lua/plugins/lang/misc.lua
local plugins = {
  -- Markdown LSP
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = { "markdown" },
    config = function()
      require("lspconfig").marksman.setup {}
    end,
  },

  -- Rust LSP (rust_analyzer)
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = { "rust" },
    config = function()
      require("lspconfig").rust_analyzer.setup {}
    end,
  },

  -- Typst LSP
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = { "typst" },
    config = function()
      require("lspconfig").typst_lsp.setup {}
    end,
  },

  -- LaTeX LSP
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = { "latex" },
    config = function()
      require("lspconfig").texlab.setup {}
    end,
  },
}

return plugins
