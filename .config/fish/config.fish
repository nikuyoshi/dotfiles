set fish_plugins theme peco
set fish_theme robbyrussell

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

alias start=/mnt/c/Windows/explorer.exe

# macOS settings
# alias vim="mvim -v"

# Ubuntu settings
command /usr/bin/keychain $HOME/.ssh/id_rsa
eval (keychain --eval --agents ssh id_rsa | source)
