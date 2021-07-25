source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/keys.vim

call vundle#begin()
" let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

"{{ File management }}
    Plugin 'vifm/vifm.vim'                               " Vifm
    Plugin 'scrooloose/nerdtree'                         " Nerdtree
    Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plugin 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
    Plugin 'kevinhwang91/rnvimr', {'do': 'make sync'}    " Ranger Plugin

"{{ Syntax Highlighing and Theme }}
    Plugin 'vim-python/python-syntax'                    " Python highlighting
"    Plugin 'octol/vim-cpp-enhanced-highlight'
    Plugin 'itchyny/lightline.vim' "lightline stausbar
    "Themes"
    Plugin 'dracula/vim', { 'name': 'dracula' }
    Plugin 'wadackel/vim-dogrun'
    Plugin 'cocopon/iceberg.vim'
    Plugin 'joshdick/onedark.vim'
    Plugin 'arcticicestudio/nord-vim'
    Plugin 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }     "rgb colors
    Plugin 'mhinz/vim-startify' 			"startup dashboard
    Plugin 'junegunn/goyo.vim'        "goyo for centering txt

"{{ IDE Stuff }}
    Plugin 'neoclide/coc.nvim', {'branch': 'release'}
    Plugin 'liuchengxu/vim-which-key'
    Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plugin 'junegunn/fzf.vim'
    Plugin 'metakirby5/codi.vim'
    Plugin 'honza/vim-snippets'
    Plugin 'ap/vim-buftabline' "Lists Buffers as tabs
    Plugin 'justinmk/vim-sneak'

call vundle#end()            " required
source ~/.config/nvim/plugins_conf.d/pconfig.vim
