-- lua/plugins/init.lua
-- ===============================
-- 插件主配置文件
-- ===============================

-- ===============================
-- 基础 UI 增强类插件
-- ===============================
local plugins = {
  -- 状态栏
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto",
        section_separators = "",
        component_separators = "|",
      },
    },
  },

  -- 缓冲区标签栏
  { "akinsho/bufferline.nvim", event = "VeryLazy", opts = {} },

  -- 启动页
  { "glepnir/dashboard-nvim", event = "VimEnter", opts = {} },

  -- 文件树
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    opts = {
      view = { width = 35 },
      renderer = { highlight_opened_files = "all" },
    },
  },

  -- Git 信息提示
  { "lewis6991/gitsigns.nvim", event = "BufReadPre", opts = {} },

  -- 寄存器查看器
  { "tversteeg/registers.nvim", cmd = "Registers", lazy = true },

  -- 消息增强
  -- { "folke/noice.nvim", event = "VeryLazy", opts = {} },
  -- 找到你 Lazy.nvim 中 noice.nvim 的配置，添加 lsp 段
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- 其他已有的配置（比如 cmdline、presets 等）
      lsp = {
        -- 将 LSP 的 markdown 格式化交给 Noice 处理
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- 可选：让 cmp 补全的文档也用 Noice 显示
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", -- 确保已安装此依赖
    },
  },

  -- 通知弹窗
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup({
        stages = "fade_in_slide_out",
        timeout = 2000,
        render = "default",
      })
      vim.notify = require("notify")
    end,
  },

  -- 缩进线
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",  -- 新版入口模块
    event = "BufReadPost",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
    },
  },
}

-- ===============================
-- 核心功能插件
-- ===============================
table.insert(plugins, {
  "williamboman/mason.nvim",
  lazy = false, -- Mason 需最早加载
  opts = require("plugins.mason"),
})

table.insert(plugins, {
  "neovim/nvim-lspconfig",
  ft = { "lua", "python", "c", "cpp", "go", "html", "css", "markdown", "rust", "typst", "latex" },
  config = function()
    require("configs.lspconfig")
  end,
})

table.insert(plugins, {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  opts = require("plugins.treesitter"),
})

-- ===============================
-- 格式化 (Conform)
-- ===============================
table.insert(plugins, {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = require("configs.conform"),
})

-- ===============================
-- LeetCode 插件
-- ===============================
table.insert(plugins, {
  "kawre/leetcode.nvim",
  cmd = "LeetCode",
  lazy = true,
  opts = require("plugins.leetcode"),
})

-- ===============================
-- 动态加载语言插件
-- ===============================
local function add_plugins(newPlugins)
  if type(newPlugins) == "table" then
    for _, plugin in ipairs(newPlugins) do
      table.insert(plugins, plugin)
    end
  end
end

-- 按需加载各语言插件
add_plugins(require("plugins.lang.python"))
add_plugins(require("plugins.lang.cpp"))
add_plugins(require("plugins.lang.go"))
add_plugins(require("plugins.lang.web"))
add_plugins(require("plugins.lang.misc"))

-- ===============================
-- 返回最终插件列表
-- ===============================
return plugins
