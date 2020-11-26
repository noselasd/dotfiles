filetype on
filetype plugin on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab 
set scrolloff=5

set nocompatible
syntax on
set statusline=[%n]\ %m%r%h%w%q\ [%{&ff}:%{&fenc}]\ [CWD:\ %{getcwd()}][%f]\ %{&paste?'\ [paste]':'\ '}%=[%l][%c]\ 0x%04B\ %*[%p%%]
set laststatus=2
"uncomment to not highlight matching parens/brackets/etc.
""let loaded_matchparen = 1
"case insensitive search
set ignorecase
"if search pattern have a capital, override ignorecase (exact search)
set smartcase
"Don't higlight all matches
set nohlsearch
set smartindent

colorscheme noselasd
set ofu=syntaxcomplete#Complete
"opens preview window on completion with C-X C-O
set completeopt+=preview
"Shows completion even with only 1 match
set completeopt+=menuone

map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+f .<CR>
map <F9> :TlistToggle <CR>
let Tlist_Use_Right_Window   = 1
let Tlist_Sort_Type = "name"
set tags=./tags;/
let g:netrw_browse_split=4      " Open file in previous buffer
nmap <F10> :TagbarToggle<CR>
nmap <F11> :NERDTreeToggle<CR>

"For ctags in older VIM:
"map <C-]> :tselect /<C-R><C-W><CR>
"map jj in insert mode to <Escape>
inoremap jj <Esc>

"Do autocomplete with tab, for SuperTab plugin
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
set hidden
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

"use ack instead of grep
set grepprg=ack\ --cpp\ --cc\ --perl\ --python\ --make
" _g to grep(ack)
nmap _g :grep <C-R>=expand("<cword>")<CR><CR>:belowright copen<CR><CR>

"show file completions
set wildmenu

"Highlight when going over 80 characters per line
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

"have clang_autocomplete auto select and insert the 1. entry
"let g:clang_auto_select=2
"let g:clang_complete_macros=1

"map the key left of Enter to tagselect
map ¨ :ts <C-R>=expand("<cword>")<CR><CR>
"map CTRL-p to the CtrlP plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

"ignore these files in CtrlP
let g:ctrlp_custom_ignore = {
    \ 'file': '\.d$\|\.o$\|\.a$'
\ }
" use , as leader
let mapleader=","
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Use relative line numbers, but show current line number
set relativenumber
set number

" tag completion on html files
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"use pathogen
execute pathogen#infect()
" Use relative line numbers, but show current line number
set relativenumber
set number

if filereadable(".vim.custom")
    so .vim.custom
endif

" make git commit start at top
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
