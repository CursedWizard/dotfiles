
" let mapleader = "\<tab>"

vnoremap d "_c
nnoremap dd "_dd
nnoremap dw "_dw
nnoremap de "_de
nnoremap dl "_dl
nnoremap ` q

" to unmap tab basically
nnoremap <C-p> <C-i>


source /home/funtik/.config/nvim/vim-config/coc.vim
source /home/funtik/.config/nvim/vim-config/fzf.vim
source /home/funtik/.config/nvim/functions.vim


let g:airline_theme='base16_one_light'
lua require("init");
