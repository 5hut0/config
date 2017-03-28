"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|

" ==============================================================================
"        _                       _
" __   _(_)_ __ ___        _ __ | |_   _  __ _
" \ \ / / | '_ ` _ \ _____| '_ \| | | | |/ _` |
"  \ V /| | | | | | |_____| |_) | | |_| | (_| |
"   \_/ |_|_| |_| |_|     | .__/|_|\__,_|\__, |
"                         |_|            |___/
" ==============================================================================
if has('vim_starting')
  set rtp+=~/.config/nvim/plugged/vim-plug
  if !isdirectory(expand('~/.config/nvim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.config/nvim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.config/nvim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.config/nvim/plugged')
" quick run
Plug 'thinca/vim-quickrun'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Files and Buffers
Plug 'justinmk/vim-dirvish'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/ctrlp-funky'
Plug 'mattn/ctrlp-filer'
Plug 'sgur/ctrlp-extensions.vim'

" Search and replace
Plug 'rking/ag.vim'
Plug 'thinca/vim-qfreplace'

" Editing
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'Shougo/context_filetype.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-expand-region'
Plug 'coderifous/textobj-word-column.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'cohama/lexima.vim'
Plug 'sk1418/HowMuch'

" Auto Complete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer --gocode-completer' }
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" Signature
Plug 'kshenoy/vim-signature'

" Comment out
Plug 'tyru/caw.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" C / C++
Plug 'vim-scripts/a.vim' , { 'for': ['c','cpp'] }
" Plug 'octol/vim-cpp-enhanced-highlight' , { 'for': ['c','cpp'] }

if has('nvim')
  " Plug 'bbchung/Clamp' , { 'for': ['c','cpp'] }
  Plug 'arakashic/chromatica.nvim' , { 'for': ['c','cpp'] }
else
  Plug 'jeaye/color_coded' , { 'for': ['c','cpp'],'do': 'cmake . && make && make install'}
  " Plug 'bbchung/clighter' , { 'for': ['c','cpp'] }
  " Plug 'bbchung/clighter8'
endif

if executable('uncrustify')
  Plug 'ompugao/uncrustify-vim' , { 'for': ['c','cpp'] }
endif

" HTML, CSS, JS
Plug 'elzr/vim-json'  , { 'for': ['json'] }
Plug 'othree/html5.vim'  , { 'for': ['html'] }
Plug 'hail2u/vim-css3-syntax' , { 'for': ['css'] }
Plug 'pangloss/vim-javascript' , { 'for': ['javascript'] }
Plug 'othree/yajs.vim' , { 'for': ['javascript'] }
Plug 'ryym/vim-riot' , { 'for': ['javascript'] }
Plug 'othree/es.next.syntax.vim' , { 'for': ['javascript'] }
Plug 'maksimr/vim-jsbeautify', { 'do': 'npm install -g js-beautify' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'stylus','javascript'] }
Plug 'kchmck/vim-coffee-script' , { 'for': ['coffee'] }
Plug 'leafgarland/typescript-vim' , { 'for': ['typescript'] }
Plug 'wavded/vim-stylus' , { 'for': ['stylus'] }
Plug 'digitaltoad/vim-pug' , { 'for': ['pug', 'jade'] }

" linter
Plug 'neomake/neomake'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Color Scheme
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'

call plug#end()

" ==============================================================================
"  _____    _ _ _               ____       _   _   _
" | ____|__| (_) |_ ___  _ __  / ___|  ___| |_| |_(_)_ __   __ _
" |  _| / _` | | __/ _ \| '__| \___ \ / _ \ __| __| | '_ \ / _` |
" | |__| (_| | | || (_) | |     ___) |  __/ |_| |_| | | | | (_| |
" |_____\__,_|_|\__\___/|_|    |____/ \___|\__|\__|_|_| |_|\__, |
"                                                          |___/
" ==============================================================================

