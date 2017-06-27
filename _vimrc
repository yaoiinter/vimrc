source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim

" 字体、字号
set guifont=Consolas:h10

behave mswin
" 编码设置

set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set ffs=dos,unix,mac
set ff=dos                 "设置文件格式为UNIX格

set nocompatible

"一般配置
syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on
set tabstop=4                " 设置tab键的宽度
set shiftwidth=4             " 换行时行间交错使用4个空格
set autoindent               " 自动对齐
set showmatch                " 显示括号配对情况

if has("gui_running")
    au GUIEnter * simalt ~x  " 窗口启动时自动最大化
    set guioptions-=m       " 隐藏菜单栏
    set guioptions-=T        " 隐藏工具栏
	set guioptions-=L       " 隐藏左侧滚动条
	set guioptions-=r       " 隐藏右侧滚动条
    "set guioptions-=b       " 隐藏底部滚动条
    "set showtabline=0       " 隐藏Tab栏
endif

set writebackup              " 设置无备份文件
set nobackup
set autochdir                " 设定文件浏览器目录为当前目录
"设定代码折叠
"set nowrap                  " 设置不自动换行
set foldmethod=manual        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠

set laststatus=2                          " 开启状态栏信息
set cmdheight=1                           " 命令行的高度，默认为1，这里可以重设

" 状态行显示的内容 [包括系统平台、文件类型、坐标、所占比例、时间等]
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %y%r%m%*%=\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}

"按F8、F9切换标签页
nnoremap <silent> <C-p> :tabp<CR>
nnoremap <silent> <C-n> :tabn<CR>
"按F12关闭当前标签
nnoremap <silent> <F12> :tabc<CR>
"Alt+n 切换标签页
function! BufPos_ActivateBuffer(num)
    let l:count = 1
    for i in range(1, bufnr("$"))
        if buflisted(i) && getbufvar(i, "&modifiable")
            if l:count == a:num
                exe "buffer " . i
                return
            endif
            let l:count = l:count + 1
        endif
    endfor
    echo "No buffer!"
endfunction

"gvim 按F2显隐菜单及工具栏
set guioptions-=m
set guioptions-=T
"map <silent> <F2> :if &guioptions =~# 'T' <Bar>
"        \set guioptions-=T <Bar>
"        \set guioptions-=m <bar>
"    \else <Bar>
"        \set guioptions+=T <Bar>
"        \set guioptions+=m <Bar>
"    \endif<CR>

"个人插件配置
"""""""""""""""""""""
"taglist配置
set tags=tags;
"set autochdir
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
filetype on
let winManagerWindowLayout = 'FileExplorer|TagList'
nnoremap <silent> <F10> :TlistToggle<CR>
"""""""""""""""""""""
"jsbeautifier插件,格式化js代码,format your JavaScript source code
"快捷方式 \+ff
"""""""""""""""""""""
"配置NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
"""""""""""""""""""""
"配置插件calendar
"写日志使用
let g:calendar_diary = 'D:\workdiary\'
let g:calendar_navi_label = 'Yesterday,Today,Tomorrow'
let g:calendar_focus_today = 1
nnoremap <silent> <F3> :Calendar<CR>
nnoremap <silent> <F4> :q<CR>
"""""""""""""""""""""
"配置颜色方案
set nu
set background=dark
"set background=light
"colorscheme solarized  "设置颜色方案
colorscheme molokai  "设置颜色方案

let g:ragtag_global_maps = 1
"""""""""""""""""""""
"配置vimwiki
"let wiki = {}
"let wiki.path = 'E:/资料/'
"let wiki.path_html = 'E:/资料/html/'
"let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp','javascript' : 'javascript'}
"let g:vimwiki_list = [{'path':'D:/scjwiki/','path_html':'D:/scjwiki/scj_html/'},
"		\ wiki]
"txtbroswer配置
au BufRead,BufNewFile *.txt setlocal ft=txt 

"支持xsl
au BufRead,BufNewFile *.xsl setlocal ft=html 
"将.prc文件作为sql格式处理
au BufRead,BufNewFile *.prc setlocal ft=sql 

"在命令行模式下,使用ctrl+p/ctrl+n来替换上下键
cnoremap <C-p>	<Up>
cnoremap <C-n>	<Down>

"命令行记录命令的条数增加到200
set history=200

"增加常用路径
"set path+=e:/s2ms/ets/**
"set path+=e:/s2ms/xsl/**
"set path+=e:/s2ms/xml/**
"set path+=e:/s2ms/web/**

"set path+=e:/s2zh/ets/**
"set path+=e:/s2zh/xsl/**
"set path+=e:/s2zh/xml/**
"set path+=e:/s2zh/web/**
set path+=e:/zh2009/ets/**
set path+=e:/zh2009/xsl/**
set path+=e:/zh2009/web/**

" Go to last file(s) if invoked without arguments.
"autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    "\ call mkdir($HOME . "/.vim") |
    "\ endif |
    "\ execute "mksession! " . $HOME . "/.vim/Session.vim"

"autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    "\ execute "source " . $HOME . "/.vim/Session.vim"

"完善自动补全功能
"let g:ycm_min_num_of_chars_for_completion = 3 
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_complete_in_comments = 1
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" 比较喜欢用tab来选择补全...
"function! MyTabFunction ()
    "let line = getline('.')
    "let substr = strpart(line, -1, col('.')+1)
    "let substr = matchstr(substr, "[^ \t]*$")
    "if strlen(substr) == 0
        "return "\<tab>"
    "endif
    "return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
"endfunction
"inoremap <tab> <c-r>=MyTabFunction()<cr>

"个人快捷方式设定
"在插入模式下的快捷方式 2016-03-04 modify by yy
inoremap <C-a>	 	 <Esc>A
"inoremap <M-o>       <Esc>o 2016-03-04 modify by yy
inoremap <C-j>       <Down>
"使用ctrl+h来打开bufferlist
nnoremap <C-h>	     :ls<CR>

"dbext的配置
let g:dbext_default_profile_ORA_Extended = 'type=ORA:user=S2FINAL:passwd=1:srvname=(description=(address=(protocol=TCP)(host=192.168.90.22)(port=1521))(connect_data=(server=dedicated)(service_name=s2erpr2)))'

"配置下airline

let g:airline_left_sep = '~'
let g:airline_right_sep = '~'
let g:airline_section_b = '%{strftime("%Y-%m-%d\ -\ %H:%M\ ")}'
"let g:airline_section_b = '%{strftime("%y/%m/%d")}'
let g:airline_section_y = 'Buffer: %{bufnr("%")}'

"简单的snippet实现
autocmd FileType javascript :iabbrev <buffer> for for(var i=0; i<xx.length ; i++){}<left><CR><CR><esc><up><up>f\x\
autocmd FileType html :iabbrev <buffer> for for(var i=0; i<xx.length ; i++){}<left><CR><CR><esc><up><up>f\x\
autocmd FileType xsl :iabbrev <buffer> for for(var i=0; i<xx.length ; i++){}<left><CR><CR><esc><up><up>f\x\
