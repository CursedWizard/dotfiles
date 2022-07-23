local npairs = require("nvim-autopairs")

-- change default fast_wrap
npairs.setup({
  disable_filetype = { 'TelescopePrompt' },
  check_ts = true,
  map_cr = false,
  enable_check_bracket_line = true,
  fast_wrap = {},
  ts_config = {
    lua = {'string'},-- it will not add a pair on that treesitter node
    javascript = {'template_string'},
    java = false,-- don't check treesitter on java
  }
})
