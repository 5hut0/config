" __     ___
" \ \   / (_)_ __ ___  _ __ ___
"  \ \ / /| | '_ ` _ \| '__/ __|
"   \ V / | | | | | | | | | (__
"    \_/  |_|_| |_| |_|_|  \___|
" ==============================================================================
"        _                       _
" __   _(_)_ __ ___        _ __ | |_   _  __ _
" \ \ / / | '_ ` _ \ _____| '_ \| | | | |/ _` |
"  \ V /| | | | | | |_____| |_) | | |_| | (_| |
"   \_/ |_|_| |_| |_|     | .__/|_|\__,_|\__, |
"                         |_|            |___/
" ==============================================================================
if has('vim_starting')
  set rtp+=~/.config/vim/plugged/vim-plug
  if !isdirectory(expand('~/.config/vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.config/vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.config/vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.config/vim/plugged')

" Quick Run
Plug 'thinca/vim-quickrun'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File Explorer
Plug 'justinmk/vim-dirvish'

" Search and Replace
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'thinca/vim-qfreplace'

" Doxygen
Plug 'vim-scripts/DoxygenToolkit.vim'

" Editing
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-expand-region'
Plug 'coderifous/textobj-word-column.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sk1418/HowMuch'
Plug 'mattn/emoji-vim'

" Completer
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'tenfyzhong/CompleteParameter.vim'

" Signature
Plug 'kshenoy/vim-signature'

" Comments
Plug 'scrooloose/nerdcommenter'

" Snippets
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" C / C++
Plug 'vim-scripts/a.vim' , { 'for': ['c','cpp'] }
Plug 'jeaye/color_coded' , { 'for': ['c','cpp'],'do': 'cmake . -DDOWNLOAD_CLANG=0 && make && make install'}

" HTML, CSS, JS
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'stylus','javascript','vue'] }

" Code Formatter
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript','css', 'less', 'scss', 'json', 'graphql', 'vue'] }
Plug 'maksimr/vim-jsbeautify', { 'do': 'git submodule update --init --recursive', 'for': ['html'] }

if executable('uncrustify')
  Plug 'ompugao/uncrustify-vim' , { 'for': ['c','cpp','cs'] }
endif

" linter
Plug 'w0rp/ale'  , { 'for': ['vue','javascript','markdown'] }

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Color Scheme
Plug 'altercation/vim-colors-solarized'

" Syntax
Plug 'OrangeT/vim-csharp'
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'

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
set shell=/bin/sh
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
command! DisableClipboard set clipboard&
command! EnableClipboard set clipboard=unnamedplus

set clipboard=unnamed,autoselect
set clipboard&
set clipboard^=unnamed

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
if !has('gui_running')
  set ttyfast
  set lazyredraw
endif

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"

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
" set list                        " 不可視文字を表示

set background=dark
colorscheme solarized

hi ZenkakuSpace guibg=NONE gui=underline ctermfg=LightBlue cterm=underline
match ZenkakuSpace /　/

set listchars=tab:·-,trail:·,nbsp:·,extends:»,precedes:«

highlight SpecialKey ctermfg=black " 不可視文字の文字色を指定する
highlight SpecialKey guibg=NONE " 不可視文字の背景なし
highlight SpecialKey ctermbg=NONE " 不可視文字の背景なし


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
let g:airline_section_y=''
let g:airline_section_z = '%l:%c'
let g:airline_powerline_fonts = 0
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = '◬'
let g:airline#extensions#ycm#warning_symbol = '◬'

" ==============================================================================
" emmet-vim
" ==============================================================================
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
      \  'vue' : {
      \      'extends' : 'html',
      \  },
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
" scrooloose/nerdcommenter
" ==============================================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

nmap <C-c> <plug>NERDCommenterToggle
vmap <C-c> <plug>NERDCommenterToggle

" Vue comments
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" ==============================================================================
" 'jiangmiao/auto-pairs'
" ==============================================================================
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>

