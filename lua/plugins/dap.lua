-- 在你的 Lazy 插件列表中添加以下内容
return {
  -- 1. DAP 核心客户端（必装）：对接各种语言的调试适配器
  "mfussenegger/nvim-dap",
  dependencies = {
    -- 2. 可视化调试 UI（推荐）：替代默认的命令行调试，直观显示变量、调用栈
    "rcarriga/nvim-dap-ui",
    -- 3. 虚拟文本提示（推荐）：在代码行旁显示变量值，不用切换窗口
    "theHamsta/nvim-dap-virtual-text",
    -- 4. Mason 集成（必装，和你现有 Mason 配合）：通过 Mason 安装调试适配器
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    -- 初始化 Mason-nvim-dap（让 Mason 管理 DAP 适配器）
    require("mason-nvim-dap").setup({
      -- 自动安装对应语言的 DAP 适配器（根据你常用的语言勾选）
      ensure_installed = {
        "delve",    -- Go 的调试适配器
        "debugpy",  -- Python 的调试适配器
        "lldb-vscode", -- Rust/C/C++ 的调试适配器
        -- 其他语言：node2（JS/TS）、javadbg（Java）等，按需添加
      },
      -- 自动配置 DAP（部分适配器可自动生成配置，减少手动编写）
      automatic_setup = true,
    })

    -- 初始化 DAP-UI（调试时自动打开 UI 窗口）
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup({
      -- UI 布局配置（默认即可，也可自定义窗口位置）
      layouts = {
        {
          elements = { "scopes", "breakpoints", "stacks", "watches" },
          size = 40,
          position = "left",
        },
        {
          elements = { "repl", "console" },
          size = 10,
          position = "bottom",
        },
      },
    })

    -- 调试启动时自动打开 UI，退出时自动关闭
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- 初始化虚拟文本（代码行旁显示变量值）
    require("nvim-dap-virtual-text").setup({
      enabled = true,
      virt_text_pos = "eol", -- 显示在代码行末尾
      highlight_changed_variables = true, -- 高亮变化的变量
    })
  end,
}