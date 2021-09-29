set fish_plugins theme peco
set fish_theme robbyrussell

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

# Determine OS platform
set UNAME (uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" = "linux" ]
   set -x DISTRO (awk -F= '/^NAME/{print $2}' /etc/os-release | sed s/'\"'//g)
end
set -e UNAME

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

# Homebrew
set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew";
set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH;

# cfn-guard
# set PATH ~/dev/readonly/cloudformation-guard/bin $PATH

# Go
# set PATH /usr/local/go/bin $PATH

# Jump
function __jump_add --on-variable PWD
  status --is-command-substitution; and return
  jump chdir
end

function __jump_hint
  set -l term (string replace -r '^j ' '' -- (commandline -cp))
  jump hint "$term"
end

function j
  set -l dir (jump cd "$argv")
  test -d "$dir"; and cd "$dir"
end

complete --command j --exclusive --arguments '(__jump_hint)'