" ==============================================================================
" PATH
" ==============================================================================
set path+=/usr/local/include
set path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include
set path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
set path+=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include
set path+=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks
set path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1
set path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
set path+=/Applications/JUCE/modules
set path+=~/SDKs/link/include
set path+=~/SDKs/link/modules/asio-standalone/asio/include

" ==============================================================================
" COMMON
" ==============================================================================
scriptencoding utf-8
filetype plugin indent on
autocmd!
if has("multi_lang")
  language C
endif

set nocompatible    " use vim
set vb t_vb=        " ビープ音を消す
set novisualbell    " ビープ音を消す
set t_Co=256
set mouse=a         " マウスモード有効
set timeout ttimeout timeoutlen=500 ttimeoutlen=100

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste


" ==============================================================================
" CLIP BOARD
" ==============================================================================
" if has('nvim')
" else
"   " set clipboard=unnamed
" endif

if has('nvim')
  set clipboard=unnamedplus
else
  " set clipboard=unnamed,autoselect
  set clipboard=unnamed
endif

" ==============================================================================
" FILES
" ==============================================================================
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set ffs=unix,dos,mac
set autoread          " 更新時自動再読み込み
set switchbuf=useopen " 新しく開く代わりにすでに開いてあるバッファを開く
set hidden            " 編集中でも他のファイルを開けるようにする
set noswapfile        " スワップファイルを作らない
set nobackup          " バックアップを取らない
set noreadonly        " リードオンリーにしない
set undofile          " undo履歴ファイルを作る
set undodir=$HOME/.vimundo


" 保存時に行末の空白を除去する
fun! StripTrailingWhitespace()
  " Don't strip on these filetypes
  if &ft =~ 'markdown\|perl'
    return
  endif
  %s/\s\+$//ge
endfun

autocmd BufWritePre * call StripTrailingWhitespace()

" 外部保存をチェックする
augroup vimrc_checktime
  autocmd!
  autocmd WinEnter,BufNewFile,BufEnter,FocusGained,FocusLost,BufRead * :checktime
augroup END

" ==============================================================================
" FILE TYPES
" ==============================================================================
autocmd BufNewFile,BufRead *.tag set filetype=html
" au BufNewFile,BufRead *.tag setlocal ft=javascript
autocmd BufNewFile,BufRead *.jade set filetype=pug
autocmd BufNewFile,BufRead *.cson set filetype=coffee
autocmd BufNewFile,BufRead *.es6 set filetype=javascript


" ==============================================================================
" VIEW
" ==============================================================================
" if has('nvim')
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif
if !has('gui_running')
  set ttyfast
  set lazyredraw
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
elseif empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

syntax on                       " シンタックスカラーリング有効
set synmaxcol=300               " ハイライト処理を300列までに限定
set laststatus=2                " ステータスラインを2行にする
set showcmd                     " 入力中のコマンドを表示
set showmode                    " 現在のモードを表示
set number                      " 行番号表示
set ruler                       " 行・列番号表示
set nowrap                      " 折り返し表示しない
set notitle                     " タイトルを書き換えない
set display=uhex                " 印字不可能文字を16進数表示
set cursorline                  " カーソル行をハイライト
set completeopt-=preview        " 自動プレビューを無効(主にPython用)
set showtabline=2               " 常にタブラインを表示
set showmatch                   " 括弧の対応をハイライト
set matchpairs& matchpairs+=<:> " 対応括弧に<と>のペアを追加
set matchtime=3                 " 対応括弧の表示秒数を3秒にする
set list                        " 不可視文字を表示

set background=dark
colorscheme solarized
" colorscheme one
" let g:airline_theme='one'

hi ZenkakuSpace guibg=NONE gui=underline ctermfg=LightBlue cterm=underline
match ZenkakuSpace /　/

set listchars=
" set listchars+=eol:¬
set listchars+=tab:>-
set listchars+=trail:·
set listchars+=nbsp:·
set listchars+=extends:»
set listchars+=precedes:«

highlight SpecialKey ctermfg=black " 不可視文字の文字色を指定する
highlight SpecialKey guibg=NONE " 不可視文字の背景なし
highlight SpecialKey ctermbg=NONE " 不可視文字の背景なし

