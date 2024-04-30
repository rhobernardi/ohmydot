" Para mais detalhes sobre as configurações usar :h nomeDaConfig
" ex da opcao 'title' -> :h title


"   ◤                        ◥   "
"         Plugin Manager         "
"            Vim Plug            "
"   ◣                        ◢   "


" Automatically install Vim Plug (plugin manager)
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC "instala automaticamente os plugins
endif

" :PlugInstall to install listed plugins
call plug#begin('~/.vim/plugged')
    Plug 'bling/vim-airline'                "bottom tab with status
    Plug 'vim-airline/vim-airline-themes'   "airline themes
    Plug 'tpope/vim-surround'               "edit delimiter characters
    Plug 'raimondi/delimitmate'             "close delimiter characters
    Plug 'sjl/gundo.vim'                    "undo tree
    Plug 'scrooloose/nerdtree'              "file tree
    Plug 'Xuyuanp/nerdtree-git-plugin'
    "Plug 'shougo/neocomplete.vim'          "auto-complete - vim 7.4+
    Plug 'scrooloose/nerdcommenter'         "comment easily

    " Themes
    Plug 'tomasr/molokai'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'rakr/vim-one'
call plug#end()


"   ◤                        ◥   "
"         CONFIGURATIONS         "
"   ◣                        ◢   "


" Set leader from / to ,
let mapleader = ","
let g:neocomplete#enable_at_startup = 1
let g:NERDSpaceDelims = 1 "add espace in comment command


"   ◤        ◥   "
"      MAPS      "
"   ◣        ◢   "
" Leader + f change between absolute and relative numbers
map <leader>f :set relativenumber!<CR>

" Y acts as D e C, copies until the end of the line instead of act like yy
map Y y$

" toggle gundo plugin(see undos tree)
nnoremap <leader>u :GundoToggle<CR>

" Leader + space removes searches highlights
nnoremap <leader><space> :nohlsearch<CR>

" Shortcut hide/show fold with space key
nnoremap <space> za

" Crtl + n open nerdtree
map <C-n> :NERDTreeToggle<CR>

" Shut down arrows (only h, j, k, l)
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>


"   ◤        ◥   "
"     COLORS     "
"   ◣        ◢   "

" One theme
" try "Detecta se existe o tema One
    " set termguicolors "caso nao habilite 256 cores
    " set t_Co=256
    " colorscheme one
    " " set background=light
    " set background=dark
    " let g:rehash256 = 1 "terminal de 256 cores
    " let g:one_original = 1
" catch /^Vim\%((\a\+)\)\=:E185/
    " :silent! "Se nao existir, nao faz nada
" endtry

" Dracula theme
" try "Detecta se existe o tema Dracula
    " set termguicolors "caso nao habilite 256 cores
    " set t_Co=256
    " colorscheme dracula
    " " set background=light
    " " set background=dark
    " let g:rehash256 = 1 "terminal de 256 cores
    " let g:dracula_original = 1
" catch /^Vim\%((\a\+)\)\=:E185/
    " :silent! "Se nao existir, nao faz nada
" endtry

" Molokai theme
try "Detecta se existe o tema molokai
    " set termguicolors "caso nao habilite 256 cores
    " set t_Co=256
    colorscheme molokai
    let g:rehash256 = 1 "config for airline: 256 colors terminal
    let g:molokai_original = 1
catch /^Vim\%((\a\+)\)\=:E185/
    :silent! "If doesn't exist, does nothing
endtry

" Vim AirLine Plugin Theme (bottom bar)
" let g:airline_theme='one'
" let g:airline_theme='dracula'
let g:airline_theme='molokai'
set noshowmode "disable bottom informations i.e. -- INSERT -- , reduntant


"   ◤             ◥   "
"     INDENTATION     "
"   ◣             ◢   "
filetype plugin indent on
set autoindent                  "automatic indentation
set cindent                     "C language indentation
set smartindent                 "general identation
set backspace=indent,eol,start  "new line when creating {}
let delimitMate_expand_cr=1
set expandtab                   "use retab to replace tabs for spaces
set shiftwidth=4                "tab width in indentation
set tabstop=4                   "tab 4 spaces


"   ◤            ◥   "
"       GENERAL      "
"   ◣            ◢   "
syntax enable       "ative highlight de sintaxe
set mouse=a         "enable mouse usage
set number          "numero da linha
set relativenumber  "inicia com numero relativo da linha (<leader> + f desliga)
set cursorline      "highlight na linha atual
set wildmenu        "menu de selecao de sugestoes no modo comando
set showmatch       "mostra match de paratensis, chaves, colchetes...
set lazyredraw      "melhoria de desempenho
set history=1000    "historico de comandos
set showcmd         "mostra comandos sendo digitados na barra inferior
set hidden          "melhor uso de buffers na mesma janela
set backup          "gera arquivo de backup
set ttyfast         "melhoria de desempenho, ver :h ttyfast
set title           "muda o titulo do terminal
set encoding=utf-8  "codificacao utf-8
set autoread
set colorcolumn=80  "coluna lateral
highlight ColorColumn ctermbg=235 guibg=#2c2d27
set list "Mostrar tabs e trails(como o caracter •)
set listchars=tab:•\ ,trail:•,extends:»,precedes:« "Extends aparecem com a funcao nowrap ativada

" Retorna a posicao que estava quando o arquivo foi fechado
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif


"   ◤        ◥   "
"      UNDO      "
"   ◣        ◢   "
" Make sure Undo folder exists
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir "undos folder
set undofile "allows undos history be saved in a file
set undolevels=1000 "undo history size


" Searches
set incsearch   "highlight when searching
set hlsearch    "highlight after search


" Folds - hide lines
set foldenable          "enable folds
set foldlevelstart=10   "nivel inicial de folding, pra nao dobrar tudo no inicio, quanto mais {{, maior o nivel
set foldnestmax=10
set foldmethod=syntax   "uses sintax to hide: {} in C

