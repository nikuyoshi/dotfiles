set fish_plugins theme peco
set fish_theme robbyrussell

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

# Determine OS platform
set UNAME (uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" = "linux" ]
   set DISTRO (awk -F= '/^NAME/{print $2}' /etc/os-release | sed s/'\"'//g)
end
set -e UNAME
export $DISTRO

switch $DISTRO
  case Darwin
    alias vim="mvim -v"
  case Ubuntu
     command /usr/bin/keychain $HOME/.ssh/id_rsa
     eval (keychain --eval --agents ssh id_rsa | source)
     alias start=/mnt/c/Windows/explorer.exe
  case Amazon Linux
end

set PATH ~/.local/bin $PATH

# cfn-guard
set PATH ~/dev/readonly/cloudformation-guard/bin $PATH

# Go
set PATH /usr/local/go/bin $PATH