" set ambiwidth=double

" ==============================================================================
" CURSOR MOVE
" ==============================================================================
set virtualedit=all           " 文字がない場所にもカーソル移動
set nostartofline             " 移動コマンドを使ったとき、行頭に移動しない
set scrolloff=5               " スクロール時に上下に表示される最小行数
set whichwrap=b,s,h,s,<,>,[,] " カーソルを行頭、行末で止まらないようにする

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" インサートモードでも移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

" 画面切り替え
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" <c-j>, <c-k>で10行移動
noremap <c-j> 10j
noremap <c-k> 10k


" ==============================================================================
" SEARCH
" ==============================================================================
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 大文字ではじめたら大文字小文字無視しない
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

" Esc2回でハイライトを解除
nnoremap <Esc><Esc> :noh<CR>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'


" ==============================================================================
" EDITOR
" ==============================================================================
set expandtab                            " tabをスペースに変換
set tabstop=2 shiftwidth=2 softtabstop=2 " tab展開文字数, autoindent時のインデント数,Tabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set shiftround                           " インデントをshiftwidthの倍数に丸める
set autoindent smartindent               " 自動インデント，スマートインデント
set formatoptions=lmoq                   " 整形オプション，マルチバイト系を追加
set wildmenu                             " コマンド補完を強化
set wildmode=list:full                   " リスト表示，最長マッチ
set infercase                            " 補完の際の大文字小文字の区別しない "
set backspace=indent,eol,start           " バックスペースで特殊記号も削除可能に

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %


" ==============================================================================
" BASE KEYMAP
" ==============================================================================
" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>

" LEADERをスペースキーにする
let mapleader = "\<Space>"

" vを二回で行末まで選択
vnoremap v $h

if !has('gui_running')
  augroup term_vim_c_space
    autocmd!
    autocmd VimEnter * map <Nul> <C-Space>
    autocmd VimEnter * map! <Nul> <C-Space>
  augroup END
endif


" ==============================================================================
"  ____  _                   _
" |  _ \| |_   _  __ _      (_)_ __  ___
" | |_) | | | | |/ _` |_____| | '_ \/ __|
" |  __/| | |_| | (_| |_____| | | | \__ \
" |_|   |_|\__,_|\__, |     |_|_| |_|___/
"                |___/
" ==============================================================================

" ==============================================================================
" vim-airline
" ==============================================================================
let g:airline_powerline_fonts = 1
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0

" ==============================================================================
" emmet-vim
" ==============================================================================
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" ==============================================================================
" vim-easy-align
" ==============================================================================
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ==============================================================================
" incsearch.vim
" ==============================================================================
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" ==============================================================================
" caw.vim
" ==============================================================================
nmap <C-c> <Plug>(caw:hatpos:toggle)
vmap <C-c> <Plug>(caw:hatpos:toggle)

" ==============================================================================
" uncrustify-vim
" ==============================================================================
if executable('uncrustify')
  let g:uncrustify_cfg_file_path = "~/.uncrustify.cfg"
  augroup cpp_uncrustify
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call uncrustify#UncrustifyAuto()
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch] call uncrustify#UncrustifyAuto()
  augroup END
endif

" ==============================================================================
" YouCompleteMe
" ==============================================================================
" 色設定
hi Pmenu guifg=#073642 guibg=#586e75 ctermfg=0 ctermbg=10 gui=reverse
hi PmenuSel guifg=#586e75 guibg=#93a1a1 ctermfg=10 ctermbg=8 gui=reverse
hi PmenuSbar guifg=#073642 guibg=#073642 ctermfg=0 ctermbg=0
hi PmenuThumb guifg=#586e75 ctermfg=10

