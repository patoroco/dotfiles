" ---------------------------------------------------------------------------
"  Shorcuts
" ---------------------------------------------------------------------------

" ,w -> Strip whitespaces
map ,w :call StripWhitespace ()<CR>

" ,ss -> Spellcheck in Spanish
map ,ss :setlocal spell spelllang=es_ES<CR>

" ,se -> Spellcheck in English
map ,se :setlocal spell spelllang=en_us<CR>

" , shift + UP / shift + down => move line up or down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>


" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Airline
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1

" Golang
let g:go_fmt_command = 'goimports'

" Multi-cursors
let g:multi_cursor_start_key='<C-d>'
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-s>'
let g:multi_cursor_quit_key='<Esc>'

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#max_list = 5
let g:neocomplete#max_keyword_width = 50
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_fuzzy_completion=0
set completeopt-=preview

" Solarized
let g:solarized_termcolors=256

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Syntastic
let g:syntastic_python_checkers = ['pylint', 'pep8']
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_id_checkers = 1
let g:syntastic_auto_loc_list = 2


" ---------------------------------------------------------------------------
"  General configuration
" ---------------------------------------------------------------------------

" General
set nocompatible                " vi != vim
let mapleader=","               " Lead with ,

" Format settings
set nowrap                      " No wrap lines
set tabstop=4                   " A tab is four spaces
set softtabstop=4               " Also softtab
set expandtab                   " Expands tab
set nosmarttab                  " Fuck tabs
set backspace=indent,eol,start  " Allow backspacing over everything
set scrolloff=4                 " Keep 4 lines off the edges of the screen
set autoindent                  " Always set autoindenting on
set smartindent                 " Smart indent
set copyindent                  " Copy the previous indentation
set number                      " Always show line number
set shiftwidth=4                " Four spaces on indenting
set shiftround                  " Use multiple of swidth when indenting with <>
set showmatch                   " Set show matching parenthesis
set ignorecase                  " Ignore case when searching
set smartcase                   " Ignore case if pattern is all lowercase
set smarttab                    " Tabs on the start of a line with shiftwidth
set hlsearch                    " Highlight search terms
set incsearch                   " Show search matches as you type
set title                       " Change the terminal's title
set visualbell                  " Don't beep
set noerrorbells                " Don't beep
set showmode                    " Show actual status
set showcmd                     " Show commands
set ruler                       " Show position info
set laststatus=2                " Show the status line always
set ch=2                        " Command line height
set backspace=2                 " Backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]      " Backspace and cursor keys wrap to
set shortmess=filtIoOA          " Shorten messages
set report=0                    " Tell us about changes
set nostartofline               " Don't jump to the start of line when scrolling

" Clipboard
set clipboard=unnamed

" File settings
set modeline                    " Activate the modeline
set modelines=5                 " To the first and last 5 lines
set hidden                      " Open files without saving
set nobackup                    " No backup files

" History settings
set viminfo+=n~/.viminfo        " Filename of the history file
set history=1000                " Remember more commands and search history
set undolevels=1000             " Use many muchos levels of undo

" Crap settings
set formatoptions+=cqron1       " Set auto-crap of lines
set textwidth=100               " Set 100 chars to the width
set fileformats=unix,mac,dos    " Autodetect end of line format

" Ignore extensions
if has("wildmenu")
    set wildmenu
    set wildmode=list:longest,full
    set wildchar=<TAB>
    set wildignore=*.swp,*.bak,*.pyc,*.pyo,*.class,*.o
endif

" Different settings to static web stuff
au FileType html,htmldjango,javascript,css setlocal sw=2 ts=2 sts=2

" Indent ON
filetype indent plugin on

" Syntax highlighting and color scheme (solarized)
colorscheme solarized
set background=dark
set t_Co=256
syntax enable


au BufReadPost Podfile set syntax=ruby
au BufReadPost Fastfile set syntax=ruby
au BufReadPost Gemfile set syntax=ruby


" ---------------------------------------------------------------------------
"  Functions
" ---------------------------------------------------------------------------

" Highlight whitespaces with a red background
if has("syntax") || has("gui_running")
    highlight WhitespaceEOL ctermbg=red guibg=red
    match WhitespaceEOL /\s\+$/
endif

" Go to the last line visited when reopen a file
if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal g'\"" |
        \ endif
endif

autocmd FileType python setlocal completeopt-=preview

" Strip withespaces with ,s
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction

