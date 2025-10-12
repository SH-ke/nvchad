local M = {}

-- Your setup function remains the same
function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
      vim.bo.tabstop = 4
      vim.bo.shiftwidth = 4
      vim.bo.expandtab = true
    end,
  })
end

-- Return plugins directly (without wrapping in M.plugins())
return {
  -- 1. Golang LSP
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = "go",
    config = function()
      -- require("plugins.lang.go.lsp").setup()
    end,
  },

  -- 2. Golang DAP
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    ft = "go",
    dependencies = {
      "leoluz/nvim-dap-go",
    },
    config = function()
      require("plugins.lang.go.dap").setup()
    end,
  },

  -- 3. Golang 辅助插件
  {
    "ray-x/go.nvim",
    lazy = true,
    ft = "go",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "ray-x/guihua.lua",
    },
    config = function()
      require("go").setup({
        gofmt = 'gopls',
        goimport = 'gopls',
        max_line_len = 120,
        tag_transform = false,
        test_dir = "",
        verbose = false,
        luasnip = true,
      })
      
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require('go.format').goimport()
        end,
      })
      
      require("plugins.lang.go.mapping").setup()
      require("plugins.lang.go.commands").setup()
    end,
  },
}