let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_cache_omnifunc = 1
let g:ycm_auto_trigger = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_error_symbol = 'X'
let g:ycm_warning_symbol = '>'
" let g:ycm_show_diagnostics_ui = 0
" let g:syntastic_enable_highlighting = 0
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_key_invoke_completion = '<C-.>'

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>kk :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ff :YcmCompleter FixIt<CR>
augroup YouCompleteMe
  autocmd!
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
" let g:ycm_collect_identifiers_from_tags_files = 1
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:EclimCompletionMethod = 'omnifunc'

function! MyOnCompleteDone()
    if !exists('v:completed_item') || empty(v:completed_item)
        return
    endif

    let complete_str = v:completed_item.word
    if complete_str == ''
        return
    endif
    let abbr = v:completed_item.abbr
    let startIdx = match(abbr,"(")
    let endIdx = match(abbr,")")
    if endIdx - startIdx > 1
        let argsStr = strpart(abbr, startIdx+1, endIdx - startIdx -1)
        let argsList = split(argsStr, ",")
        let snippet = ""
        let c = 1
        for i in argsList
            if c > 1
                let snippet = snippet. ", "
            endif
            " strip space
            let arg = substitute(i, '^\s*\(.\{-}\)\s*$', '\1', '')
            let snippet = snippet . '${'.c.":".arg.'}'
            let c += 1
        endfor
        let snippet = snippet . ")$0"
        call UltiSnips#Anon(snippet)
    endif
endfunction
" autocmd CompleteDone *.cpp  call MyOnCompleteDone()

" ==============================================================================
" Clighter / Clamp
" ==============================================================================
if has('nvim')
  " let g:clamp_autostart = 1
  " let g:clamp_libclang_file = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
  " let g:clamp_heuristic_compile_args = 0
  " let g:ClampOccurrences = 0
  " nnoremap <silent> <Leader><C-r> :call ClampRename()<CR>
else
  let g:clighter_autostart = 1
  let g:clighter_libclang_file = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
  " let g:clighter_heuristic_compile_args = 0
  let g:ClighterOccurrences = 0
  let g:clighter_compile_args = [
        \'-x',
        \'c++',
        \'--std=c++14',
        \'--stdlib=libc++',
        \'-isystem /usr/local/include',
        \'-isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include',
        \'-isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
        \'-isystem /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include',
        \'-isystem /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks',
        \'-isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1',
        \'-isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
        \'-isystem /Applications/JUCE/modules',
        \'-isystem ~/SDKs/link/include',
        \'-isystem ~/SDKs/link/modules/asio-standalone/asio/include',
        \]
  nnoremap <silent> <Leader><C-r> :call clighter#Rename()<CR>
endif

" ==============================================================================
" vim-jsbeautify
" ==============================================================================
augroup beautifyjs
  autocmd!
  autocmd BufWrite,FileWritePre,FileAppendPre *.es6 call JsBeautify()
  autocmd BufWrite,FileWritePre,FileAppendPre *.js call JsBeautify()
  autocmd BufWrite,FileWritePre,FileAppendPre *.jsx call JsBeautify()
  autocmd BufWrite,FileWritePre,FileAppendPre *.tag call HtmlBeautify()
  autocmd BufWrite,FileWritePre,FileAppendPre *.css call CSSBeautify()
  autocmd BufWrite,FileWritePre,FileAppendPre *.html call HtmlBeautify()
augroup END

" ==============================================================================
" neomake
" ==============================================================================
" autocmd! BufWritePost * Neomake " 保存時に実行する

" let g:neomake_verbose = 1
" let g:neomake_open_list = 2

let g:neomake_error_sign = {'text': '✖', 'texthl': 'DiffDelete'}
let g:neomake_warning_sign = { 'text': '⚠', 'texthl': 'DiffChange'}
let g:neomake_message_sign = { 'text': '➤', 'texthl': 'DiffText'}

augroup neomake_run
  " 保存時とenter時にlintする
  autocmd! BufWritePost,BufEnter *.js Neomake

  " インサートモードを抜けた時もlint
  autocmd! InsertLeave *.js Neomake

  " vim終了時にeslint_dを終了
  autocmd! VimLeave *.js  !eslint_d stop
augroup END

