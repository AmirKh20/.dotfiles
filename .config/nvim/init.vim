set runtimepath^=~/.vim runtimepath+=~/.vim/after,/usr/share/vim/vimfiles
let &packpath = &runtimepath
source ~/.vimrc

"map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>

"map vertical split terminal to Space T
noremap <Leader>t :vsplit term://zsh<CR>
