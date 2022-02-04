"-----------define plugins----------------------------------------------------"
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'itchyny/lightline.vim'
set laststatus=2
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'szymonmaszke/vimpyter'
Plug 'JuliaEditorSupport/julia-vim'
" Initialize plugin system
call plug#end()
"-----------end define plugins------------------------------------------------"

" Colors in your editor "
syntax on

" Highlight your search "
set hlsearch

"-----------------Recommended for Code_Saturne--------------------------------"
set tabstop=2

let fortran_do_enddo=1
let b:verilag_indent_modules=1

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" select when using the mouse "
set selectmode=mouse
if has('gui_running')
	set mouse=a
endif
set ruler

au BufNewFile,BufRead *.cuh set ft=cuda

" For use of cscope "
if filereadable("cscope.out")
	cs add cscope.out
elseif filereadable("../cscope.out")
	cs add ../cscope.out
elseif filereadable("../../cscope.out")
	cs add ../../cscope.out
endif

nmap <F3> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F2> :cs find g <C-R>=expand("<cword>")<CR><CR>

" From JF
filetype plugin on
filetype indent on
let g:load_doxygen_syntax=1
" expandtab only for CS
set tabstop=2 shiftwidth=2 expandtab
" set tabstop=2 shiftwidth=2
set smartindent
set autoindent
set nocompatible
set smartcase
set smarttab
set nobackup
set nowb
set noswapfile
set wrap "Wrap lines
autocmd BufWritePre * :%s/\s\+$//e
"colorscheme murphy
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"set colorcolumn=80
"match OverLength /\%82v.*/
"-----------------End recommended for Code_Saturne----------------------------"

"--------------------Replace, copy, past, search------------------------------"
" Enable command <Ctrl-C> <Ctrl-V>. Copy selected text to the system clipboard
vmap <C-c> "+yi
" For insertuse ctrl-shift-v
" imap <C-v> "+gPi

" Replace selected text with confirmation
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Replace all is aliased to S.
nnoremap S :%s///g<Left><Left>

"----------------end Replace, copy, past, search------------------------------"


let g:auto_save = 1  " enable AutoSave on Vim startup

set number " enable lines numbers

" Change <leader> key from \ to !
let mapleader = "!"

" Enable spell checking. Called by <z=>. To turn it off :set nospell
" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>


" ------------------------LaTex setting---------------------------------------"
" Save and run make command
map <leader>c :!make pdf<CR><CR><CR>

" Open corresponding .pdf or preview
map <leader>p :!qpdfview %:r.pdf<CR><CR>
" ---------------------end LaTex setting--------------------------------------"


"-----------delete local folders----------------------------------------------"
let g:netrw_localrmdir='rm -rf'
"-----------end delete local folders------------------------------------------"

"---------Keeps netrw's browsing dir and Vim's current dir in sync------------"
"--------Searching in the folder recursively  by :vim foo **/* | cw-----------"
let netrw_keepdir = 0
"-----End keeps netrw's browsing dir and Vim's current dir in sync------------"


"-----------------------Setup for vimtex--------------------------------------"
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

set conceallevel=2
let g:tex_conceal='abdgm'

" FOLDING "
set foldlevel=0
let g:vimtex_format_enabled=1
let g:vimtex_fold_enabled =1
let  g:vimtex_fold_types = {
           \ 'envs' : {'enabled' : 0},
           \ 'items' : {'enabled' : 0},
           \}
" autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!
"--------------------End setup for vimtex-------------------------------------"

" change split size by mouse
set mouse=n

"-----------Change cursor in insert mode--------------------------------------
"Ps = 0  -> blinking block.
"Ps = 1  -> blinking block (default).
"Ps = 2  -> steady block.
"Ps = 3  -> blinking underline.
"Ps = 4  -> steady underline.
"Ps = 5  -> blinking bar (xterm).
"Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
"--------------------End changecursor-----------------------------