let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint_d | tr -d "\n"')
" let g:neomake_cpp_enable_makers = ['clang']
" let g:neomake_cpp_clang_maker = {
"    \ 'exe': '/usr/bin/clang',
"    \ 'args': ['-Wall', '-Wextra', '-Weverything', '-pedantic', '-Wno-sign-conversion'],
"    \ }

" ==============================================================================
" jeaye/color_coded
" ==============================================================================
let g:color_coded_enabled = 1
let g:color_coded_filetypes = ['c', 'cpp', 'objc']

" hi Decl                          ctermfg=9  guifg=#cb4b16
" hi DeclRefExprCall               ctermfg=9  guifg=#cb4b16
" hi DeclRefExprEnum               ctermfg=9  guifg=#cb4b16
" hi Identifier                    ctermfg=9  guifg=#cb4b16
" hi IncSearch                     ctermfg=9  guifg=#cb4b16
" hi Occurrences                   ctermfg=9  guifg=#cb4b16
" hi Prepro                        ctermfg=9  guifg=#cb4b16
" hi Ref                           ctermfg=9  guifg=#cb4b16

" ==============================================================================

" Gray ctermfg=11 guifg=#586e75
hi NamespaceRef                  ctermfg=11 guifg=#586e75

" Cyan ctermfg=6  guifg=#2aa198
hi Constant                      ctermfg=6  guifg=#2aa198
hi MacroInstantiation            ctermfg=6  guifg=#2aa198
hi EnumConstant                  ctermfg=6  guifg=#2aa198
hi EnumConstantDecl              ctermfg=6  guifg=#2aa198

" Orange ctermfg=9  guifg=#cb4b16
hi PreProc                       ctermfg=9  guifg=#cb4b16
hi MacroDefinition               ctermfg=9  guifg=#cb4b16
hi Special                       ctermfg=9  guifg=#cb4b16
hi Constructor                   ctermfg=9  guifg=#cb4b16
hi Destructor                    ctermfg=9  guifg=#cb4b16

" Yellow ctermfg=3 guifg=#b58900
hi Type                          ctermfg=3 guifg=#b58900
hi VariableRef                   ctermfg=3 guifg=#b58900
hi Variable                      ctermfg=3 guifg=#b58900
hi StorageClass                  ctermfg=3 guifg=#b58900
hi NamespaceAlias                ctermfg=3 guifg=#b58900
hi Structure                     ctermfg=3 guifg=#b58900
hi Member                        ctermfg=3 guifg=#b58900
hi MemberRef                     ctermfg=3 guifg=#b58900
hi MemberRefExprCall             ctermfg=3 guifg=#b58900
hi MemberRefExprVar              ctermfg=3 guifg=#b58900
hi EnumDecl                      ctermfg=3 guifg=#b58900

" Blue ctermfg=4 guifg=#268bd2
hi Namespace                     ctermfg=4 guifg=#268bd2
hi Function                      ctermfg=4 guifg=#268bd2
hi MemberRefExpr                 ctermfg=4 guifg=#268bd2
hi FunctionDecl                  ctermfg=4 guifg=#268bd2
hi ParmDecl                      ctermfg=4 guifg=#268bd2
hi VarDecl                       ctermfg=4 guifg=#268bd2
hi FieldDecl                     ctermfg=4 guifg=#268bd2
hi TypeRef                       ctermfg=4 guifg=#268bd2
hi ClassDecl                     ctermfg=4 guifg=#268bd2
hi ClassTemplate                 ctermfg=4 guifg=#268bd2
hi UnionDecl                     ctermfg=4 guifg=#268bd2
hi StructDecl                    ctermfg=4 guifg=#268bd2
hi CXXMethod                     ctermfg=4 guifg=#268bd2

" Purple ctermfg=13 guifg=#6c71c4
hi TemplateRef                   ctermfg=13 guifg=#6c71c4

" Green ctermfg=2 guifg=#859900

