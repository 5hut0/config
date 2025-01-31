set langmenu=en_US.UTF-8
lang en_US.UTF-8

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
" Syntax
Plug 'sheerun/vim-polyglot'

" Color Scheme
Plug 'lifepillar/vim-solarized8'
Plug 'jszakmeister/vim-togglecursor'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" File Explorer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'

" Copilot chat
Plug 'zbirenbaum/copilot.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'

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

" Async Tasks
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Comments
Plug 'scrooloose/nerdcommenter'
Plug 'kkoomen/vim-doge'

" Snippets
Plug 'honza/vim-snippets'

" HTML, CSS, JS
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'stylus','typescriptreact','typescript','javascript'] }
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Astro
Plug 'wuelnerdotexe/vim-astro'

" Markdown
Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown'] }

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

set clipboard=unnamed
set clipboard+=unnamedplus

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

" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
" let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:togglecursor_force = 'xterm'

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

if has('nvim')
  set undodir=$HOME/.nvimundo
else
  set undodir=$HOME/.vimundo
  set ambiwidth=double
endif

set background=dark
let g:solarized_use16=1
colorscheme solarized8_flat

hi ZenkakuSpace guibg=NONE gui=underline ctermfg=LightBlue cterm=underline
match ZenkakuSpace /　/

highlight SpecialKey ctermfg=black " 不可視文字の文字色を指定する
highlight SpecialKey guibg=NONE " 不可視文字の背景なし
highlight SpecialKey ctermbg=NONE " 不可視文字の背景なし
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

command! VimShowHlItem echo synIDattr(synID(line("."), col("."), 1), "name")

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
" lambdalisue/fern.vim
" ==============================================================================
let g:fern#renderer = "nerdfont"
function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)

  nmap <buffer> - <C-h>

endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END


nnoremap <silent> <Leader>ee :<C-u>Fern <C-r>=<SID>smart_path()<CR><CR>
" nnoremap <silent> - :<C-u>Fern . -reveal=% -drawer -width=40<CR>
nnoremap <silent> - :<C-u>Fern %:h -reveal=%<CR>
" nnoremap <silent> - :<C-u>Fern . -reveal=%<CR>

" Return a parent directory of the current buffer when the buffer is a file.
" Otherwise it returns a current working directory.
function! s:smart_path() abort
  if !empty(&buftype) || bufname('%') =~# '^[^:]\+://'
    return fnamemodify('.', ':p')
  endif
  return fnamemodify(expand('%'), ':p:h')
endfunction

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
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
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

" ==============================================================================
" 'sheerun/vim-polyglot'
" ==============================================================================
" Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks=0

" ==============================================================================
" mattn/emmet-vim
" ==============================================================================
let g:user_emmet_leader_key='<C-e>'

" ==============================================================================
" neoclide/coc.nvim
" ==============================================================================
let g:coc_global_extensions = [
      \  'coc-calc'
      \, 'coc-clangd'
      \, 'coc-cmake'
      \, 'coc-diagnostic'
      \, 'coc-dictionary'
      \, 'coc-emmet'
      \, 'coc-emoji'
      \, 'coc-eslint'
      \, 'coc-fish'
      \, 'coc-git'
      \, 'coc-github'
      \, 'coc-gitignore'
      \, 'coc-highlight'
      \, 'coc-html'
      \, 'coc-json'
      \, 'coc-lists'
      \, 'coc-markdownlint'
      \, 'coc-marketplace'
      \, 'coc-omni'
      \, 'coc-pairs'
      \, 'coc-prettier'
      \, 'coc-rust-analyzer'
      \, 'coc-snippets'
      \, 'coc-styled-components'
      \, 'coc-syntax'
      \, 'coc-tasks'
      \, 'coc-tsserver'
      \, 'coc-vimlsp'
      \, 'coc-word'
      \, 'coc-yank'
      \, '@yaegassy/coc-astro'
      \, ]

let g:coc_node_path = '/Users/yotaro.shuto/.nodenv/shims/node'

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


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
nmap ma <Plug>(coc-codeaction-cursor)

" Fix autofix problem of current line
nmap <leader>ff  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Refactor :call CocAction('refactor')
command! -nargs=0 Do exe 'CocList tasks'

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
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nmap <space>e <Cmd>CocCommand explorer<CR>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>h :<C-u>CocCommand clangd.switchSourceHeader<cr>

