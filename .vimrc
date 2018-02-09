" Setup Vundle
  set nocompatible
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  " Install plugins:
  call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    " Git wrapper
    Plugin 'tpope/vim-fugitive'
    " File navigation
    Plugin 'git://git.wincent.com/command-t.git'
    Plugin 'scrooloose/nerdtree.git'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    " Autocomplete
    Plugin 'valloric/youcompleteme'
    " Better statusbar
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes' 
    " Multicursor
    Plugin 'terryma/vim-multiple-cursors'
    " Themes
    Plugin 'jnurmine/Zenburn'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'gosukiwi/vim-atom-dark' 
    Plugin 'morhetz/gruvbox'
    " Python specific
    Plugin 'tmhedberg/simpylfold'
  call vundle#end()
  filetype plugin indent on

" Timeouts for visual mode exit
  set timeoutlen=1000
  set ttimeoutlen=50


" Colouring and line numbers
  syntax enable
  set background=dark
  colo gruvbox
  set t_Co=256
  set number
  set relativenumber


" Set folding settings
  set foldmethod=indent
  set foldlevelstart=5
  nnoremap <F9> za
  inoremap <F9> <C-o>za


" Set indent settings
  filetype indent plugin on
  set shiftround
  set expandtab
  set shiftwidth=4
  set softtabstop=4
  set tabstop=8
  filetype indent on


" Keyboard shortcuts
  " Keyboard shortcuts: General settings
  let mapleader = "-"
  let maplocalleader = "\\"
  nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  nnoremap <leader>ov :source $MYVIMRC<cr>

  " Keyboard shortcuts: <Esc>
  inoremap jk <esc>
  inoremap jj <esc>

  " Keyboard shortcuts: File tree
  nnoremap <leader>t :NERDTree<return>
  nnoremap <C-t> :CommandT<return>

  " Keyboard shortcuts: Surround text
  " Single words
    nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel  " Surround by parantheses
    nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel  " Surround by square brackets
    nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel  " Surround by curly brackets
    nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel  " Surround by single quotes
    nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel  " Surround by double quotes
    nnoremap <leader>* viw<esc>a*<esc>bi*<esc>lel  " Surround by asterixes
    nnoremap <leader>_ viw<esc>a_<esc>bi_<esc>lel  " Surround by asterixes
  " Marked text
    vnoremap <leader>( <esc>`<i(<esc>`>i)<esc>  " Surround by parantheses
    vnoremap <leader>[ <esc>`<i[<esc>`>i]<esc>  " Surround by square brackets
    vnoremap <leader>{ <esc>`<i{<esc>`>i}<esc>  " Surround by curly brackets
    vnoremap <leader>' <esc>`<i'<esc>`>i'<esc>  " Surround by single quotes
    vnoremap <leader>" <esc>`<i"<esc>`>i"<esc>  " Surround by double quotes
    vnoremap <leader>* <esc>`<i*<esc>`>i*<esc>  " Surround by asterixes
    vnoremap <leader>_ <esc>`<i_<esc>`>i_<esc>  " Surround by underscores
  

" Code templates
  augroup templates
      autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
  augroup END


" Python specific
  augroup python_snippets
    autocmd FileType python :let &colorcolumn=join(range(82,999),",")
    autocmd FileType python :nnoremap <leader>r :!python<space>$@%<return>
  augroup END

" C++ specific
  augroup cpp_specific
    autocmd FileType cpp let &colorcolumn=join(range(82,999),",")
    autocmd FileType cpp nnoremap <leader>r :w<CR>:!g++ $@% -std=c++11 -llapack -lblas -larmadillo -o $@%:r && ./$@%:r<RETURN>
  augroup END

" .vimrc specific
  augroup vimrc
    autocmd BufNewFile .vimrc set shiftwidth=2
    autocmd BufNewFile .vimrc set softtabstop=2 
    autocmd BufRead .vimrc set shiftwidth=2
    autocmd BufRead .vimrc set softtabstop=2 
  augroup END


" Setup YouCompleteMe
  let g:ycm_python_binary_path = 'python'
  

" Setup vim-airline
  let g:airline_powerline_fonts = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.space = "\ua0"
  let g:airline#extensions#tabline#enabled = 0 
  let g:airline#extensions#tabline#show_buffers = 1 
  let g:airline_theme = 'base16'
  set laststatus=2
  

