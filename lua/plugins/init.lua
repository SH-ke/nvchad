local plugins = {
  -- require "python.plugins",
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
}

-- 定义添加插件的函数
local function add_plugins(newPlugins)
    for _, plugin in ipairs(newPlugins) do
        table.insert(plugins, plugin)
    end
    return plugins
end

-- add python plugins
local py_plug = require('python.plugins')
add_plugins(py_plug)

-- add cpp plugins
local c_plug = require('cpp.plugins')
add_plugins(c_plug)

-- local opts = plugins[#plugins-2].opts
-- -- 打印 ensure_installed 列表内容
-- print(vim.inspect(opts.ensure_installed))
-- -- 构建 :MasonInstall 命令并执行
-- local install_cmd = "MasonInstall " .. table.concat(opts.ensure_installed, " ")
-- print(vim.inspect(install_cmd))
-- vim.cmd(install_cmd)

return plugins
