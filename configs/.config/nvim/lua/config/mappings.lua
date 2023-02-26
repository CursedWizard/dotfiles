--
-- General mappings
--

local map = require('utils').map

local g = vim.g
g.mapleader = " "

local opts = {
  noremap = true,
  silent = true,
}

-- map('n', "<space>s", "<cmd>lua require('substitute.range').word()<cr>", opts)

-- Dont leave visual mode when indenting
map('v', '<', [[<gv]])
map('v', '>', [[>gv]])


-- change keyboard layout
map('i', '<C-z>', [[<C-^>]])

-- Navigating between buffers
map('n', '<C-l>', [[:bnext<CR>]])
map('n', '<C-h>', [[:bprevious<CR>]])

-- map('n', '<leader>p', [[:CocCommand prettier.formatFile<CR>]], opts)
map('n', '<leader>p', [[:CocCommand eslint.executeAutofix<CR>]], opts)

-- Fugitive
map('n', '<leader>go', [[:G<CR>]], opts)
map('n', '<leader>gl', [[:Git log<CR>]], opts)
map('n', '<leader>gc', [[:Git commit<CR>]], opts)

map('n', '<Bslash>pf', [[:Autoflake --remove-all-unused-imports<CR>]], opts)


-- Edit snippets file
-- @reference: https://github.com/neoclide/coc-snippets
map('n', '\\se', [[:CocCommand snippets.editSnippets<CR>]], opts)

-- Window manipulation
map('n', '<Tab>i', [[<C-w>c]], opts)
map('n', '<Tab>o', [[<C-w>o]], opts)
map('n', '<Tab>j', [[<C-w>j]], opts)
map('n', '<Tab>k', [[<C-w>k]], opts)
map('n', '<Tab>l', [[:call WinMove('l')<CR>]])
map('n', '<Tab>h', [[:call WinMove('h')<CR>]])

map('n', '<Space>', [[<Nop>]], opts)

-- Yank to end of line
map('n', 'Y', 'y$', opts)

-- Update the file
map('n', '<leader>e', [[:e<CR>]], opts)

-- Escape to clear highlighting in normal mode
map('n', '<Esc>', [[:nohlsearch<CR>]], opts)

-- Macros
-- Run macro over selected rows using @
map('x', '@', [[:<C-u>call ExecuteMacroOverVisualRange()<CR>]], opts)

-- Movement
-- Move to end of line
map('n', 'L', [[$]], opts)
map('v', 'L', [[$]], opts)
map('o', 'L', [[$]], opts)

-- Move to start of line
map('n', 'H', [[^]], opts)
map('v', 'H', [[^]], opts)
map('o', 'H', [[^]], opts)

vim.keymap.set("n", "<Space>R", [[:RnvimrToggle<CR>]], { noremap = true, silent = true })

