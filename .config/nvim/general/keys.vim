" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Remap ESC to kj and jk
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to next buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bNext<CR>

"kill a buffer
nnoremap <Leader>bd :bd<CR>

"Save a session with startify
nnoremap <Leader>ss :SSave<CR>
nnoremap <Leader>sl :SLoad<CR>

" Alt TAB in general mode will move to next tab
nnoremap <M-TAB> :tabnext<CR>
" Alt Shitf Tab will go back
" nnoremap <M-S-TAB> :tabNext<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :q<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"nnoremap <Leader>o o<Esc>^Da
"nnoremap <Leader>O O<Esc>^Da

" Copy and un highlight the search word
map <Leader>cp :.w !xsel -b<CR><CR>
map <Leader>H :set nohlsearch<CR>
map <Leader>h :set hlsearch<CR>

" change vertical to horizontal with -
noremap <c-w>-  <c-w>t<c-w>K
" change horizontal to vertical with |
noremap <c-w>\|  <c-w>t<c-w>H

" Map Capital S to Subtitude
nnoremap S :%s//g<LEFT><LEFT>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vifm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CHEAT SHEET
"zf#j creates a fold from the cursor down # lines.
"zf/ string creates a fold from the cursor to string .
"zj moves the cursor to the next fold.
"zk moves the cursor to the previous fold.
"za toggle a fold at the cursor.
"zo opens a fold at the cursor.
"zO opens all folds at the cursor.
"zc closes a fold under cursor.
"zm increases the foldlevel by one.
"zM closes all open folds.
"zr decreases the foldlevel by one.
"zR decreases the foldlevel to zero -- all folds will be open.
"zd deletes the fold at the cursor.
"zE deletes all folds.
"[z move to start of open fold.
"]z move to end of open fold.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>G :Goyo<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vin-sneak
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T
