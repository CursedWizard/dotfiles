
" let mapleader = "\<tab>"

vnoremap d "_c
nnoremap dd "_dd
nnoremap dw "_dw
nnoremap de "_de
nnoremap dl "_dl
nnoremap ` q

" to unmap tab basically
nnoremap <C-p> <C-i>

" source $HOME/.config/nvim/vim-config/coc.vim
source $HOME/.config/nvim/vim-config/fzf.vim
source $HOME/.config/nvim/vim-config/autoflake.vim
source $HOME/.config/nvim/vim-config/ranger.vim
source $HOME/.config/nvim/functions.vim
" set background=dark

" let g:airline_theme='base16_one_light'
" colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
lua require("init");