" Magenta ctermfg=5  guifg=#d33682
hi TemplateNoneTypeParameter     ctermfg=5  guifg=#d33682
hi TemplateTypeParameter         ctermfg=5  guifg=#d33682
hi TemplateTemplateParameter     ctermfg=5  guifg=#d33682
hi BlockExpr                     ctermfg=5  guifg=#d33682
hi FirstExpr                     ctermfg=5  guifg=#d33682
hi Punctuation                   ctermfg=5  guifg=#d33682



"TODO
" ==============================================================================
" elzr/vim-json
" ==============================================================================
let g:vim_json_syntax_conceal = 0

" ==============================================================================
" airblade/vim-gitgutter
" ==============================================================================
let g:gitgutter_max_signs = 500
set updatetime=250

" ==============================================================================
" vim-ctrlspace/vim-ctrlspace
" ==============================================================================
nnoremap <silent><C-Space> :CtrlSpace<CR>

if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

hi link CtrlSpaceNormal   Comment
hi link CtrlSpaceSelected CursorLine
hi link CtrlSpaceSearch   Search
hi link CtrlSpaceStatus   StatusLine

" ==============================================================================
" justinmk/vim-dirvish
" ==============================================================================
nnoremap <silent><C-d> :call <SID>toggle_dirvish()<CR>

augroup dirvish_plugin
  autocmd!
  " Map t to open in new tab.
  autocmd FileType dirvish
        \  nnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |nnoremap <buffer> s :call dirvish#open('split', 0)<CR>
        \ |xnoremap <buffer> s :call dirvish#open('split', 0)<CR>
        \ |nnoremap <buffer> v :call dirvish#open('vsplit', 0)<CR>
        \ |xnoremap <buffer> v :call dirvish#open('vsplit', 0)<CR>

  " Enable :Gstatus and friends.
  autocmd FileType dirvish call fugitive#detect(@%)
  autocmd FileType dirvish sort ir /^.*[^\/]$/
  autocmd FileType dirvish silent keeppatterns g/.DS_Store\|node_modules/d

  " Map CTRL-R to reload the Dirvish buffer.
  autocmd FileType dirvish nnoremap <buffer> <C-R> :<C-U>Dirvish %<CR>:sort r /[^\/]$/<CR>

  " Map `gh` to hide dot-prefixed files.
  autocmd FileType dirvish nnoremap <buffer>
        \ gh :keeppatterns g@\v/\.[^\/]+/?$@d<cr>
augroup END

function! s:toggle_dirvish()
  if &filetype == 'dirvish'
    if exists('b:dirvish')
      if winnr('$') > 1
        wincmd c
      else
        bdelete
      endif
    endif
  else
    let l:path = expand('%:~:h')

    if len(l:path) == 0
      execute 'Dirvish'
    else
      execute 'Dirvish %'
    endif
  endif
endfunction


" ==============================================================================
" ctrlpvim/ctrlp.vim
" ==============================================================================
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*node_modules*,*.so,*.png,*.jpg,*.ai,*.pkg,*.swp,*.zip,*.tag
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|png|jpg|gif|ai|pkg|swp|zip|tag|so)$'
let g:ctrlp_max_depth = 10
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['quickfix', 'dir', 'line', 'mixed']

if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore ".git"
      \ --ignore ".svn"
      \ --ignore ".hg"
      \ --ignore "*.jpg"
      \ --ignore "*.svg"
      \ --ignore "*.png"
      \ --ignore "*.gif"
      \ --ignore "*.psd"
      \ --ignore "*.ai"
      \ --ignore "*.sketch"
      \ --ignore "*.zip"
      \ --ignore "*.pkg"
      \ --ignore "*.aac"
      \ --ignore "*.aif"
      \ --ignore "*.wav"
      \ --ignore "*.ttf"
      \ --ignore "*.eot"
      \ --ignore "*.otf"
      \ --ignore "*.wof"
      \ --ignore "*.woff"
      \ --ignore "*.woff2"
      \ --ignore "node_modules"
      \ --ignore ".DS_Store"
      \ --ignore "**/*.pyc"
      \ -g ""'
