set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/dein.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let deinpath='~/.vim/bundle/dein.vim'
let deinplugins='~/.vim/deinplugins'
set runtimepath+=deinpath
if dein#load_state(deinplugins)
    call dein#begin(deinplugins)
    call dein#add(deinpath)

    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    call dein#add('Shougo/vimshell.vim')
    
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on    " required

syntax on 			" 语法高亮
filetype plugin on
set number 			" 显示行号
set cursorline 		" 突出显示当前行
set softtabstop=4 	" 使得按退格键时可以一次删掉 4 个空格
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set tabstop=4 		" 设定 tab 长度为 4
set expandtab
set hlsearch " 搜索时高亮显示被找到的文本
set smartindent " 开启新行时使用智能自动缩进

map <F2> :NERDTree <CR>
map <F3> :VimShellPop <CR>
map! <F3> <Esc>:VimShellPop <CR>
