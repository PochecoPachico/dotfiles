set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	"insert here your Neobundle plugins"
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'Shougo/unite.vim'
	call neobundle#end()
endif
 
filetype plugin indent on

set number
set cursorline
set cursorcolumn
set title
set showmatch
set hlsearch

"バックスペースを空白、行末、行頭でも使用可能にする
set backspace=indent,eol,start

"回り込み
set whichwrap=b,s,[,],<,>

"マウス操作を可能に
set mouse=a

"行番号ハイライト
hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=NONE

" タブ設定
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

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

" 検索ハイライトを消す
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"色設定
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

"音設定
set visualbell t_vb=
set noerrorbells

nnoremap <silent><C-e> :NERDTreeToggle<CR>

" power line
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

