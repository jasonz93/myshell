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

Plugin 'godlygeek/tabular' " vim-markdown的依赖
Plugin 'plasticboy/vim-markdown' " markdown语法高亮
" Plugin 'suan/vim-instant-markdown' " markdown实时预览(Node.Js)
Plugin 'iamcco/markdown-preview.vim' " markdown实时预览(Python)
Plugin 'scrooloose/nerdtree' " 目录树
Plugin 'Xuyuanp/nerdtree-git-plugin' " 目录树Git插件
Plugin 'jistr/vim-nerdtree-tabs' "目录树多Tab辅助
Plugin 'Shougo/dein.vim' " 另一个插件管理
Plugin 'Valloric/YouCompleteMe' " 自动补全
Plugin 'bling/vim-airline' " 状态栏美化
Plugin 'gorodinskiy/vim-coloresque' " CSS色值高亮
Plugin 'bronson/vim-trailing-whitespace' " 标红行尾无用空格
Plugin 'Valloric/MatchTagAlways' " 高亮匹配HTML标签
Plugin 'gcmt/wildfire.vim' " 选择代码块
Plugin 'alvan/vim-closetag' " 自动闭合HTML标签

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

    call dein#add('Shougo/vimproc.vim', {'build': 'make'}) " 后台执行插件
    call dein#add('Shougo/vimshell.vim') " Shell插件

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on    " required
filetype on

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
set laststatus=2    " 永久显示状态栏
set scrolloff=3   " 底部始终留3行（自动滚动）

" markdown-preview
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" VimShell
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

" 当NERDTree是最后一个buffer时自动退出
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set completeopt=longest,menu

let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

map <F3> :NERDTreeTabsToggle<CR>
map <F2> :VimShellPop <CR>
map! <F2> <Esc>:VimShellPop <CR>

inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap } {}<ESC>i
inoremap { {<CR>}<Esc>O

"设置跳出自动补全的括号
func SkipPair()  
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
        return "\<ESC>la"  
    else  
        return "\t"  
    endif  
endfunc  
" 将tab键绑定为跳出括号  
inoremap <TAB> <c-r>=SkipPair()<CR>