endif

hi link CtrlPNoEntries Error
hi link CtrlPMatch     Type
hi link CtrlPLinePre   Identifier
hi link CtrlPPrtBase   Comment
hi link CtrlPPrtText   Normal
hi link CtrlPPrtCursor Constant

" ==============================================================================
" vim-scripts/a.vim
" ==============================================================================
nnoremap <silent> <Leader>a :A<CR>

" ==============================================================================
" rking/ag.vim
" ==============================================================================
let g:ag_mapping_message=0
let g:ag_highlight=1


" ==============================================================================
" thinca/vim-quickrun
" ==============================================================================
if executable("clang++")
  let g:quickrun_config = {}
  let g:quickrun_config['cpp/clang++14'] = {
      \ 'cmdopt': '--std=c++14 --stdlib=libc++ -isystem /usr/local/include -isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include -isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include -isystem /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include -isystem /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks -isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1 -isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include -isystem /Applications/JUCE/modules',
      \ 'type': 'cpp/clang++'
    \ }
  let g:quickrun_config['cpp'] = {'type': 'cpp/clang++14'}
endif


" ==============================================================================
" cpp
" ==============================================================================
function! s:cpp()
  " インクルードパスを設定する
  setlocal path+=/Applications/JUCE/modules/juce_audio_basics
  " 括弧を構成する設定に <> を追加する
  setlocal matchpairs+=<:>
endfunction


augroup vimrc-cpp
  autocmd!
  autocmd FileType cpp call s:cpp()
augroup END

