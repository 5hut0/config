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
Plug 'ryanoasis/vim-devicons'
Plug 'qpkorr/vim-renamer'

" Git
Plug 'tpope/vim-fugitive'

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

" Completer
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Signature Plug 'kshenoy/vim-signature'

" Comments
Plug 'scrooloose/nerdcommenter'

" Snippets
Plug 'honza/vim-snippets'

" C / C++
Plug 'jackguo380/vim-lsp-cxx-highlight', { 'for': ['c','cpp'] }
Plug 'vim-scripts/a.vim' , { 'for': ['c','cpp'] }
Plug 'Shougo/vimproc.vim' , { 'for': ['c','cpp'] }
Plug 'kana/vim-operator-user' , { 'for': ['c','cpp'] }
Plug 'rhysd/vim-clang-format' , { 'for': ['c','cpp'] }

" HTML, CSS, JS
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'stylus','javascript','vue'] }

" Color Scheme
Plug 'lifepillar/vim-solarized8'

" Syntax
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



" ==============================================================================
" CLIPBOARD
" ==============================================================================
command! DisableClipboard set clipboard&
command! EnableClipboard set clipboard=unnamedplus

set clipboard=unnamed,autoselect
set clipboard&
set clipboard^=unnamed

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

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
set nowritebackup
set nobackup          " バックアップを取らない
set nowritebackup
set noreadonly        " リードオンリーにしない
set undofile          " undo履歴ファイルを作る
set undodir=$HOME/.vimundo

" 外部保存をチェックする
augroup vimrc_checktime
  autocmd!
  autocmd WinEnter,BufNewFile,BufEnter,FocusGained,FocusLost,BufRead * :checktime
augroup END

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
set cmdheight=2      " Better display for messages
set updatetime=300
set shortmess+=c
set signcolumn=yes    " always show signcolumns
set ambiwidth=double

set background=dark
let g:solarized_use16=1
colorscheme solarized8_flat

hi ZenkakuSpace guibg=NONE gui=underline ctermfg=LightBlue cterm=underline
match ZenkakuSpace /　/

highlight SpecialKey ctermfg=black " 不可視文字の文字色を指定する
highlight SpecialKey guibg=NONE " 不可視文字の背景なし
highlight SpecialKey ctermbg=NONE " 不可視文字の背景なし
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE


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
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" <c-j>, <c-k>で10行移動
noremap <c-j> 10j
noremap <c-k> 10k


" ==============================================================================
" SEARCH
" ==============================================================================
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m

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
" let g:airline_section_z = ' %l:%c '
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let airline#extensions#coc#error_symbol = ' '
let airline#extensions#coc#warning_symbol = ' '
let airline#extensions#coc#stl_format_err = '%{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%{[%w(#%fw)]}'
" let g:airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_left_sep = '󾂰'
let g:airline_left_alt_sep = '󾂱'
let g:airline_right_sep = '󾂲'
let g:airline_right_alt_sep = '󾂳'
let g:airline_symbols={
      \ 'readonly'  : '󿠽',
      \ 'crypt'     : '󿠽',
      \ 'branch'    : '',
      \ 'linenr'    : '',
      \ 'maxlinenr' : '',
      \ 'dirty'     : '',
      \ }


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
let g:NERDCommentEmptyLines = 0

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
" justinmk/vim-dirvish
" ==============================================================================
let g:dirvish_mode = ':sort ,^.*[\/],'

augroup dirvish_plugin
  autocmd!
  " Map t to open in new tab.
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |nnoremap <buffer> s :call dirvish#open('split', 0)<CR>
        \ |xnoremap <buffer> s :call dirvish#open('split', 0)<CR>
        \ |nnoremap <buffer> v :call dirvish#open('vsplit', 0)<CR>
        \ |xnoremap <buffer> v :call dirvish#open('vsplit', 0)<CR>

  autocmd FileType dirvish nmap <buffer> q gq

  " Hide meta files
  autocmd FileType dirvish sort ir /^.*[^\/]$/
  autocmd FileType dirvish silent keeppatterns g/.*.meta\|\.DS_Store/d

  "" Map `gr` to reload.
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gr :<C-U>Dirvish %<CR>


  " Map `gh` to hide dot-prefixed files.
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>

augroup END

" ==============================================================================
" vim-scripts/a.vim
" ==============================================================================
nnoremap <silent> <Leader>h :A<CR>


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
        \ 'cmdopt': '-x c++ --std=c++14 --stdlib=libc++ -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk',
        \ 'type': 'cpp/clang++'
        \ }
endif

let g:quickrun_config['javascript.jsx'] = {
      \   "command": "node",
      \   "tempfile": "{tempname()}.js"
      \ }


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


" ==============================================================================
" mattn/emmet-vim
" ==============================================================================
let g:user_emmet_leader_key='<C-e>'

" ==============================================================================
" neoclide/coc.nvim
" ==============================================================================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <leader>kk <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=+ -complete=custom,s:SearchOptions  Ack    :call coc#rpc#notify('search', [<f-args>])
command! -nargs=+ -complete=custom,s:SearchOptions  Grep    :call coc#rpc#notify('search', [<f-args>])

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

nnoremap <silent><C-Space> :CocList buffers<CR>
nnoremap <c-t> :CocList files<CR>
nnoremap <Leader>a :CocList grep<CR>

" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>oo :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>


" ==============================================================================
" rhysd/vim-clang-format
" ==============================================================================
let g:clang_format#code_style ="llvm"
let g:clang_format#auto_format=1
let g:clang_format#auto_formatexpr=1

let s:dir = getcwd()
let s:ans = findfile("compile_commands.json", fnameescape(s:dir) . ";")

if len(s:ans) > 1
  let s:rc = fnamemodify(s:ans, ":p:h") . "/.vimrc"
  call feedkeys(":echo".s:rc."\<cr>")
endif


" ==============================================================================
" highlight
" ==============================================================================
highlight default link LspCxxHlSymConstructor Macro
highlight default link LspCxxHlSymEnumMember Constant
highlight default link LspCxxHlGroupEnumConstant Constant
highlight default link LspCxxHlGroupNamespace LineNr
highlight default link LspCxxHlSymNamespace LineNr
highlight LspCxxHlSymClass ctermfg=13 guifg=#6c71c4
highlight default link LspCxxHlSymField Normal
highlight default link LspCxxHlGroupMemberVariable Normal
highlight cocErrorSign ctermfg=9 guifg=#cb4b16
highlight cocWarningSign ctermfg=3 guifg=#b58900
highlight cocInfoSign ctermfg=4 guifg=#268bd2
highlight cocHintSign ctermfg=6 guifg=#2aa198
highlight cocErrorHighlight cterm=undercurl gui=undercurl
highlight cocWarningHighlight cterm=undercurl gui=undercurl
highlight Comment cterm=NONE gui=NONE
highlight DiffChange ctermbg=NONE guibg=NONE
highlight DiffAdd ctermbg=NONE guibg=NONE
highlight DiffDelete ctermbg=NONE guibg=NONE

highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE
highlight LineNr ctermbg=NONE
highlight Folded ctermbg=NONE
highlight default link EndOfBuffer Comment
highlight default link DirvishPathHead Normal
highlight default link DirvishSuffix Normal
