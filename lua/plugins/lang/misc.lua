-- lua/plugins/lang/misc.lua

return {
  "neovim/nvim-lspconfig",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },

  config = function()
    -- filetype → lsp server 映射表
    local ft_map = {
      markdown = "marksman",
      rust = "rust_analyzer",
      typst = "typst_lsp",
      latex = "texlab",
      tex = "texlab",
    }

    -- 自动在合适 filetype 时启用 LSP
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = args.match
        local server = ft_map[ft]
        if not server then return end

        -- 使用 Neovim 0.11+ 新 API 启动 LSP
        vim.lsp.enable(server)
      end,
    })
  end,
}
