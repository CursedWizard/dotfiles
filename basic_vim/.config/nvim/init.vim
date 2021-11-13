call plug#begin('~/.config/nvim/autoload/plugged')
    "Git integration
    " Plug 'tpope/vim-fugitive'

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    Plug 'potatoesmaster/i3-vim-syntax'

    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'

    " Useful tools
    Plug 'jiangmiao/auto-pairs' " Auto pairs for '(' '[' '{'
    Plug 'tpope/vim-commentary' "comment stuff out using gcc
    " Plug 'xuhdev/vim-latex-live-preview'
    " Plug 'scrooloose/nerdtree' "filesystem in vim

    Plug 'ap/vim-buftabline' "Open buffers in new tabs
    " Plug 'mhinz/vim-startify' "provides a start screen
    " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Plug 'junegunn/fzf.vim'
    " Plug 'airblade/vim-rooter'

    " Appearence
    " Plug 'ryanoasis/vim-devicons' "icons for nerdtree
    Plug 'rakr/vim-one' "default theme, has light and dark version
    Plug 'vim-airline/vim-airline' "theme at the bottom
    Plug 'vim-airline/vim-airline-themes'
    Plug 'gcmt/taboo.vim'
    Plug 'kyazdani42/nvim-web-devicons'

    " Better navigation
    " Plug 'justinmk/vim-sneak' "find word on the line
    " Plug 'unblevable/quick-scope' "switch to word seen on screen, usin s or S

call plug#end()

" Setting theme
set background=light " for the light version
colorscheme one

""" AIRLINE SPECIFIC
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline_powerline_fonts = 1
set termguicolors
let g:airline#extensions#whitespace#checks =
    \  []
let g:airline#extensions#coc#enabled=1
let g:airline_section_warning=""
let g:airline_section_error=""
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tabline#switch_buffers_and_tabs=1

""" REMAPS
nnoremap <silent> <space>r :RnvimrToggle<CR>
set clipboard=unnamedplus
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " mirror indent from the previous line


