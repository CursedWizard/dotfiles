local util = require("theme.onelight.util")
local theme = require("theme.onelight.theme")
local configModule = require("theme.onelight.config")

local function setup(userConfig)
  -- Warning, If config set inside 'vim.g'
  if configModule.vimConfig then
    vim.schedule(function()
      vim.api.nvim_err_writeln(
        [[monsonjeremy/onedark: onedark will stop supporting vimscript soon, change your config to lua or wrap it around lua << EOF ... EOF]]) -- luacheck: ignore
    end)
  end

  -- Applying user configuration
  if userConfig then configModule.applyConfiguration(userConfig) end

  -- Load colorscheme
  util.load(theme.setup(configModule.config))
end

return { setup = setup }
