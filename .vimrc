"-------------------------------------------------------------------------------------
" general
"-------------------------------------------------------------------------------------
set nocompatible    "取消兼容模式
set history=50        "历史记录条数
set number            "显示行号
set confirm            "在处理未保存或只读文件时，弹出确认提示


"-------------------------------------------------------------------------------------
" colors
"-------------------------------------------------------------------------------------
syntax on             "语法高亮
set cursorline        "高亮显示当前行，当前行显示一条长线
set background=dark    "背景深色显示
colorscheme gruvbox

"-------------------------------------------------------------------------------------
" Vim UI
"-------------------------------------------------------------------------------------
set ruler            "在状态栏显示光标位置
set mouse=v            "取用鼠标功能，可以用鼠标定位光标位置
set lazyredraw        " do not redraw while executing macros (much faster)
set cmdheight=2        "底部用于输入命令的命令行的高度，默认为1
set backspace=2        "使退格键正常处理indent,start等
set scrolloff=10    "光标倒屏幕顶端/底端保留的行数，等于该函数则滚动
set laststatus=2    "显示状态栏信息

"-------------------------------------------------------------------------------------
" text formatting/layout
"-------------------------------------------------------------------------------------
set ai              "autoindent（继承前一行的缩进方式，适用于多行注释）
set si              "smartindent（为C程序提供自动缩进）
set cindent         "C风格缩进
set tabstop=4       "tab键宽度
set shiftwidth=4    "统一缩进
set softtabstop=4   "统一缩进
set noexpandtab       "expandtab 使用空格替换 TAB ; noexpandtab 实际使用tab字符，不要用空格字符替换
set smarttab        "行首段首自动使用tab


"-------------------------------------------------------------------------------------
" text searching/matching
"-------------------------------------------------------------------------------------
set showmatch        "显示匹配符号，如成对的(),{}等
set matchtime=5        "1/10 second to show the matching paren
set ignorecase        "搜索时忽略大小写
set nohlsearch        "搜索字符串不要高亮显示（即敲回车以后）
set incsearch        "搜索输入字符串过程中高亮显示（即未敲回车）

"-------------------------------------------------------------------------------------
" taglist, winManager
"-------------------------------------------------------------------------------------
let Tlist_Show_One_File=1        "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1     "如果taglist窗口是最后一个窗口，则退出vim
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"-------------------------------------------------------------------------------------
" plug
"-------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
call plug#end()


"-------------------------------------------------------------------------------------
" Nerdtree config
"-------------------------------------------------------------------------------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"-------------------------------------------------------------------------------------
" Coc-Clangd config
"-------------------------------------------------------------------------------------
inoremap <silent><expr> <Tab>
                \ coc#pum#visible() ? coc#pum#confirm():
                \ "\<C-g>u\<Tab>\<c-r>=coc#on_enter()\<CR>"

"-------------------------------------------------------------------------------------
" status
"-------------------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
