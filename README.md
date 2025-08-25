# ⚡ Neovim 现代配置：模块化与高性能

这是一个基于 Lua 的 Neovim 配置，旨在通过**模块化架构**和 **`lazy.nvim` 的极致延迟加载**，实现高性能和优雅的多语言开发环境。本配置特别注重**语言隔离**，确保只有在特定文件类型下才加载对应插件，从而大幅提升启动速度和日常使用效率。

## ✨ 核心特性

  * **高性能启动：** 使用 `lazy.nvim` 进行高效插件管理，通过 `ft` (文件类型) 和 `event` (事件) 实现按需延迟加载。
  * **语言隔离：** 所有语言相关的 LSP、DAP 和辅助插件配置均隔离在 `lua/plugins/lang/` 目录下。
  * **现代化工具链：**
      * **LSP/DAP：** 使用 `nvim-lspconfig` 和 `nvim-dap` 配合 `williamboman/mason.nvim` 自动管理和安装语言服务器与调试器。
      * **格式化：** 弃用 `null-ls`，采用 **`stevearc/conform.nvim`** 驱动 Mason 安装的格式化工具。
  * **多语言支持：** 深度支持以下编程语言：
      * **主流：** Python, Lua, Golang, C, C++, HTML, CSS.
      * **其他：** Markdown, Rust, Typst, LaTeX.

## 📦 插件概览 (UI/通用)

| 插件名称 | 用途 | 延迟策略 |
| :--- | :--- | :--- |
| `lazy.nvim` | 插件管理器 | N/A (核心) |
| `nvim-tree/nvim-tree.lua` | 文件树 | `cmd` (按命令加载) |
| `nvim-lualine/lualine.nvim` | 状态行 | `VeryLazy` (尽早加载) |
| `akinsho/bufferline.nvim` | 顶部标签栏 | `VeryLazy` (尽早加载) |
| `glepnir/dashboard-nvim` | 启动界面 | `VimEnter` |
| `lewis6991/gitsigns.nvim` | Git 状态显示 | `BufReadPre` (打开文件时) |
| `folke/noice.nvim` | 命令行和消息美化 | `VeryLazy` |
| `lukas-reineke/indent-blankline.nvim` | 缩进线 | `BufReadPost` (打开文件后) |
| `tversteeg/registers.nvim` | 寄存器可视化 | `cmd` (按命令加载) |

## ⚙️ 架构设计

本配置遵循清晰的模块化设计，所有核心配置和插件配置均位于 `lua/` 目录下。

```
lua/
├── configs/          <-- 插件配置中心 (Conform, LSP, Lazy 本身)
├── mappings.lua      <-- 全局按键映射
├── options.lua       <-- 全局 Neovim 设置 (vim.opt)
├── plugins/
│   ├── init.lua      <-- 通用 UI/核心插件列表
│   ├── lang/         <-- 语言隔离配置目录 (核心)
│   │   ├── cpp.lua   <-- C/C++ (clangd, codelldb)
│   │   ├── golang.lua<-- Golang (gopls, delve)
│   │   ├── misc.lua  <-- Rust, Typst, LaTeX, Markdown
│   │   ├── python.lua<-- Python (pylsp, debugpy)
│   │   └── web.lua   <-- HTML, CSS, JSON
│   └── mason.lua     <-- Mason 工具安装列表
│   └── treesitter.lua<-- Treesitter 语言解析配置
└── init.lua          <-- 入口文件，负责加载和合并所有模块
```

## 🚀 安装与使用

### 前置条件

  * **Neovim v0.9.0+**
  * **Git**
  * **LuaJIT (推荐)**
  * **外部工具：** 确保您系统上安装了 `tree-sitter` CLI (用于编译解析器)。 

### 安装 Tree-sitter CLI

**强烈推荐使用 Cargo (Rust 包管理器) 安装：**

```bash
# 如果您尚未安装 Rust 和 Cargo，请先安装：
# https://rustup.rs/
cargo install tree-sitter-cli
```

**各系统特定方法：**

*   **Arch Linux (通过 AUR，推荐)：**
    ```bash
    # 使用 yay 或 paru 等 AUR 助手
    yay -S tree-sitter-cli
    # 或
    paru -S tree-sitter-cli
    ```

*   **Arch Linux / Linux (通过 npm)：**
    ```bash
    # 确保已安装 Node.js 和 npm
    sudo npm install -g tree-sitter-cli
    ```

*   **Windows 11：**
    ```bash
    # 1. 通过 Cargo (推荐)
    cargo install tree-sitter-cli

    # 2. 或通过 npm
    npm install -g tree-sitter-cli

    # 如果 npm 安装失败，可能需要安装 Windows 构建工具
    # 以管理员身份运行 PowerShell 并执行：
    npm install --global windows-build-tools
    ```

### 步骤

1.  **克隆配置：**
    ```bash
    git clone https://github.com/SH-ke/nvchad.git ~/.config/nvim
    # 特别的，在 Windows 上，请使用：
    git clone https://github.com/SH-ke/nvchad.git ~/AppData/Local/nvim
    ```
2.  **启动 Neovim：**
    第一次启动 Neovim 时，`lazy.nvim` 将自动安装所有插件。
    ```bash
    nvim
    ```
3.  **安装语言工具：**
    由于 `mason.nvim` 在 `mason.lua` 中设置了 `run_on_start = true` 和 `ensure_installed` 列表，它应该会自动安装所有语言服务器、调试器和格式化工具。如果自动安装失败，请手动运行：
    ```vim
    :MasonInstallAll
    ```
4.  **更新 Treesitter 解析器：**
    ```vim
    :TSUpdate
    ```

## ⌨️ 按键绑定 (DAP 示例)

| 动作 | 模式 | 快捷键 | 描述 |
| :--- | :--- | :--- | :--- |
| **断点** | `n` | `<F9>` | 切换断点 (`DapToggleBreakpoint`) |
| **继续** | `n` | `<F5>` | 继续执行 (`DapContinue`) |
| **步入** | `n` | `<F11>` | 单步进入函数 (`DapStepInto`) |
| **步过** | `n` | `<F10>` | 单步跳过函数 (`DapStepOver`) |
| **终止** | `n` | `<S-F5>` | 终止调试会话 (`DapTerminate`) |
| **变量** | `n` | `<F12>` | 显示变量值 (`dap.ui.widgets.hover()`) |

*(更多按键绑定请参考 `lua/mappings.lua`)*