" ==============================================================================
" uncrustify-vim
" ==============================================================================
if executable('uncrustify')
  let g:uncrustify_cfg_file_path = "~/.uncrustify.cfg"
  augroup cpp_uncrustify
    autocmd!
    autocmd BufRead,BufNewFile *.[chi]pp let g:uncrustify_cfg_file_path = "~/.uncrustify.cfg"
    autocmd BufRead,BufNewFile *.[ch] let g:uncrustify_cfg_file_path = "~/.uncrustify.cfg"
    autocmd BufRead,BufNewFile *.cs let g:uncrustify_cfg_file_path = "~/.uncrustify_cs.cfg"
    autocmd BufWrite,FileWritePre,FileAppendPre *.[chi]pp call uncrustify#UncrustifyAuto()
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch] call uncrustify#UncrustifyAuto()
    autocmd BufWrite,FileWritePre,FileAppendPre *.cs call uncrustify#UncrustifyAuto()
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
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_error_symbol = '◬'
let g:ycm_warning_symbol = '◬'
let g:ycm_confirm_extra_conf = 0

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>kk :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ff :YcmCompleter FixIt<CR>
augroup YouCompleteMe
  autocmd!
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType vue setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

let g:ycm_global_ycm_extra_conf = ''
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_auto_start_csharp_server = 1
let g:ycm_auto_stop_csharp_server = 1


" ==============================================================================
" 'tenfyzhong/CompleteParameter.vim'
" ==============================================================================
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)


" ==============================================================================
" 'prettier/vim-prettier'
" ==============================================================================
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue Prettier
autocmd BufWritePre *.html call HtmlBeautify()


" ==============================================================================
" jeaye/color_coded
" ==============================================================================
let g:color_coded_enabled = 1
let g:color_coded_filetypes = ['c', 'cpp', 'objc']

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

" ==============================================================================
" airblade/vim-gitgutter
" ==============================================================================
let g:gitgutter_max_signs = 500
let g:gitgutter_diff_args = '-w'
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'
set updatetime=250

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
  autocmd FileType dirvish silent keeppatterns g/.*.meta\|\.DS_Store/d

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
" vim-scripts/a.vim
" ==============================================================================
nnoremap <silent> <Leader>h :A<CR>

" ==============================================================================
" 'junegunn/fzf.vim'
" ==============================================================================
let $FZF_DEFAULT_COMMAND = 'ag --nocolor -g ""'
let $FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND"
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
nnoremap <c-t> :Files<CR>
nnoremap <Leader>a :Ag<CR>
nnoremap <silent><C-Space> :Buffers<CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" ==============================================================================
" 'mileszs/ack.vim'
" ==============================================================================
let g:ackprg = 'ag --vimgrep'

" ==============================================================================
" thinca/vim-quickrun
" ==============================================================================
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'job',
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }
if executable("clang++")
  let g:quickrun_config['cpp'] = {
        \ 'cmdopt': '-x c++ --std=c++14 --stdlib=libc++ -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk',
        \ 'type': 'cpp/clang++'
        \ }
endif

let g:quickrun_config['javascript.jsx'] = {
      \   "command": "node",
      \   "tempfile": "{tempname()}.js"
      \ }


" ==============================================================================
" w0rp/ale
" ==============================================================================
let g:ale_set_quickfix = 1
let g:ale_echo_msg_error_str = '◬'
let g:ale_echo_msg_warning_str = '◬'
let g:ale_echo_msg_format = '[%severity%] %code: %%s'

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#open_lnum_symbol = ':'
let g:airline#extensions#ale#close_lnum_symbol = ''

let b:ale_linters = {
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'vue': ['eslint', 'stylelint'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\}

let g:ale_fix_on_save = 1
let g:ale_sign_error = '◬'
let g:ale_sign_warning = '◬'

let g:ale_markdown_remark_lint_use_global = 1
let g:ale_fixers.markdown = ['textlint']

" ==============================================================================
" 'sheerun/vim-polyglot'
" ==============================================================================
let g:polyglot_disabled = ['graphql']

" ==============================================================================
" 'sheerun/vim-polyglot'
" ==============================================================================
" Markdown
let g:vim_markdown_conceal = 0
" Vue
let g:polyglot_disabled = ['vue']

" ==============================================================================
" posva/vim-vue
" ==============================================================================
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1