" ==============================================================================
" arakashic/chromatica.nvim
" ==============================================================================
if has('nvim')
  let g:chromatica#libclang_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
  let g:chromatica#enable_at_startup=1
  let g:chromatica#responsive_mode=1
  let g:chromatica#dotclangfile_search_path="~/"

  " hi chromaticaInclusionDirective        InclusionDirective
  " hi chromaticaDeclRefExprEnum           DeclRefExprEnum
  " hi chromaticaDeclRefExprCall           DeclRefExprCall
  hi chromaticaMemberRefExprCall         ctermfg=3 guifg=#b58900
  hi chromaticaMemberRefExprVar          ctermfg=3 guifg=#b58900
  hi chromaticaTemplateNoneTypeParameter ctermfg=5  guifg=#d33682
  hi chromaticaStructDecl                ctermfg=4 guifg=#268bd2
  hi chromaticaUnionDecl                 ctermfg=4 guifg=#268bd2
  hi chromaticaClassDecl                 ctermfg=4 guifg=#268bd2
  hi chromaticaEnumDecl                  ctermfg=3 guifg=#b58900
  hi chromaticaFieldDecl                 ctermfg=4 guifg=#268bd2
  hi chromaticaEnumConstantDecl          ctermfg=6  guifg=#2aa198
  hi chromaticaVarDecl                   ctermfg=4 guifg=#268bd2
  hi chromaticaParmDecl                  ctermfg=4 guifg=#268bd2
  " hi chromaticaTypedefDecl               TypedefDecl
  " hi chromaticaLinkageSpec               LinkageSpec
  hi chromaticaConstructor               ctermfg=9  guifg=#cb4b16
  hi chromaticaDestructor                ctermfg=9  guifg=#cb4b16
  hi chromaticaTemplateTypeParameter     ctermfg=5  guifg=#d33682
  " hi chromaticaNonTypeTemplateParameter  NonTypeTemplateParameter
  hi chromaticaTemplateTemplateParameter ctermfg=5  guifg=#d33682
  " hi chromaticaFunctionTemplate          FunctionTemplate
  hi chromaticaClassTemplate             ctermfg=4 guifg=#268bd2
  hi chromaticaNamespaceAlias            ctermfg=3 guifg=#b58900
  " hi chromaticaUsingDirective            UsingDirective
  " hi chromaticaUsingDeclaration          UsingDeclaration
  " hi chromaticaTypeAliasDecl             TypeAliasDecl
  " hi chromaticaCXXAccessSpecifier        CXXAccessSpecifier
  hi chromaticaTypeRef                   ctermfg=4 guifg=#268bd2
  " hi chromaticaCXXBaseSpecifier          CXXBaseSpecifier
  hi chromaticaTemplateRef               ctermfg=13 guifg=#6c71c4
  hi chromaticaNamespaceRef              ctermfg=11 guifg=#586e75
  hi chromaticaMemberRef                 ctermfg=3 guifg=#b58900
  " hi chromaticaLabelRef                  LabelRef
  " hi chromaticaOverloadedDeclRef         OverloadedDeclRef
  hi chromaticaVariableRef               ctermfg=3 guifg=#b58900
  " hi chromaticaFirstInvalid              FirstInvalid
  " hi chromaticaInvalidFile               InvalidFile
  " hi chromaticaNoDeclFound               NoDeclFound
  " hi chromaticaNotImplemented            NotImplemented
  " hi chromaticaInvalidCode               InvalidCode
  hi chromaticaFirstExpr                 ctermfg=5  guifg=#d33682
  " hi chromaticaDeclRefExpr               DeclRefExpr
  " hi chromaticaCallExpr                  CallExpr
  " hi chromaticaObjCMessageExpr           ObjCMessageExpr
  hi chromaticaBlockExpr                 ctermfg=5  guifg=#d33682
  hi chromaticaMacroDefinition           ctermfg=9  guifg=#cb4b16
  hi chromaticaMacroInstantiation        ctermfg=6  guifg=#2aa198
  " hi chromaticaIntegerLiteral            IntegerLiteral
  " hi chromaticaFloatingLiteral           FloatingLiteral
  " hi chromaticaImaginaryLiteral          ImaginaryLiteral
  " hi chromaticaStringLiteral             StringLiteral
  " hi chromaticaCharacterLiteral          CharacterLiteral
  hi chromaticaPunctuation               ctermfg=5  guifg=#d33682
  " hi chromaticaIf                        If
  " hi chromaticaSwitch                    Switch
  " hi chromaticaLoop                      Loop
  " hi chromaticaStatement                 Statement
  hi chromaticaType                      ctermfg=3 guifg=#b58900
  " hi chromaticaBoolean                   Boolean
  hi chromaticaConstant                  ctermfg=6  guifg=#2aa198
  " hi chromaticaCXXCast                   CXXCast
  " hi chromaticaCStyleCast                CStyleCast
  " hi chromaticaExceptionStatement        ExceptionStatement
  " hi chromaticaExceptionAttr             ExceptionAttr
  " hi chromaticaTypeAliasStatement        TypeAliasStatement
  " hi chromaticaFile                      File
  " hi chromaticaIncludedHeaderFile        IncludedHeaderFile
  " hi chromaticaFinalAttr                 FinalAttr
  " hi chromaticaOverrideAttr              OverrideAttr
  " hi chromaticaConstAttr                 ConstAttr
  " hi chromaticaTypedef                   Typedef
  hi chromaticaStorageClass              ctermfg=3 guifg=#b58900
  " hi chromaticaOperatorOverload          OperatorOverload
  " hi chromaticaAccessQual                AccessQual
  " hi chromaticaSpecifier                 Specifier
  " hi chromaticaLinkage                   Linkage
  " hi chromaticaAutoType                  AutoType
  " hi chromaticaRegister                  Register
  " hi chromaticaThreadLocal               ThreadLocal
  " hi chromaticaRegister                  Register
  " hi chromaticaRegister                  Register
  " hi chromaticaConditionalOperator       ConditionalOperator
  hi chromaticaNamespace                 ctermfg=4 guifg=#268bd2
  hi chromaticaCXXMethod                 ctermfg=4 guifg=#268bd2
  hi chromaticaFunctionDecl              ctermfg=4 guifg=#268bd2
  " hi chromaticaConversionFunction        ConversionFunction
  hi chromaticaMemberRefExpr             ctermfg=4 guifg=#268bd2
endif

