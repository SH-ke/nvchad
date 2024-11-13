require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
-- local py env
-- let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'
vim.g.python3_host_prog = vim.fn.expand('$HOME') .. '/.local/venv/nvim/bin/python'

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右侧和下侧
opt.splitright = true
opt.splitbelow = true

-- 搜索 「忽略大小写」
opt.ignorecase = true
opt.smartcase = true

-- 外观 「颜色、左侧多一列」
opt.termguicolors = true
opt.signcolumn = "yes"
-- tokyonight 主题
-- vim.cmd [[colorscheme tokyonight-moon]]

-- 设置 C 文件的缩进为 4 个空格
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.c",
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.expandtab = true
  end
})
