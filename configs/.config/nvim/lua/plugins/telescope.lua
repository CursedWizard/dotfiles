local map = require('utils').map
local opts = {
  noremap = true,
  silent = true,
}

local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
    prompt_prefix = '🔍 ',
    layout_config = {
      prompt_position = 'bottom',
    },
    sorting_strategy = 'descending',
    file_ignore_patterns = { 'node_modules', '.git/', 'terraform.tfstate', '%.png', '%.ttf' },
  },
  pickers = {
    -- Your special builtin config goes in here
    buffers = {
      initial_mode = 'insert',
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
          -- Right hand side can also be the name of the action as a string
        },
        n = {
          ["<c-d>"] = actions.delete_buffer,
        }
      }
    },
  },
  extensions = {
    project = {
      base_dirs = {
        '~/dev',
      },
      hidden_files = true, -- default: false
      theme = "dropdown"
  }
}
})

map('n', '<space>n', [[:Telescope neoclip<CR>]], opts)
-- map('n', '<space>f', [[:Telescope find_files hidden=true<CR>]], opts)
-- map('n', '<space>b', [[:Telescope buffers <CR>]], opts)
-- map('n', '<space>l', [[:Telescope live_grep<CR>]], opts)
