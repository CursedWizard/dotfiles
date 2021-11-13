local map = require('utils').map
local opts = {
  noremap = true,
  silent = true,
}

require'hop'.setup { keys = 'esoxqpdflzhckivuran' }


map('n', 's', [[:HopWord<cr>]], opts)
