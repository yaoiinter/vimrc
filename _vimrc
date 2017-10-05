" ʹ��Vundle��������

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


set showmatch                " ��ʾ����������

"��������ģʽ��,ʹ��ctrl+p/ctrl+n���滻���¼�
cnoremap <C-p>	<Up>
cnoremap <C-n>	<Down>

"�����м�¼������������ӵ�200
set history=200


if has("gui_running")
    au GUIEnter * simalt ~x  " ��������ʱ�Զ����
    set guioptions-=m       " ���ز˵���
    set guioptions-=T        " ���ع�����
	set guioptions-=L       " ������������
	set guioptions-=r       " �����Ҳ������
    set guioptions-=b       " ���صײ�������
    "set showtabline=0       " ����Tab��
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

" ҳǩ�л�
nmap <C-Right> :tabn<CR>
nmap <C-Left> :tabp<CR>
nmap <C-N> :tabe<CR>

let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "bottom"
