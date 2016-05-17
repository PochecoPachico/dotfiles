set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	"insert here your Neobundle plugins"
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'Shougo/neomru.vim'
	NeoBundle "Shougo/vimproc"
	NeoBundle 'tpope/vim-fugitive'
	NeoBundle 'mattn/emmet-vim'
	call neobundle#end()
endif
 
filetype plugin indent on

set number
set cursorline
set cursorcolumn
set title
set showmatch
set hlsearch

" バックスペースを空白、行末、行頭でも使用可能にする
set backspace=indent,eol,start

"回り込み
set whichwrap=b,s,[,],<,>

" 行番号ハイライト
hi CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE

" スクロールに余裕を
set scrolloff=3

" タブ設定
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" 方向キーを使えないようにする
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" タブ移動
nnoremap <Space>p :tabprevious<CR>
nnoremap <Space>n :tabnext<CR>
nnoremap <Space>c :tabnew<CR>

"文字コード関連
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932

"ヤンクした内容をクリップボードへ
set clipboard+=unnamedplus,unnamed

"キーマップ変更
inoremap kj <ESC>

" insertモードでカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"検索ハイライトを消す
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"Unite
"バッファ一覧
noremap <C-P> :Unite buffer<CR>

"ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>

"最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>

"sourcesを今開いているファイルのディレクトリとする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

"ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')

"ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

"ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> <C-g>  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
"カーソル位置の単語をgrep検索
nnoremap <silent> <C-c> :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
"grep検索結果の再呼出
nnoremap <silent> <C-r>  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"色設定 
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

"音設定
set visualbell t_vb=
set noerrorbells


" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" ファイルを閉じともundoを可能にする
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif
	

" power line
" for arch linux
let $PYTHONPATH='/usr/lib/python3.5/site-packages/'
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set showtabline=2
set noshowmode

" MacVim
if has("gui_macvim")
	set columns=110
	set lines=40
	set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
else
	" gVim
	if has('gui_running')
		set columns=100
		set lines=40
		set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
	endif
endif

