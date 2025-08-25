local plugins = {

  -- UI 增强插件 (一般需要立即或非常早加载)
  { "nvim-lualine/lualine.nvim", event = "VeryLazy" },
  { "akinsho/bufferline.nvim", event = "VeryLazy", opts = {} },
  { "glepnir/dashboard-nvim", event = "VimEnter", opts = {} }, -- 启动页
  { "nvim-tree/nvim-tree.lua", cmd = { "NvimTreeToggle", "NvimTreeFindFile" }, opts = {} }, -- 按命令加载
  { "lewis6991/gitsigns.nvim", event = "BufReadPre", opts = {} }, -- 文件读取前加载 (依赖于 git 文件)
  { "tversteeg/registers.nvim", lazy = true, cmd = "Registers" }, -- 按命令加载
  { "folke/noice.nvim", event = "VeryLazy", opts = {} }, -- 通知/消息美化，尽早加载
  { "lukas-reineke/indent-blankline.nvim", event = "BufReadPost", opts = {} }, -- 缩进线，文件打开后加载

  -- 核心功能插件
  { "williamboman/mason.nvim", lazy = false, opts = require "plugins.mason" }, -- Mason 必须尽早加载
  { "neovim/nvim-lspconfig", lazy = true, ft = { "lua", "python", "c", "cpp", "go", "html", "css", "markdown", "rust", "typst", "latex" }, config = function() require "configs.lspconfig" end }, -- 仅在相关文件类型时加载
  { "nvim-treesitter/nvim-treesitter", opts = require "plugins.treesitter", event = "BufReadPost" }, -- 文件打开后加载

  -- 格式化插件 (替代 null-ls)
  { "stevearc/conform.nvim", event = "BufWritePre", opts = require "configs.conform" }, -- 写入文件前加载

  -- LeetCode
  { "kawre/leetcode.nvim", lazy = true, cmd = "LeetCode", opts = require "plugins.leetcode" }, -- 按命令加载
}

-- 定义添加插件的函数
local function add_plugins(newPlugins)
    -- 确保 newPlugins 是一个 table
    if type(newPlugins) == 'table' then
        for _, plugin in ipairs(newPlugins) do
            table.insert(plugins, plugin)
        end
    end
end

add_plugins(base_plugins)

-- 加载语言隔离插件
add_plugins(require('plugins.lang.python'))
-- add_plugins(require('plugins.lang.cpp'))
add_plugins(require('plugins.lang.golang'))
-- add_plugins(require('plugins.lang.web'))
-- add_plugins(require('plugins.lang.misc'))

-- 注意：原始文件中的以下内容需要移到 plugins/init.lua 中
-- local plugins = {
--   { "stevearc/conform.nvim", ... },
--   { "neovim/nvim-lspconfig", ... },
-- }
-- 已经将这些移至 plugins/init.lua 并设置了 event/ft 进行延迟加载。

-- 语言相关的插件将通过 require 动态加载并添加到这个列表中
-- 在 init.lua 中实现合并逻辑。

return plugins
