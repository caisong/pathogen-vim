set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

filetype off
execute pathogen#infect()
"set rtp+=$VIMRUNTIME/vimfiles/bundle/Vundle.vim
"call vundle#begin('$VIMRUNTIME/vimfiles/bundle')
"Plugin 'gmarik/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'vim-scripts/SuperTab'
"Plugin 'vim-scripts/TagHighlight'
"Plugin 'vim-scripts/Tagbar'
"Plugin 'vim-scripts/OmniCppComplete'
"Plugin 'scrooloose/syntastic'
"Plugin 'klen/python-mode'
"Plugin 'vim-scripts/molokai'
"Plugin 'vim-scripts/c.vim'
" Plugin 'Valloric/YouCompleteMe'
"call vundle#end()
syntax on
filetype plugin indent on
set noundofile
set tabstop=4
set et
set autoindent
set shiftround "round indent to multiple of 'shiftwidth'
set nu
set ai
set si
set tw=79
set expandtab "insert spaces when hitting TABS
set sw=4
set softtabstop=4 "indert/delete 4 spaces when hit tabs
set incsearch
set showmatch
set matchtime=5
set ignorecase
set nobackup
set nowb
set nowrap
if has('gui_running')
    set background=light
    set guioptions-=T "no toolbar
    colorscheme solarized
    set guifont=Consolas:h14:cDEFAULT
else 
    colorscheme molokai
endif

set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,big5,latin1
let autosave=5

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<cr>
" Tagbar
let g:tagbar_width=20
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 设置快捷键将系统剪贴板内容粘贴至 vim
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader>pa %
