    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif


    call plug#begin('~/.vim/bundle')
    " Service plugins first
    Plug 'junegunn/seoul256.vim'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-repeat'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-unimpaired'

    " Highlights the matching HTML tag when the cursor
    " is positioned on a tag.
    Plug 'gregsexton/MatchTag'

    " Automatically add closing tags in html-like formats
    Plug 'alvan/vim-closetag'

    " GIT
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'} 
    source ~/.vim/cocplugin.vim

    " CS
    Plug 'tpope/vim-surround'


    " File
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
    Plug 'tpope/vim-vinegar'

    " Snippets
    " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        " Plug 'Shougo/deoplete.nvim'
        " Plug 'roxma/nvim-yarp'
        " Plug 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1
    " call deoplete#enable()

    Plug 'ncm2/ncm2-cssomni'
    Plug 'ncm2/ncm2-tern'
    Plug 'ncm2/ncm2-jedi'
    Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
    Plug 'kristijanhusak/deoplete-phpactor'
    Plug 'phpactor/ncm2-phpactor'
    " Dark powered shell interface for NeoVim and Vim8.
    "
" generate doc
Plug 'kkoomen/vim-doge'

Plug 'Shougo/deol.nvim'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'afternoon/vim-phpunit'
Plug 'tpope/vim-dispatch'
Plug 'mileszs/ack.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" --------------------------------------------------
"
set macligatures
set guifont=Fira\ Code:h14
set linespace=3


set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces


" Unified color scheme (default: dark)
colo seoul256
set background=light
" colo solarized


" Light color scheme
" colo seoul256-light
" Auto reload changed files
set autoread
" Indicates fast terminal connection
set ttyfast

" Set character encoding to use in vim
set encoding=utf-8

" Let vim know what encoding we use in our terminal
set termencoding=utf-8

" Which EOl used. For us it's unix
" Not works with modifiable=no
if &modifiable
    set fileformat=unix
endif

" Show file name in window title
set title

" open preview window at bottom
set splitbelow

" Hide preview window for completion
set completeopt-=preview

" Mute error bell
set novisualbell

" Setting up how to display whitespace characters
" set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~


" --------------------------------------------------
" Search options

" Add the g flag to search/replace by default
set gdefault

" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" Disable highlighting search result on Enter key
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Show matching brackets
set showmatch

" --------------------------------------------------
" Edit

" Allow backspace to remove indents, newlines and old text
set backspace=indent,eol,start

" toggle paste mode on \p
set pastetoggle=<leader>p

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" Disable backups file
set nobackup

" Disable swp files
set noswapfile

" Do not add eol at the end of file.
set noeol

" Spellcheck
" set spell spelllang=en_us

" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki

"--------------------------------------------------
" Hotkeys

" Open new tab
nmap <silent><leader>to :tabnew .<CR>

" Replace
nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>

" Moving between splits
nmap <leader>w <C-w>w

" Edit vimrc
nmap <leader>ev :tabnew ~/.dotfiles/vim/.vimrc<CR>

"-------------------------
" NERDTree

" Tell NERDTree to display hidden files on startup
let NERDTreeShowHidden=1

" Disable bookmarks label, and hint about '?'
let NERDTreeMinimalUI=1

" Display current file in the NERDTree ont the left
nmap <silent> <leader>f :NERDTreeFind<CR>

"-------------------------
" Fugitive

" Blame on current line
nmap <silent> <leader>b :.Gblame<cr>
" Blame on all selected lines in visual mode
vmap <silent> <leader>b :Gblame<cr>
" Git status
nmap <silent> <leader>gst :Gstatus<cr>
" like git add
nmap <silent> <leader>gw :Gwrite<cr>
" git diff
nmap <silent> <leader>gd :Gdiff<cr>
" git commit
nmap <silent> <leader>gc :Gcommit<cr>
" git commit all
nmap <silent> <leader>gca :Gcommit -a<cr>
" git fixup previous commit
nmap <silent> <leader>gcf :Gcommit -a --amend<cr>

" ctrlp
let g:ctrlp_custom_ignore = '__pycache__'
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_custom_ignore = 'build'
let g:ctrlp_custom_ignore = 'dist'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build|vendor)|(\.(swp|ico|git|svn))$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](node_modules|build|vendor|dist)|\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|pdf)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
set rtp+=/usr/local/opt/fzf
