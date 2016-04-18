"set guifont=consolas
"set guifont=Lucida_Console:h10
set guifont=Consolas:h11
colorscheme jellybeans
set number
set hidden
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
syntax on

"pymode configuration
"prevent crazy folding

set foldlevelstart=10
let g:pymode_rope=0
let g:pymode_lint=0
" set smarttab
noremap <F8> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg


"ctags configs
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
noremap <C-F12> :!ctags --sort=foldcase --recurse --c++-kinds=+p-l --fields=+iaSKn --extra=+q .<CR>
"remapping bbd to delete the buffer without removing the split, it goes to
"previous buffer and delete the one we just left
cnoreabbrev bbd bp\|bd # 
if has("win32")
    set directory=C:\\Temp\\vim_swap
else
    set directory=/user_data/.tmp//
endif
set guioptions-=T
"remove search highlight
noremap <C-F11> :nohlsearch<CR>
"swap header cpp
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"swap buffers, first might be legacy
:nnoremap <A-n> :bnext<CR>:redraw<CR>:ls<CR>
:nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>


""make stuff?? still usefull??
nnoremap <F9> :make! -j <CR>
nnoremap <F10> :make! clean<CR>

"fixing bug of vim opening a new window after :make
set errorformat^=%-GIn\ file\ included\ from\ %f:%l:%c:,%-GIn\ file
           \\ included\ from\ %f:%l:%c\\,,%-GIn\ file\ included\ from\ %f
           \:%l:%c,%-GIn\ file\ included\ from\ %f:%l
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle aif has("win32")nd initialize
if has("win32")
    set rtp+=U:\\vimfiles\\bundle\\Vundle.vim
else
    set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'fabric-engine/kl.vim'
Plugin 'vim-scripts/pep8'
Plugin 'tikhomirov/vim-glsl'
Plugin 'vim-scripts/cmake.vim-syntax'
"Plugin 'klen/python-mode'

" pretty statusline
set encoding=utf-8
if has("gui_running")
	if has("win32")
		let g:Powerline_symbols='fancy'
	else
		let g:Powerline_symbols='fancy'
	endif
endif

call vundle#end()            " required
filetype plugin indent on    " required
