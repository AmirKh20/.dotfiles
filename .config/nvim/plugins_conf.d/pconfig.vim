filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line and colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }
colorscheme onedark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hexokinase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All possible highlighters
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
"\   'virtual',
"\   'sign_column',
"\   'background',
"\   'backgroundfull',
"\   'foreground',
"\   'foregroundfull'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ranger {rnvimr}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
nmap <space>r :RnvimrToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'a': '~/.config/awesome/rc.lua' },
            \ { 'n': '~/.config/nvim/' },
            \ { 'z': '~/.zshrc' },
            \ { 'v': '~/.vimrc' },
            \ '~/.config/alacritty/alacritty.yml',
            \ '~/.config',
            \ ]
"If this option is enabled and you start Vim in a directory that contains a
"`Session.vim`, that session will be loaded automatically. Otherwise it will be
"shown as the top entry in the Startify buffer.
let g:startify_session_autoload = 1

"Delete all buffers when loading or closing a session
let g:startify_session_delete_buffers = 1

"Automatically Update Sessions
let g:startify_session_persistence = 1

"Get rid of empy buffer and quit
let g:startify_enable_special = 0

"Custom Header
"let g:startify_custom_header =
"    \ startify#pad(split(system('~/MyProjects/Scripts/504Words/504Words.sh'), '\n'))

"let g:startify_custom_header = [
"        \ '   _  __     _     ',
"        \ '  / |/ /  __(_)_ _ ',
"        \ ' /    / |/ / /  ` \',
"        \ '/_/|_/|___/_/_/_/_/',
"        \]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Which Key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['r'] = [ ':Ranger'                    , 'ranger' ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Sneak
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1

" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" remap so I can use , and ; with f and t
map gS <Plug>Sneak_,
map gs <Plug>Sneak_;

" Change the colors
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" Cool prompts
" let g:sneak#prompt = '🕵'
let g:sneak#prompt = '🔎'
