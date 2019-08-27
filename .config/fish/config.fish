set fish_plugins theme peco
alias vim="mvim -v"

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end
