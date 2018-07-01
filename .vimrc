" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Mar 25
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" Switc syntax highlighting on, when the terminal has colors


"======================================================================================================


"     bundle
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"-----------------------------------------------------------------

"      complete
Plugin 'Valloric/YouCompleteMe'



"      statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


"      colortchmeme
Plugin 'molokai'
Plugin 'altercation/vim-colors-solarized'


"      pairs
Plugin 'auto-pairs'


"      windows
Plugin 'ZoomWin'


"      content
Plugin 'scrooloose/nerdtree'


"      translation
Plugin 'ianva/vim-youdao-translater'


"      comment
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'

"-----------------------------------------------------------------------



" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}






" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"---------------------------------------------------------------------

"    2017/11/9          my configure
set nu
set autoindent
set showcmd
set cursorline
set cmdheight=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" keep a backup file (restore to previous version)
set noundofile		" keep an undo file (undo changes after closing)
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch




"        color
syntax enable
set background=light
colorscheme molokai
call togglebg#map("<F5>")


"                       我的vimrc配置文件

"         mouse
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
set mouse=a
endif



"         Airline
autocmd vimenter * AirlineTheme powerlineish
" the separator used on the left side >
let g:airline_left_sep='>'
" the separator used on the right side >
let g:airline_right_sep='<'



"       youcompleteme
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'


"        tranlation
vnoremap <silent> <C-T> <Esc>:Ydv<CR> 
nnoremap <silent> <C-T> <Esc>:Ydc<CR> 
noremap <leader>yd :Yde<CR> 

"        comment
let g:mapleader = ","
let loaded_nerd_comments=1
let maplocalleader = ","




