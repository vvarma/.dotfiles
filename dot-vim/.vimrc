let g:ycm_path_to_python_interpreter = '/usr/bin/python'
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'vim-airline/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-vinegar'
Plugin 'sbdchd/neoformat'
Plugin 'fatih/vim-go'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"pathogen
call pathogen#infect()
filetype off
syntax on
filetype plugin indent on

" For searching within a file

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase
" annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
	autocmd GUIEnter * set vb t_vb=
endif

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Paste as is.
set paste

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" set nu
" Plugins


"" NERDTree configuration
"nmap <Tab><Tab> :NERDTreeTabsToggle<CR>
"
"" reveal the current file in NERDTree
"map <Leader>f :NERDTreeTabsFind<CR>
"map <Leader>s :NERDTreeFocusToggle<CR>
"let NERDTreeIgnore=[ '\.pyc$']

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix


set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

set backspace=2 " make backspace work like most other apps

let python_highlight_all=1
syntax on
colorscheme zenburn
"set clipboard=unnamed
" Flake stuf
"autocmd BufWritePost *.py call Flake8()

set wildignore+=*.pyc
set backspace=indent,eol,start
" Custom fns

" Go Lint
" set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Go stuff
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"
let g:go_bin_path = expand("~/.gotools")
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
" syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" This trigger takes advantage of the fact that the quickfix window can be
" easily distinguished by its file-type, qf. The wincmd J command is
" equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" the very bottom (see :help :wincmd and :help ^WJ).
autocmd FileType qf wincmd J
let $GOPATH = expand ("~/work/golang/")
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Proto stuff
augroup filetype
au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
" Eclim settings
let g:EclimCompletionMethod = 'omnifunc'
let java_comment_strings=1
let java_highlight_java_lang_ids=1
let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150

"Cntrl-P stuff
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

"Airline stuff
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
"Split stuff
set splitbelow
set splitright
"neo format
augroup fmt
autocmd!
autocmd BufWritePre * undojoin | Neoformat
augroup END
let g:neoformat_java_google = {
	\ 'exe': 'java',
	\ 'args': ['-jar /Users/vinay/work/java/github.com/google/google-java-format/core/target/google-java-format-1.6-SNAPSHOT-all-deps.jar -'],
	\ 'stdin': 1,
	\ }

let g:neoformat_enabled_java = ['google']
"" Enable alignment
" let g:neoformat_basic_format_align = 1
"
" " Enable tab to spaces conversion
" let g:neoformat_basic_format_retab = 1
"
" " Enable trimmming of trailing whitespace
" let g:neoformat_basic_format_trim = 1
