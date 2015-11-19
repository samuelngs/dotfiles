" Vundle
"==============================================================================
"
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
"------------------------------------------------------------------------------

" Allow saving of files as sudo when I forgot to start vim using sudo
cmap w!! %!sudo tee > /dev/null %

" required!
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-unimpaired'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'rust-lang/rust.vim'
Plugin 'othree/html5.vim'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------------------------------------------------------------------------
" basic
"
set number
set rnu
set ruler          " show line and column number
syntax enable
"set encoding=utf-8
set visualbell     " shut vim up
set noerrorbells
set history=1000
set autoread

set directory=/tmp/
set path=**
set smartcase
set lazyredraw
set notimeout

"------------------------------------------------------------------------------
" editing
"
"set showmatch      " Show matching brackets
"set matchtime=5    " bracket blinking
set showcmd        " show incomplete commands in lower right hand corner
set showmode
set hidden         " current buffer can be put to the background without writing to disk

" folds
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set clipboard=unnamedplus

"------------------------------------------------------------------------------
" whitespaces
"
set autoindent
set smartindent
set smarttab     " smarter tab levels
set nowrap       " don't wrap lines
set textwidth=0
set shiftwidth=4 " autoindent is two spaces
set softtabstop=4
set tabstop=4    " a tab is two spaces
set expandtab    " use spaces, not tabs
set backspace=indent,eol,start " backspace through everything

set list
set listchars=""          " reset listchars
set listchars=tab:‣\      " display tabs with a sign
set listchars+=trail:·    " display trailing whitespaces with a dot
set listchars+=extends:»  " right wrap
set listchars+=precedes:« " left wrap

"------------------------------------------------------------------------------
" searching
"
set hlsearch   " highlight searches
set incsearch  " incremental searching
set ignorecase " searches are case insensitive
set smartcase  " unless there is one capital letter

" scrolling
set scrolloff=5
set sidescrolloff=5
set sidescroll=1

"------------------------------------------------------------------------------
" wild
"
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.out,*.obj,*.class
set wildignore+=*.swp,*~,._*
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=.git,.svn
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*/vendor/assets/**
set wildignore+=*/vendor/rails/**
set wildignore+=*/vendor/cache/**
set wildignore+=*/vendor/bundle/**
set wildignore+=*/vendor/submodules/**
set wildignore+=*/vendor/plugins/**
set wildignore+=*/vendor/gems/**
set wildignore+=*/.bundle/**
set wildignore+=*.gem
set wildignore+=*/log/**
set wildignore+=*/tmp/**
set wildignore+=*/_vendor/**

"------------------------------------------------------------------------------
" backup & swap
"
set noswapfile
set nobackup
set nowb

"------------------------------------------------------------------------------
" Rust
"
" let g:racer_cmd = "/usr/local/src/racer/target/release/racer"
" let $RUST_SRC_PATH="/usr/local/src/rust/src/"

"persistent undo
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

"colorscheme

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility="high"
set background=dark
"silent! colorscheme solarized
"silent! colorscheme hybrid
colorscheme smyck

"------------------------------------------------------------------------------
" filetypes
" https://raw.github.com/carlhuda/janus/master/janus/vim/core/before/plugin/filetypes.vim
"
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

" In Makefiles, use real tabs, not tabs expanded to spaces
au FileType make set noexpandtab

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" to tab highlight for go
au FileType go set nolist textwidth=0

" clean trailing spaces
au BufWritePre * kz|:%s/\s\+$//e|'z

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

au BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()
au BufNewFile,BufRead *.json set ft=javascript

"------------------------------------------------------------------------------

if has("statusline") && !&cp
  set laststatus=2
  set noequalalways
endif

"------------------------------------------------------------------------------
" other settings
"

" ack-vim
let g:ackprg="ag --nogroup --nocolor --column"

" https://github.com/carlhuda/janus/blob/master/janus/vim/tools/janus/after/plugin/syntastic.vim
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=2

""" nerdtree
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
let NERDTreeHijackNetrw = 0

augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

" If the parameter is a directory, cd into it
function! s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function! s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction
"""""

" Default mapping, <leader>n
autocmd VimEnter * silent! lcd %:p:h

"------------------------------------------------------------------------------
" mappings (kept to minimal)

map <C-c> <ESC>
let mapleader=" "

" Git Commands
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gg :Ggrep<Space>
nnoremap <leader>gu :Dispatch! git pull --rebase<CR>
nnoremap <leader>gp :Dispatch! git push<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR><CR>

" Convenience Commands
nnoremap <leader><leader> <c-^>
nnoremap <leader>d :bd<CR>
nnoremap <leader>e :E<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>j :bp<CR>:echo bufnr('%') expand('%:p')<CR>
nnoremap <leader>k :bn<CR>:echo bufnr('%') expand('%:p')<CR>
nnoremap <leader>l :ls<CR>:echo bufnr('%') fugitive#statusline() expand('%:p')<CR>:b
nnoremap <leader>t :tabe<CR>
nnoremap <leader>p :CtrlPClearCache<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>r :wq<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>z :Dispatch!<Space>
nnoremap <leader>u :TComment<CR>
nnoremap <leader>m :noh<CR>
nnoremap <leader>b :set rnu! rnu? <CR>

" much more natural cursor movement when wrapping lines are present
map j gj
map k gk
map <Down> gj
map <Up> gk

" ctrl-p
map <C-t> :CtrlP<CR>
imap <C-t> <ESC>:CtrlP<CR>
map <C-p> :CtrlP<CR>
imap <C-p> <ESC>:CtrlP<CR>

" unimpaired
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" nerd tree
map <leader>n :NERDTreeToggle<CR>