nnoremap <silent><C-P> :CocList buffers<CR>
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

autocmd CursorHold * silent call CocActionAsync('highlight')

let g:coc_default_semantic_highlight_groups = 1

" ==============================================================================
" highlight
" ==============================================================================
" ansi = {"#073642","#dc322f","#859900","#b58900","#268bd2","#d33682","#2aa198","#eee8d5"},
" brights = {"#002b36","#cb4b16","#586e75","#657b83","#839496","#6c71c4","#93a1a1","#fdf6e3"},

highlight default link CocSemEnumMember Constant
highlight default link CocSemNamespace LineNr
highlight CocSemClass ctermfg=13 guifg=#6c71c4
highlight default link CocSemParameter Normal

highlight cocErrorSign ctermfg=9 guifg=#cb4b16
highlight cocWarningSign ctermfg=3 guifg=#b58900
highlight cocInfoSign ctermfg=4 guifg=#268bd2
highlight cocHintSign ctermfg=6 guifg=#2aa198
highlight cocErrorHighlight cterm=undercurl gui=undercurl
highlight cocWarningHighlight cterm=undercurl gui=undercurl
" highlight default link CocInlayHint Comment
highlight CocInlayHint guifg=#586E75
highlight Comment cterm=NONE gui=NONE
highlight DiffChange ctermbg=NONE guibg=NONE
highlight DiffAdd ctermbg=NONE guibg=NONE
highlight DiffDelete ctermbg=NONE guibg=NONE

highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE
highlight LineNr ctermbg=NONE
highlight Folded ctermbg=NONE
highlight default link EndOfBuffer Comment
highlight CocMenuSel ctermfg=7 ctermbg=11 guifg=#eee8d5 guibg=#657b83
highlight CocSearch cterm=bold ctermfg=6

let g:lsp_cxx_hl_use_text_props = 1


" bold
" underline
" undercurl	curly underline
" underdouble	double underline
" underdotted	dotted underline
" underdashed	dashed underline
" strikethrough
" reverse
" inverse		same as reverse
" italic
" standout
" altfont
" nocombine	override attributes instead of combining them
"
" NONE		no attributes used (used to reset it)
" Diagnostics related
" highlight CocDeprecatedHighlight guifg=NONE guibg=NONE gui=NONE
highlight CocErrorSign guifg=#cb4b16
highlight CocErrorVirtualText guifg=#cb4b16
" highlight CocErrorLine gui=undercurl
highlight CocErrorHighlight gui=undercurl

" highlight CocFadeOut  guifg=#b58900
"
highlight CocHintHighlight gui=undercurl
" highlight CocHintLine
highlight CocHintSign guifg=#2AA198
highlight CocHintVirtualText guifg=#2AA198
"
" highlight CocInfoHighlight
" highlight CocInfoLine
highlight CocInfoSign guifg=#268bd2
highlight CocInfoVirtualText guifg=#268bd2
"
" highlight CocUnusedHighlight

highlight CocWarningHighlight  gui=undercurl
" highlight CocWarningLine
highlight cocWarningSign guifg=#b58900
highlight CocWarningVirtualText guifg=#b58900


" Float window/popup related
highlight CocFloating guifg=#586E75 guibg=#073642
highlight CocFloatActive guifg=#586E75 guibg=#073642
" highlight CocFloatThumb guifg=#b58900
" highlight CocFloatSbar
" highlight CocFloatDividingLine
highlight CocErrorFloat guifg=#cb4b16
highlight CocHintFloat guifg=#2AA198
highlight CocWarningFloat guifg=#b58900

" ==============================================================================
" vim-scripts/DoxygenToolkit.vim
" ==============================================================================
let g:DoxygenToolkit_authorName="Yotaro Shuto"

" ==============================================================================
" mzlogin/vim-markdown-toc
" ==============================================================================
let g:vmt_list_item_char="-"
let g:vmt_fense_text="TOC"
let g:vmt_fense_closing_text="/TOC"
let g:vmt_fense_hidden_markdown_style="GFM"

let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']

" ==============================================================================
" github/copilot.vim
" ==============================================================================
let g:copilot_filetypes = #{
  \   markdown: v:true,
  \   text: v:true,
  \ }

lua << EOF
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
}
EOF
