set nocompatible              " be iMproved, required
set exrc
set noswapfile
set nobackup
set encoding=utf-8
set clipboard=unnamedplus
set incsearch
set noshowmode
set rnu
set termguicolors

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Fancy status bars
Plugin 'vim-airline/vim-airline'
" Syntax highlighting theme
Plugin 'morhetz/gruvbox'
" Syntax checking/linting (not enabled)
Plugin 'vim-syntastic/syntastic'
" Autocomplete engine for Neovim
Plugin 'Shougo/deoplete.nvim'
" Python static analysis and completion (needed by deoplete)
Plugin 'davidhalter/jedi'
Plugin 'deoplete-plugins/deoplete-jedi'
" Binds vim's various completion contexts to your tab key
Plugin 'ajh17/VimCompletesMe'
" Language specific plugins here
Plugin 'hashivim/vim-terraform'
" file browser
Plugin 'preservim/nerdtree'
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
syntax on
colorscheme gruvbox

set nocompatible
" Make copy and paste work with the system clipboard
set clipboard=unnamed
" The width of a TAB is set to 4.  Still it is a \t.
" It is just that Vim will interpret it to be having
" a width of 4.
set tabstop=4
" Indents will have a width of 4
set shiftwidth=4
" Sets the number of columns for a TAB
set softtabstop=4
" Expand TABs to spaces
set expandtab
" Hybrid relative line numbers
set relativenumber number
" Deoplete
let g:deoplete#enable_at_startup = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" key maps
let mapleader = ','
"nnoremap <leader>fj
" Quick window switch when in terminal mode
tnoremap <leader>h <C-\><C-N><C-w>h
tnoremap <leader>j <C-\><C-N><C-w>j
tnoremap <leader>k <C-\><C-N><C-w>k
tnoremap <leader>l <C-\><C-N><C-w>l
inoremap <leader>h <C-\><C-N><C-w>h
inoremap <leader>j <C-\><C-N><C-w>j
inoremap <leader>k <C-\><C-N><C-w>k
inoremap <leader>l <C-\><C-N><C-w>l
" Quick window switch
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

noremap <leader>n :NERDTreeToggle<CR>

" functions
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" Strip trailing whitepsace on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

