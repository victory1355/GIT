source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"++++++++++++++++++++++++++++++++++++



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
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction



"=======================================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=D:\Vim\vimfiles\bundle\Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

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



"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"           statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


"           file system
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

"            color 
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

"            file structure
Plugin 'majutsushi/tagbar'

"            buffers
Plugin 'minibufexpl.vim'

"            comments
Plugin 'scrooloose/nerdcommenter'

"            auto pairs
Plugin 'auto-pairs'






"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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


"           victory的配置文件





"=====================================================================
"             加密 encrption
set noundofile 
set nobackup


"             colortheme

"2017/11/4
set background=dark
colorscheme molokai
call togglebg#map("<F5>")

"           statusline

autocmd vimenter * AirlineTheme powerlineish
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_detect_spell=1
let g:airline_detect_paste=1
let g:airline_detect_spelllang=1
set laststatus=2

"              enconding  and font

set encoding=utf-8

if has("gui_running")
	if has("gui_gtk2")
	:set guifont=Luxi\ Mono\ 12
	elseif has("x11")
	" Also for GTK 1
	:set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
	elseif has("gui_win32")
	:set guifont=Consolas:h15:cANSI:qDRAFT
	endif
endif


"             filsystem

autocmd VimEnter * NERDTree
let NERDTreeWinPos="right"
let NERDTreeStatusline=-1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTree<CR>
let NERDTreeShowLineNumbers=1




"            other configured

set number
"2017/11/3
set cursorline
"2017/11/3
set autoindent
set cmdheight=2
set fileformat=unix


"            windows

"2017/11/3
set wh=40
set guioptions-=m
set guioptions-=T
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

"            syntax
syntax on  

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"         search 

"         file structure
nmap <F8> :TagbarToggle<CR>

"         buffers









