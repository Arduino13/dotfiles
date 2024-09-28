call plug#begin()
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'itmammoth/doorboy.vim'
Plug 'scrooloose/nerdtree'
Plug 'Asheq/close-buffers.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()
call glaive#Install()

colorscheme srcery
set number
set relativenumber
set colorcolumn=80
set tabstop=4
set shiftwidth=4

highlight MatchParen guibg=blue guifg=yellow

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
set autoindent
set smartcase
set ignorecase
set incsearch
set hlsearch
set noswapfile
set showmode
set nowrap
set clipboard=unnamedplus
set laststatus=2	
set pastetoggle=<F2>	
set mouse=a
set completeopt=menuone,preview


" Ctrl+c and Ctrl+j as Esc
" Ctrl-j is a little awkward unfortunately:
" So we also map Ctrl+k
inoremap <C-j> <Esc>

inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <Esc>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>
xnoremap <C-c> <Esc>
cnoremap <C-c> <Esc>
onoremap <C-c> <Esc>
lnoremap <C-c> <Esc>
tnoremap <C-c> <Esc>

" Can use ; and : interchangeably
nnoremap ; : 

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

hi Visual guifg=#000000 guibg=#FFFFFF
map <C-n> :NERDTreeToggle<CR>
map <C-P> :Files<CR>
map <C-F> :Ag<CR>
map <C-G> :Tags<CR> 

" guifg=#abb2bf 
hi TabLine    gui=NONE guibg=#3e4452 guifg=#abb2bf cterm=NONE term=NONE ctermfg=black ctermbg=white
