require('config');
require('plugins');

local cmd = vim.cmd
local create_cmd = vim.api.nvim_create_user_command

create_cmd('PackerInstall', function()
  cmd [[packadd packer.nvim]]
  require('plugins').install()
end, {})
create_cmd('PackerUpdate', function()
  cmd [[packadd packer.nvim]]
  require('plugins').update()
end, {})
create_cmd('PackerSync', function()
  cmd [[packadd packer.nvim]]
  require('plugins').sync()
end, {})
create_cmd('PackerClean', function()
  cmd [[packadd packer.nvim]]
  require('plugins').clean()
end, {})
create_cmd('PackerCompile', function()
  cmd [[packadd packer.nvim]]
  require('plugins').compile()
end, {})

vim.o.background = "dark"

-- vim.cmd.colorscheme "catppuccin-macchiato"
-- vim.cmd.colorscheme "tokyonight-storm"
-- vim.cmd.colorscheme "onelight"
require('theme.onelight').setup()
-- local c = require('onedark.palette')
-- vim.o.background='dark'
-- require('onedark').setup {
--     style = 'warmer',
--     -- highlights = {
--     --   ["@constructor"] = {fg = c.light.red, fmt = "none"},
--     --   ["@property"] = {fg = c.light.cyan},
--     --   ["@parameter"] = {fg = c.light.red},
--     --   ["@variable.builtin"] = {fg = c.light.cyan},
--     --   ["@punctuation.special"] = {fg = c.light.cyan},
--     --   -- Component props
--     --   ["@tag"] = {fg = c.light.cyan,},
--     -- BufferLineFill = { bg = c.bg1 },
--     -- BufferlineBufferVisible = {  bg = c.bg1, fg = c.fg, },
--     -- BufferlineModifiedVisible = { bg = c.bg1, fg = c.green },
--     -- }
-- }
-- require('onedark').load()
