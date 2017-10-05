" 使用Vundle来管理插件

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Plugin 'klen/python-mode'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin on
filetype indent on
set nu

colorscheme base16-default-dark 
set guifont=Courier_New:h12
syntax on


set showmatch                " 显示括号配对情况

"在命令行模式下,使用ctrl+p/ctrl+n来替换上下键
cnoremap <C-p>	<Up>
cnoremap <C-n>	<Down>

"命令行记录命令的条数增加到200
set history=200


if has("gui_running")
    au GUIEnter * simalt ~x  " 窗口启动时自动最大化
    set guioptions-=m       " 隐藏菜单栏
    set guioptions-=T        " 隐藏工具栏
	set guioptions-=L       " 隐藏左侧滚动条
	set guioptions-=r       " 隐藏右侧滚动条
    set guioptions-=b       " 隐藏底部滚动条
    "set showtabline=0       " 隐藏Tab栏
endif

"let g:pymode_python = 'python3'

set pythonthreedll=python36.dll

let g:airline_left_sep = '>'
let g:airline_right_sep = '<'
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'

let g:airline_detect_spell=1
let g:airline_theme='dark'


map <F2> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" 页签切换
nmap <C-Right> :tabn<CR>
nmap <C-Left> :tabp<CR>
nmap <C-N> :tabe<CR>

let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "bottom"
