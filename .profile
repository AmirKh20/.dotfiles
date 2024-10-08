#export nvim as default editor
export VISUAL=nvim
export EDITOR=$VISUAL

export VIDEOPLAYER="mpv"
export BROWSER="brave"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export TERMINAL="st"
export QT_QPA_PLATFORMTHEME=qt5ct
export TDESKTOP_USE_GTK_FILE_DIALOG=1
#export LD_PRELOAD="/usr/lib/libtsocks.so" # tunnel the whole system with tsocks
#export LD_PRELOAD="/usr/lib/libproxychains4.so" #tunnel the whole system with proxychains

#Manpager
## "bat" as manpager
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"

## Less as manpager
export MANPAGER=less

### "nvim" as manpager
#export MANPAGER="nvim -c 'set ft=man' -"

## "vim" as manpager
#export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# export .local/bin to PATH
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/bin/scripts:$HOME/.local/share/gem/ruby/3.0.0/bin"
export npm_config_prefix="$HOME/.local"
