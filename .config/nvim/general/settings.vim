" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number relativenumber               " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
"set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set clipboard=unnamedplus               " Copy paste between vim and everything else
"set autochdir                           " Your working directory will always be the same as your working directory
let g:rehash256 = 1
set path+=**					                   " Searches current directory recursively.
set wildmenu					                   " Display all matches when tab complete.
"set hlsearch                             " Highting for search terms
set nohlsearch
set ic                                   " Ignore case sensetive search

set foldenable                           " Setting for folding
autocmd FileType c,cpp,h,hpp,py,lua,sh setlocal foldmethod=syntax   " Setting for folding

set nocompatible              " be iMproved, required Vundle Settings
filetype off                  " required              Vundle Settings
                              " set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

autocmd BufWritePost $MYVIMRC source %      " auto source when writing to init.vim alternatively you can run :source $MYVIMRC

" Auto Delete all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" You can't stop me
" cmap w!! w !sudo tee %

" Change Cursor line when inside insert mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Auto compile config.h
autocmd BufWritePost config.h !st -e bash -c 'sudo make install && read key'

" Auto Syntax Highlighting for ~/.xinitrc and ~/.xprofile
autocmd BufRead ~/.xinitrc,~/.xprofile set filetype=sh
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 highlight Normal           guifg=#dfdfdf ctermfg=15   guibg=#282c34 ctermbg=none  cterm=none
 highlight LineNr           guifg=#5b6268 ctermfg=8    guibg=#282c34 ctermbg=none  cterm=none
 highlight CursorLineNr     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
 highlight VertSplit        guifg=#1c1f24 ctermfg=0    guifg=#5b6268 ctermbg=8     cterm=none
 " highlight Statement        guifg=#98be65 ctermfg=2    guibg=none    ctermbg=none  cterm=none
 " highlight Directory        guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
 highlight StatusLine       guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
 highlight StatusLineNC     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
 highlight NERDTreeClosable guifg=#98be65 ctermfg=2
 highlight NERDTreeOpenable guifg=#5b6268 ctermfg=8
 " highlight Comment          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=italic
 " highlight Constant         guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
 " highlight Special          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
 " highlight Identifier       guifg=#5699af ctermfg=6    guibg=none    ctermbg=none  cterm=none
 "highlight PreProc          guifg=#c678dd ctermfg=5    guibg=none    ctermbg=none  cterm=none
 "highlight String           guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
 "highlight Number           guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
 "highlight Function         guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
 highlight Visual           guifg=#dfdfdf ctermfg=1    guibg=#1c1f24 ctermbg=none  cterm=none
 highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
 highlight Folded           ctermfg=103     ctermbg=234     cterm=none
 highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
 highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
 highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
 highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
 highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
 highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
 highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
 highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
 highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
 highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
 highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
 highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
 highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
 highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
 highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
 highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
 highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
 highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
 highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
 highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
 highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
 highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
 highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
 highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none

let g:python_highlight_all = 1
set termguicolors

" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END
