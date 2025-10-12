require "nvchad.mappings"

local map = vim.keymap.set
vim.g.mapleader = " "

-- 进入命令模式
map("n", ";", ":", { desc = "CMD enter command mode" })

-- 插入模式
map("i", "jk", "<ESC>")
map("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save file" })

-- 可视模式：移动选中行
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- 窗口管理
map("n", "<leader>sv", "<C-w>v", { desc = "Vertical split" })
map("n", "<leader>sh", "<C-w>s", { desc = "Horizontal split" })
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear highlights" })

-- buffer 管理
map("n", "<leader>l", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>h", ":bprevious<CR>", { desc = "Prev buffer" })
map("n", "<leader>bd", ":bdelete %<CR>", { desc = "Delete buffer" })
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", { desc = "Close right buffers" })
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", { desc = "Close left buffers" })

-- 文件树（用 <leader>e 替代 <leader>t 避免冲突）
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
map("n", "<leader>ef", ":NvimTreeFocus<CR>", { desc = "Focus file tree" })

-- 其他
-- map("n", "<leader>py", '<cmd>TermExec cmd="python %"<cr>', { desc = "Run Python file" })

require "plugins.lang.python.mappings"
