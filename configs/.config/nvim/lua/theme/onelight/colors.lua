local util = require("theme.onelight.util")
local configModule = require("theme.onelight.config")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or configModule.config

  -- Color Palette
  ---@class ColorScheme
  local colors = {
    none = "NONE",
    light = '#f6f6f6',
    bg = "#fbfbfb",
    bg2 = "#F0F0F4",
    bg3 = "#E9E9E9",
    bg_visual = "#D9D9D9",
    border = "#646e82",
    light_grey = "#818387",
    bg_highlight = "#e9e9e9",
    fg = "#494b53",
    fg_light = "#0083be",
    fg_dark = "#526fff", -- user for: brackets
    fg_gutter = "#a3a3a3", -- used for comments
    dark5 = "#3b3c42", -- darker text, for emphasis
    blue = "#4078f2",
    cyan = "#0184bc",
    purple = "#a626a4",
    orange = "#c46010",
    yellow = "#c18401",
    yellow2 = "#986801",
    bg_yellow = "#c18401",
    green = "#50a14f",
    red = "#e45649",
    red1 = "#ca1243",
    git = { change = "#c18401", add = "#50a14f", delete = "#e45649", conflict = "#986801" },
    gitSigns = { change = "#986801", add = "#50a14f", delete = "#e45649" },
    diagnostics = {
      error = "#db4b4b",
      hint = "#30bfa3",
      info = "#c678dd",
      warn = "#d99b41",
    },
  }

  util.bg = colors.bg

  colors.diff = {
    add = util.darken(colors.git.add, 0.15),
    delete = util.darken(colors.git.delete, 0.15),
    change = util.darken(colors.git.change, 0.15),
    text = colors.fg_gutter,
  }

  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2),
  }

  colors.git.ignore = colors.fg_gutter
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.blue

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg2
  colors.bg_statusline = colors.bg2

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.darkSidebar and colors.bg2 or colors.bg
  colors.bg_sidebar = config.transparent and colors.none or colors.bg_sidebar
  colors.bg_float = config.darkFloat and colors.bg2 or colors.bg

  colors.bg_search = colors.red1
  colors.fg_search = colors.light
  colors.fg_sidebar = colors.fg_dark

  colors.error = util.darken(colors.red, 0.9)
  colors.warning = colors.diagnostics.warning
  colors.info = colors.diagnostics.info
  colors.hint = colors.diagnostics.hint

  util.color_overrides(colors, config)

  return colors
end

return M
