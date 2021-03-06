" 永続化
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" プラグイン
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  endif
endif

call plug#begin('~/.vim/plugged')
  Plug 'Shougo/neomru.vim'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle'] }"
  Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
  Plug 'Shougo/unite.vim'
  Plug 'ujihisa/unite-colorscheme'
  Plug 'ConradIrwin/vim-bracketed-paste'
"補完
  Plug 'Shougo/neocomplete.vim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'zchee/deoplete-jedi'
  Plug 'davidhalter/jedi-vim'
" Plug 'klen/python-mode'
  Plug 'nvie/vim-flake8'
  Plug 'hynek/vim-python-pep8-indent'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/lightline.vim'
  Plug 'KeitaNakamura/railscasts.vim'
  Plug 'KeitaNakamura/lightline-railscasts.vim'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'w0ng/vim-hybrid'
  "Markdown
  Plug 'tpope/vim-markdown'
  Plug 'plasticboy/vim-markdown'
  Plug 'kannokanno/previm'
  Plug 'tyru/open-browser.vim'
  Plug 'cocopon/iceberg.vim'
  " pyenv, virtualenv
  Plug 'miyakogi/vim-virtualenv'
  Plug 'lambdalisue/vim-pyenv'
call plug#end()

let g:jedi#force_py_version = 3
autocmd FileType python setlocal completeopt-=preview

set number
set ruler
set title
set tabstop=4
set expandtab
set hidden
set noswapfile
set autoindent
set smartindent 
"vimにコピペしたとき、コメントアウトや余計な改行をさせない
set paste
set backspace=indent,eol,start
"light-line.vim
let g:lightline = {}
let g:lightline.colorscheme = 'railscasts'
set laststatus=2

"color scheme
colorscheme neodark
set background=dark
" neodark
let g:neodark#use_256color = 0
let g:neodark#background = '#202020'
let g:neodark#terminal_transparent = 0
let g:neodark#solid_vertsplit = 0 

"
" About markdown
"
" plasticboy/vim-markdown
" 折りたたみの禁止
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" kannokanno/previm
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'
" ctrl pでプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>

" tyru/open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"
" NERFTree
"
" 不可視ファイルを表示する
let NERDTreeShowHidden = 1
" ツリーと編集領域を移動する
nmap <Leader><Tab> <C-w>w
" ファイルが指定されていなければNERD treeを有効にする
if argc() == 0
  let g:nerdtree_tabs_open_on_console_startup = 1
end

" deoplete
"let g:deoplete#enable_at_startup = 1
"inoremap <expr><Tab> pumvisible() ? "\<DOWN>" : "\<Tab>"
"inoremap <expr><S-Tab> pumvisible() ? "\<UP>" : "\<S-Tab>"
"let g:python3_host_prog = '/Users/akira/.pyenv/shims/python'
"let g:deoplete#sources#jedi#python_path = '/Users/akira/.pyenv/shims/python'

" 補完
let g:jedi#auto_initialization = 1
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0

"if !exists('g:neocomplete#force_omni_input_patterns')
"        let g:neocomplete#force_omni_input_patterns = {}
"endif

" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
