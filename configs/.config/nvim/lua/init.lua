require('config');
require('plugins');

require('theme.onelight').setup()
-- vim.o.background='light'
-- require('onedark').setup {
--     style = 'light',
--     colors = {
--       bg0 = "#fbfbfb",
--   },
--     highlights = {
--       ["@constructor"] = {fg = c.light.red, fmt = "none"},
--       ["@property"] = {fg = c.light.cyan},
--       ["@parameter"] = {fg = c.light.red},
--       ["@variable.builtin"] = {fg = c.light.cyan},
--       ["@punctuation.special"] = {fg = c.light.cyan},
--       -- Component props
--       ["@tag"] = {fg = c.light.cyan,}
--     }
-- }
-- require('onedark').load()
