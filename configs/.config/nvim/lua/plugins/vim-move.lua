local map = require('utils').map

vim.g['move_map_keys'] = 0


map('v', '<C-j>', [[<Plug>MoveBlockDown]], { noremap = false, silent = false })
map('v', '<C-k>', [[<Plug>MoveBlockUp]], { noremap = false, silent = false })
map('n', '<C-j>', [[<Plug>MoveLineDown]], { noremap = false, silent = false })
map('n', '<C-k>', [[<Plug>MoveLineUp]], { noremap = false, silent = false })

-- map('v', '<C-a>', [[<Plug>MoveBlockLeft]], { noremap = false, silent = false })
-- map('v', '<C-d>', [[<Plug>MoveBlockRight]], { noremap = false, silent = false })


