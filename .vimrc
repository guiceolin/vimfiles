set laststatus=2
set nocompatible

"Load Plugins
filetype off
source ~/.vim/.vimrc-vundle

set backspace=indent,eol,start
set history=1000

"Visuals
set showcmd     "show incomplete cmds down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set linespace=4
set showbreak=...
set wrap linebreak nolist

set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set autoindent

"Maps
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

"mapping for command key to map navigation thru display lines instead
"of just numbered lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^
nmap <Down> gj
nmap <Up> gk

"add some line space for easy reading

"disable visual bell
set visualbell t_vb=

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

""""""""""""""" INTERFACE CONFIG """"""""""""""""
let g:CSApprox_loaded = 1

"set solarized colorscheme when running vim in gnome terminal
set term=gnome-256color
silent! colorscheme solarized
set guifont=Menlo\ for\ Powerline:h14

""""""""""""""""" SHORTCUTS """""""""""""""""
"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

"map to Ctrolp buffer explore
nnoremap <leader>b :CtrlPBuffer<cr>

"map to Ctrlp style finder
nnoremap <leader>t :CtrlP<CR>
"let g:ctrlp_show_hidden = 1
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/]vendor[\/]cache[\/]|\v[\/]node_modules[\/]',
"  \ 'file': '\v.(swo)$',
"  \ }
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore "vendor/cache"
      \ --ignore "vendor/gems"
      \ -g ""'
let g:ctrlp_max_files=50000

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"bindings for ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

"key mapping for Gundo
nnoremap <F4> :GundoToggle<CR>

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

autocmd BufWritePre * :%s/\s\+$//e

"Lightline
source ~/.vim/settings/lightline.vim
"NeoComplete
source ~/.vim/settings/neocomplete.vim
" NeoSnippets
source ~/.vim/settings/neosnippets.vim

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END

function! s:syntastic()
  SyntasticCheck
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" git-nerdtree icons
let g:webdevicons_enable_nerdtree = 1

" Icons Config
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

