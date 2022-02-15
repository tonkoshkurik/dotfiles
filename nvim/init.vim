if exists('g:vscode')
    " VSCode neo
else
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    filetype plugin indent on
    syntax on
    set hidden

    let g:python_host_prog='/usr/bin/python2'
    let g:python3_host_prog = '/Users/tonkoskurik/.pyenv/versions/3.9.7/bin/python3'
    set pyxversion=3


    call plug#begin('~/.vim/bundle')
    " Service plugins first
    "Autocomplete
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    " For luasnip users.
    " Plug 'L3MON4D3/LuaSnip'
    " Plug 'saadparwaiz1/cmp_luasnip'

    " For ultisnips users.
    " Plug 'SirVer/ultisnips'
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    " For snippy users.
    " Plug 'dcampos/nvim-snippy'
    " Plug 'dcampos/cmp-snippy'
    "
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    " Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
    " Plug 'neoclide/coc-denite'
    " neovim lua lsp for code autocomplete
    " Plug 'prabirshrestha/vim-lsp'
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'mattn/vim-lsp-settings'
    " Plug 'nvim-lua/completion-nvim'
    " drivers
    Plug 'tjdevries/nlua.nvim'
    ""
    " telescope requirements...
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    ""
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


    " CS
    Plug 'tpope/vim-surround'


    " File
    " Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
    Plug 'tpope/vim-vinegar'
    Plug 'mileszs/ack.vim'

    " Snippets
    " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    if has('nvim')
      " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
      Plug 'ncm2/ncm2'
      " enable ncm2 for all buffers
      Plug 'ncm2/ncm2-bufword'
      Plug 'phpactor/ncm2-phpactor'
      Plug 'ncm2/ncm2-path'
      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
      Plug 'junegunn/fzf.vim'
    else
      " Plug 'ncm2/ncm2'
      " Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif


    " Plug 'ncm2/ncm2-cssomni'
    " Plug 'ncm2/ncm2-tern'
    " Plug 'ncm2/ncm2-jedi'
    " Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
    Plug 'afternoon/vim-phpunit'
    Plug 'jwalton512/vim-blade'

    " Dark powered shell interface for NeoVim and Vim8.
    " Plug 'Shougo/deol.nvim'

    " Denite is a dark powered plugin for Neovim/Vim to unite all interfaces
    " Plug 'Shougo/denite.nvim'
    " Status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Plug 'pangloss/vim-javascript'
    Plug 'mattn/emmet-vim'
    " Plug 'afternoon/vim-phpunit'
    Plug 'tpope/vim-dispatch'

    "
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    " ColorScheme
    Plug 'morhetz/gruvbox'
    " source ~/.dotfiles/nvim/seoul256.vim

    " prettier
    Plug 'sbdchd/neoformat'
    " format
    Plug 'mhartington/formatter.nvim'

    " fun
    Plug 'ThePrimeagen/vim-apm'
    " nvim inside the browser !!! WTF? 🌫
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
    " Plug 'kristijanhusak/deoplete-phpactor'
    Plug 'stephpy/vim-php-cs-fixer'
    "
    Plug 'hrsh7th/nvim-compe'

    "git
    Plug 'lewis6991/gitsigns.nvim'
    " debug
    Plug 'vim-vdebug/vdebug'

    call plug#end()
    "
    " !!! ONLY when deoplete enabled
    " let g:deoplete#enable_at_startup = 1


    " !!! ONLY WHEN USING COC.VIM !!!
    source ~/.dotfiles/nvim/coc.nvim 

    " lsp
    " source ~/.dotfiles/nvim/lsp.nvim
    "
    " https://github.com/hrsh7th/nvim-compe
    set completeopt=menuone,noselect

    " ColorScheme tweaks
    " set background=dark
    " let g:gruvbox_invert_selection='0'
    " let g:gruvbox_contrast_dark = 'hard'
    " set termguicolors
    " if exists('+termguicolors')
    "   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    "   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " endif
    " highlight ColorColumn ctermbg=0 guibg=grey
    " highlight Normal guibg=none
    " " highlight LineNr guifg=#ff8659
    " " highlight LineNr guifg=#aed75f
    " highlight LineNr guifg=#5eacd3
    " highlight netrwDir guifg=#5eacd3
    " highlight qfFileName guifg=#aed75f

    " Airline features
    let g:airline#extensions#tabline#enabled = 1

    let g:airline_powerline_fonts = 1


    let g:UltiSnipsExpandTrigger="<leader>+<tab>"

    " --------------------------------------------------
    "
    " set macligatures
    set guifont=Fira\ Code:h16

    set linespace=3


    set tabstop=4       " The width of a TAB is set to 4.
                        " Still it is a \t. It is just that
                        " Vim will interpret it to be having
                        " a width of 4.

    set shiftwidth=4    " Indents will have a width of 4

    set softtabstop=4   " Sets the number of columns for a TAB

    set expandtab       " Expand TABs to spaces


    " Enable mouse support for normal and visual modes
    set mouse=nv

    " Unified color scheme (default: dark)
    " colo seoul256
    " Light color scheme
    " colo seoul256-light
    " Gruvbox upgrade
    autocmd vimenter * ++nested colorscheme gruvbox
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
    set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~


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

    " show numbers
    " set number

    " Spellcheck
    " set spell spelllang=en_us


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
    nmap <leader>ev :tabnew ~/.dotfiles/nvim/init.vim<CR>

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


    if executable('ag')
      let g:ackprg = 'ag --vimgrep'
    endif

    " :CocInstall coc-prettier 
    " command! -nargs=0 Prettier :CocCommand prettier.formatFile
    " vmap <leader>p  <Plug>(coc-format-selected)
    " nmap <leader>p  <Plug>(coc-format-selected)

    " Replaced with 'vim-airline/vim-airline'
    " set statusline=%{FugitiveStatusline()}
    "

    let t:is_transparent = 0
    function! Toggle_transparent()
        if t:is_transparent == 0
            hi Normal guibg=NONE ctermbg=NONE
            let t:is_transparent = 1
        else
            set background=dark
            let t:is_tranparent = 0
        endif
    endfunction
    nnoremap <C-t> :call Toggle_transparent()<CR>
    command! -nargs=0 Prettier :CocCommand prettier.formatFile

    set rtp+=/usr/local/opt/fzf

    set cmdheight=1

    "Telescope mappings
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    "
    let g:lsp_document_code_action_signs_hint = {'text': '🅰️ ' }
    let g:lsp_diagnostics_signs_error = {'text': '❌'}
    let g:lsp_diagnostics_signs_warning = {'text': '❗️'}
    "statusline 
    " let g:airline#extensions#whitespace#mixed_indent_algo = 0
    " let g:airline#extensions#tabline#enabled = 1
    " let g:airline_powerline_fonts = 1
    " let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]
    " let g:airline#extensions#whitespace#checks = []

    function! s:DiffWithSaved()
      let filetype=&ft
      diffthis
      vnew | r # | normal! 1Gdd
      diffthis
      exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
    endfunction
    com! DiffSaved call s:DiffWithSaved()

    " Compe
    inoremap <silent><expr> <C-Space> compe#complete()
    inoremap <silent><expr> <CR>      compe#confirm('<CR>')
    inoremap <silent><expr> <C-e>     compe#close('<C-e>')
    inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
    inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

    let g:php_cs_fixer_path = '/Users/tonkoskurik/.composer/vendor/bin/php-cs-fixer'
    let g:php_cs_fixer_config_file = '.php-cs-fixer.php'
    nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
    nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

    "terminal mapings
    tnoremap <Esc> <C-\><C-n>

    "debug 
    let g:vdebug_options = {}
    let g:vdebug_options["port"] = 9003
endif
