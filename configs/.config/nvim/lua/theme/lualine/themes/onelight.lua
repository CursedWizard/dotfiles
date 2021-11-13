local configModule = require("theme.onelight.config")
local colors = require("theme.onelight.colors").setup(configModule.config)

local colors = {
  blue   = colors.blue,
  green  = colors.green,
  purple = colors.purple,
  red1   = colors.red,
  red2   = colors.red1,
  yellow = colors.yellow,
  fg     = colors.fg,
  bg     = colors.light,
  gray1  = colors.fg,
  gray2  =  colors.bg2,
  gray3  = colors.bg_visual,
}

return {
  normal = {
    a = {fg = colors.bg, bg = colors.green, gui = 'bold'},
    b = {fg = colors.fg, bg = colors.gray3},
    c = {fg = colors.fg, bg = colors.gray2}
  },
  insert = {a = {fg = colors.bg, bg = colors.blue, gui = 'bold'}},
  visual = {a = {fg = colors.bg, bg = colors.purple, gui = 'bold'}},
  replace = {a = {fg = colors.bg, bg = colors.red1, gui = 'bold'}},
  inactive = {
    a = {fg = colors.bg, bg = colors.gray3, gui = 'bold'},
    b = {fg = colors.bg, bg = colors.gray3},
    c = {fg = colors.gray3, bg = colors.gray2}
  }

}
