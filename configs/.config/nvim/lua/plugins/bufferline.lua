
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
      bg = {
        attribute = "bg",
        highlight = "BufferlineFill"
      },
    },
    background = {
      fg = {
        attribute = "fg",
        highlight = "BufferlineBg"
      },
      bg = {
        attribute = "bg",
        highlight = "BufferlineBg"
      }
    },
    -- Buffers
    buffer_selected = {
      bg = {
        attribute = "bg",
        highlight = "BufferlineBufferSelected"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferlineBufferSelected"
      },
      italic = true
    },
    buffer_visible = {
      bg = {
        attribute = "bg",
        highlight = "BufferlineBufferVisible"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferlineBufferVisible"
      }
    },
    -- Modified
    modified = {
      bg = {
        attribute = "bg",
        highlight = "BufferlineModifiedVisible"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferlineModifiedVisible"
      },
    },
    modified_visible = {
      bg = {
        attribute = "bg",
        highlight = "BufferlineModifiedVisible"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferlineModifiedVisible"
      },
    },
    modified_selected = {
      bg = {
        attribute = "bg",
        highlight = "BufferlineModifiedSelected"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferlineModifiedSelected"
      }
    },
    close_button = {
      bg = {
        attribute = "bg",
        highlight = "BufferlineBg"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferlineBg"
      }
    },
    close_button_visible = {
      bg = {
        attribute = "bg",
        highlight = "BufferlineBg"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferlineBg"
      }
    },
    -- Separators
    separator = {
      bg = {
        attribute = "bg",
        highlight = "BufferlineSeperator"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferlineSeperator"
      }
    },
    separator_selected = {
      bg = {
        attribute = "bg",
        highlight = "BufferlineSeperatorSelected"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferlineSeperatorSelected"
      }
    },
    separator_visible = {
      bg = {
        attribute = "bg",
        highlight = "BufferlineSeperatorVisible"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferlineSeperatorVisible"
      }
    },

    tab_close = {
      bg = {
        attribute = "bg",
        highlight = "BufferLineBg"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferLineBg"
      }
    },
    indicator_selected = {
      bg = {
        attribute = "bg",
        highlight = "BufferLineIndicator"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferLineIndicator"
      }
    },
    -- Picks
    pick = {
      bg = {
        attribute = "bg",
        highlight = "BufferlinePickVisible"
      },
      fg = {
        attribute = "fg",
        highlight = "BufferlinePickVisible"
      },
    },
  }
})


map('n', '<C-c>', [[:BufferLinePickClose<CR>]], opts)
map('n', '<C-b>', [[:BufferLinePick<CR>]], opts)
-- map('n', '<S-x>', [[<Cmd>bdelete<CR>]], opts)
-- map('n', '<TAB>', [[<Cmd>BufferLineCycleNext<CR>]], opts)
-- map('n', '<S-TAB>', [[<Cmd>BufferLineCyclePrev<CR>]], opts)
