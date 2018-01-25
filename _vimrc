"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (nonumber:非表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title

"---------------------------------------------------------------------------
" コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

"---------------------------------------------------------------------------
" KaoriYaでバンドルしているプラグインのための設定

" autofmt: 日本語文章のフォーマット(折り返し)プラグイン.
set formatexpr=autofmt#japanese#formatexpr()

" Copyright (C) 2011 KaoriYa/MURAOKA Taro

"--------------------------nikuyoshi固有の設定-------------------------------
" colorschemeの設定
colorscheme molokai
syntax on
let g:molokai_original = 1
set t_Co=256

" 補完メニューの色を変更する
highlight Pmenu ctermbg = 4
highlight PmenuSel ctermbg = 1
highlight PmenuSbar ctermbg = 4
set clipboard=unnamed

" カーソル行のハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/ /ge


filetype plugin on

" Pythonインデント設定
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Execute python script C-P
function! s:ExecPy()
    exe "!" . &ft . " %"
    :endfunction
    command! Exec call <SID>ExecPy()
    autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>

" Javaインデント設定
autocmd FileType java setl autoindent expandtab tabstop=4 shiftwidth=4 softtabstop=4

" HTMLインデント設定
autocmd FileType html setl autoindent expandtab tabstop=4 shiftwidth=4 softtabstop=4

" ShellScriptインデント設定
autocmd FileType sh setl autoindent expandtab tabstop=2 shiftwidth=2 softtabstop=2

" YAMLインデント設定
autocmd FileType yaml setl autoindent expandtab tabstop=2 shiftwidth=2 softtabstop=2
