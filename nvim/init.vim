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

" Color Scheme
Plug 'altercation/vim-colors-solarized'

" Files and Buffers
Plug 'justinmk/vim-dirvish'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'ctrlpvim/ctrlp.vim'

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

" Auto Complete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

" Signature
Plug 'kshenoy/vim-signature'

" Comment out
Plug 'tyru/caw.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" C / C++
Plug 'octol/vim-cpp-enhanced-highlight' , { 'for': ['c','cpp'] }

if has('nvim')
  Plug 'bbchung/Clamp' , { 'for': ['c','cpp'] }
else
  Plug 'bbchung/clighter' , { 'for': ['c','cpp'] }
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
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'stylus'] }
Plug 'kchmck/vim-coffee-script' , { 'for': ['coffee'] }
Plug 'leafgarland/typescript-vim' , { 'for': ['typescript'] }
Plug 'wavded/vim-stylus' , { 'for': ['stylus'] }
Plug 'digitaltoad/vim-pug' , { 'for': ['pug', 'jade'] }

" linter
Plug 'scrooloose/syntastic' , { 'do': 'npm install -g eslint', 'for': ['html', 'css', 'javascript'] }

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

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


" ==============================================================================
" CLIP BOARD
" ==============================================================================
if !has('nvim')
  set clipboard+=unnamed
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
autocmd BufWritePre * :%s/\s\+$//ge

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

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_cache_omnifunc = 1
let g:ycm_auto_trigger = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_key_invoke_completion = '<C-.>'


nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>kk :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
" let g:ycm_collect_identifiers_from_tags_files = 1
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:EclimCompletionMethod = 'omnifunc'
" autocmd Vimrc FileType javascript nnoremap ,gd :<C-u>YcmCompleter GetDoc<CR>
" autocmd Vimrc Filetype javascript nnoremap ,gt :<C-u>YcmCompleter GoTo<CR>
" autocmd Vimrc FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

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
  let g:clamp_autostart = 1
  let g:clamp_libclang_file = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
  let g:clamp_heuristic_compile_args = 0
  let g:ClampOccurrences = 0
  nnoremap <silent> <Leader><C-r> :call ClampRename()<CR>
else
  let g:clighter_autostart = 1
  let g:clighter_libclang_file = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
  let g:clighter_heuristic_compile_args = 0
  let g:ClighterOccurrences = 0
  nnoremap <silent> <Leader><C-r> :call clighter#Rename()<CR>
endif

" ==============================================================================
" vim-jsbeautify
" ==============================================================================
augroup beautifyjs
  autocmd!
  autocmd BufWrite,FileWritePre,FileAppendPre *.es6 call JsBeautify()
  autocmd BufWrite,FileWritePre,FileAppendPre *.js call JsBeautify()
  autocmd BufWrite,FileWritePre,FileAppendPre *.tag call HtmlBeautify()
  autocmd BufWrite,FileWritePre,FileAppendPre *.css call CSSBeautify()
  autocmd BufWrite,FileWritePre,FileAppendPre *.html call HtmlBeautify()
augroup END

" ==============================================================================
" syntastic
" ==============================================================================
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_disabled_filetypes=['c','cpp']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_ignore_errors = [
  \ 'trimming empty <span>',
  \ 'proprietary attribute "if"',
  \ 'proprietary attribute "name"',
  \ 'proprietary attribute "each"',
  \ 'proprietary attribute "show"',
  \ 'proprietary attribute "hide"',
  \ "isn't allowed in",
  \ "inserting implicit",
  \ "missing </form>",
  \ 'trimming empty <i>',
  \ 'trimming empty <li>',
  \ 'is not recognized!',
  \ 'discarding unexpected'
  \ ]

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

hi CtrlSpaceNormal   guifg=#073642 guibg=#586e75 ctermfg=0 ctermbg=10 gui=reverse
hi CtrlSpaceSelected guifg=#586e75 guibg=#93a1a1 ctermfg=10 ctermbg=8 gui=reverse
hi CtrlSpaceSearch   guifg=#073642 guibg=#073642 ctermfg=0 ctermbg=0
hi CtrlSpaceStatus   guifg=#586e75 ctermfg=10

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
    execute 'sort r /[^\/]$/'
  endif
endfunction


" ==============================================================================
" ctrlpvim/ctrlp.vim
" ==============================================================================
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }
