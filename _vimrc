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

" Pythonインデント設定
filetype plugin on
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
filetype plugin on
autocmd FileType java setl autoindent
autocmd FileType java setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

" HTMLインデント設定
filetype plugin on
autocmd FileType html setl autoindent
autocmd FileType html setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

" ShellScriptインデント設定
filetype plugin on
autocmd FileType sh setl autoindent
autocmd FileType sh setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" NeoBundleの設定
set nocompatible               " Be iMproved
 filetype off                   " Required!

 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 "NeoBundle 'Shougo/neobundle.vim'

 " Recommended to install
 " After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
 NeoBundle 'Shougo/vimproc'

 " My Bundles here:
 "
 " Note: You don't set neobundle setting in .gvimrc!
 " Original repos on github
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'Lokaltog/vim-easymotion'
 NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 " vim-scripts repos
 NeoBundle 'L9'
 NeoBundle 'FuzzyFinder'
 NeoBundle 'rails.vim'
 " Non github repos
 NeoBundle 'git://git.wincent.com/command-t.git'
 " Non git repos
 NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
 " NeoComplCache
 NeoBundle 'https://github.com/Shougo/neocomplcache.git'
 " Vimfiler
 NeoBundle 'Shougo/vimfiler'
 " vim-powerline
 NeoBundle 'Lokaltog/vim-powerline'

 function! MyModified()
   return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
 endfunction

 function! MyReadonly()
   return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
 endfunction

 function! MyFilename()
   return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
         \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
         \  &ft == 'unite' ? unite#get_status_string() :
         \  &ft == 'vimshell' ? vimshell#get_status_string() :
         \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
         \ ('' != MyModified() ? ' ' . MyModified() : '')
 endfunction

 function! MyFugitive()
   try
     if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
       return fugitive#head()
     endif
   catch
   endtry
   return ''
 endfunction

 function! MyFileformat()
   return winwidth(0) > 70 ? &fileformat : ''
 endfunction

 function! MyFiletype()
   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
 endfunction

 function! MyFileencoding()
   return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
 endfunction

 function! MyMode()
   return winwidth(0) > 60 ? lightline#mode() : ''
 endfunction
 " ...

 filetype plugin indent on     " Required!

 "
 " Brief help
 " :NeoBundleList          - list configured bundles
 " :NeoBundleInstall(!)    - install(update) bundles
 " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

 " Installation check.
 if neobundle#exists_not_installed_bundles()
   echomsg 'Not installed bundles : ' .
         \ string(neobundle#get_not_installed_bundle_names())
   echomsg 'Please execute ":NeoBundleInstall" command.'
   "finish
 endif

"------ neocomplcacheの設定------
 " 補完ウィンドウの設定
set completeopt=menuone

" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_enable_camel_case_completion  =  1

" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 2

" ディクショナリ定義
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ }

if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" スニペットを展開する。スニペットが関係しないところでは行末まで削除
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"

" 前回行われた補完をキャンセルします
inoremap <expr><C-g> neocomplcache#undo_completion()

" 補完候補のなかから、共通する部分を補完します
inoremap <expr><C-l> neocomplcache#complete_common_string()

" 改行で補完ウィンドウを閉じる
"inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"

"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

" <C-h>や<BS>を押したときに確実にポップアップを削除します
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”

" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()

" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup()

" gtagsのキーバインド設定
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

