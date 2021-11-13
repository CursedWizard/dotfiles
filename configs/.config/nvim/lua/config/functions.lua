local M = {}
local cmd = vim.api.nvim_exec


-- Function for highlighting a selection on yank
-- cmd(
  -- [[
    -- au TextYankPost * silent! lua require("vim.highlight").on_yank({ higroup = 'IncSearch', timeout = 150 })
  -- ]],
  -- false
-- )
