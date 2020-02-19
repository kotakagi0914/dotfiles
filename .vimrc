" --- setting ---
syntax on 

set number
set hlsearch
set ruler
set noswapfile
set showmatch
set expandtab
set tabstop=4
set laststatus=2
set showtabline=2
set noshowmode
set cursorline
" set listchars=tab: -,trail:-,nbsp:%,eol::$$
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" set clipboard+=unnamed
set clipboard=unnamed,autoselect
" set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/segments/vim/

inoremap <silent> jj <ESC>
noremap ; :
noremap : ;
" set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" smartindentで増減する幅
set shiftwidth=4
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" enable backspace
set backspace=indent,eol,start

" --- macvim setting ---
colorscheme molokai

" --- bundle ---
if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    Bundle 'gmarik/vundle'
    Bundle 'https://github.com/altercation/vim-colors-solarized.git'
    Bundle 'https://github.com/Shougo/vimshell.git'
    Bundle 'https://github.com/Shougo/vimproc'
    Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

    " Powerline
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
endif

