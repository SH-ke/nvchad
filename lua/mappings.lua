require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "

--- --- --- --- 插入模式 --- --- --- ---
map("i", "jk", "<ESC>")
map("i", "<C-s>", "<ESC>:w<CR>")

--- --- --- --- 视觉模式 --- --- --- ---
-- 单行或多行移动
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

--- --- --- --- 正常模式 --- --- --- ---
-- 窗口
map("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
map("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
map("n", "<leader>nh", ":nohl<CR>")

--- --- --- --- 插件 --- --- --- ---
-- running single python codes
-- map("n", "<leader>py", '<cmd>TermExec cmd="python %"<cr>', { desc = "Run python codes" })

-- nvim-tree
map("n", "<leader>t", ":NvimTreeToggle<CR>") -- 文件侧边栏 开启/关闭
map("n", "<leader>f", ":NvimTreeFocus<CR>") -- 文件侧边栏 光标移至此处
-- 切换buffer
map("n", "<leader>l", ":bnext<CR>")
map("n", "<leader>h", ":bprevious<CR>")
-- 删除buffer
map("n", "<C-w>", ":bdelete %<CR>")                 -- 删除当前 buffer
map("n", "<leader>bl", ":BufferLineCloseRight<CR>") -- 所有 右侧 buffer
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>")  -- 所有 左侧 buffer
-- toggleterm
-- map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
-- map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
-- map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })
require "python.mappings"

-- map("n", "<leader>sv", "<C-w>v") -- 水平新增窗口，以 `<leader>` 键作为引导键，按下 `<leader>sv` 执行水平分割窗口操作
-- map("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口，按下 `<leader>sh` 执行垂直分割窗口操作
-- map("n", "<C-w>w", "<C-w>w") -- 切换到下一个窗口，循环切换各个窗口
-- map("n", "<C-w>p", "<C-w>p") -- 切换到上一个窗口，反向循环切换各个窗口
-- map("n", "<C-w>j", "<C-w>j") -- 切换到下方相邻窗口
-- map("n", "<C-w>k", "<C-w>k") -- 切换到上方相邻窗口
-- map("n", "<C-w>l", "<C-w>l") -- 切换到右侧相邻窗口
-- map("n", "<C-w>h", "<C-w>h") -- 切换到左侧相邻窗口
-- map("n", "<C-w>c", "<C-w>c") -- 关闭当前窗口
-- map("n", "<C-w>o", "<C-w>o") -- 关闭除当前窗口外的其他所有窗口
