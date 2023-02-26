vim.cmd('syntax on')

local opt = vim.opt
local g = vim.g

-- g['python_host_prog'] = '~/.asdf/installs/python/2.7.18/bin/python'
-- g['python3_host_prog'] = '~/.asdf/installs/python/3.9.5/bin/python'


opt.completeopt = 'menuone,noselect'
opt.termguicolors = true
opt.wrap = false
opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.cul = false -- highlights the cursor line
opt.mouse = 'a'
opt.signcolumn = 'yes'
opt.cmdheight = 1
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = 400
opt.clipboard = 'unnamedplus'
opt.scrolloff = 8
opt.lazyredraw = false
opt.linebreak = true
opt.textwidth = 100
opt.wildmenu = true
opt.inccommand = 'nosplit'
opt.showmatch = true
opt.conceallevel = 0 -- Show `` in markdown files
-- use russian keyboard layout
opt.keymap = 'russian-jcukenwin'
opt.iminsert = 0

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- for indentline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

-- QuickScope
g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
g.qs_max_chars = 150

-- Airline
g['airline_powerline_fonts'] = 1
g['airline#extensions#whitespace#checks'] = {}
vim.o['termguicolors'] = true

g['airline#extensions#coc#enabled']=1
g['airline_section_warning']=""
g['airline_section_error']=""
g['airline#extensions#tabline#enabled']=1
g['airline#extensions#tabline#show_tab_type']=0
g['airline#extensions#tabline#switch_buffers_and_tabs']=1

g['move_key_modifier'] = 'C'
-- Rooter
g.rooter_patterns = {'^autoload', '.git', 'Makefile', '.gitignore'}
g.ranger_map_keys = 0

-- shortmess options
opt.shortmess:append('asI') --disable intro

-- disable tilde on end of buffer:
vim.cmd("let &fcs='eob: '")

