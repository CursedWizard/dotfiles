
local map = require('utils').map
local opts = {
  noremap = true,
  silent = true,
}

local M = require('bufferline.pick');
local valid = "abcdefghijklmopqrstuvwxyz";

M.get = function (buf)
  local first_letter = string.lower(buf.filename:sub(1, 1))
  -- should only match alphanumeric characters
  local invalid_char = first_letter:match("[^%w]")

  if not M.current[first_letter] and not invalid_char then
    M.current[first_letter] = buf.id
    return first_letter
  end
  for letter in valid:gmatch(".") do
    if not M.current[letter] then
      M.current[letter] = buf.id
      return letter
    end
  end
end

require('bufferline').setup({
  options = {
    buffer_close_icon = '',
    modified_icon = '',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    enforce_regular_tabs = true,
    view = 'multiwindow',
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = 'thin',
  },
  highlights = {

    fill = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlineFill"
      },
    },
    background = {
      guifg = {
        attribute = "fg",
        highlight = "BufferlineBg"
      },
      guibg = {
        attribute = "bg",
        highlight = "BufferlineBg"
      }
    },
    -- Buffers
    buffer_selected = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlineBufferSelected"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferlineBufferSelected"
      },
      gui = "italic"
    },
    buffer_visible = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlineBufferVisible"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferlineBufferVisible"
      }
    },
    -- Modified
    modified = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlineModifiedVisible"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferlineModifiedVisible"
      },
    },
    modified_visible = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlineModifiedVisible"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferlineModifiedVisible"
      },
    },
    modified_selected = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlineModifiedSelected"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferlineModifiedSelected"
      }
    },
    close_button = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlineBg"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferlineBg"
      }
    },
    close_button_visible = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlineBg"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferlineBg"
      }
    },
    -- Separators
    separator = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlineSeperator"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferlineSeperator"
      }
    },
    separator_selected = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlineSeperatorSelected"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferlineSeperatorSelected"
      }
    },
    separator_visible = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlineSeperatorVisible"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferlineSeperatorVisible"
      }
    },

    tab_close = {
      guibg = {
        attribute = "bg",
        highlight = "BufferLineBg"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferLineBg"
      }
    },
    indicator_selected = {
      guibg = {
        attribute = "bg",
        highlight = "BufferLineIndicator"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferLineIndicator"
      }
    },
    -- Picks
    pick = {
      guibg = {
        attribute = "bg",
        highlight = "BufferlinePickVisible"
      },
      guifg = {
        attribute = "fg",
        highlight = "BufferlinePickVisible"
      },
      gui = "none"
    },
  }
})


map('n', '<C-c>', [[:BufferLinePickClose<CR>]], opts)
map('n', '<C-b>', [[:BufferLinePick<CR>]], opts)
-- map('n', '<S-x>', [[<Cmd>bdelete<CR>]], opts)
-- map('n', '<TAB>', [[<Cmd>BufferLineCycleNext<CR>]], opts)
-- map('n', '<S-TAB>', [[<Cmd>BufferLineCyclePrev<CR>]], opts)
