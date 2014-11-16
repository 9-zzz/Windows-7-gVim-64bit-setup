" This vimrc is mainly for Windows and gVim7.4 64-bit compiled with python+lua for C# & Unity Game Engine scripting.
" GOAL: OmniSharp + Neocomplete for nice Auto completion.

source $VIMRUNTIME/mswin.vim " For windows Ctrl + V copy paste into Vim, I've edited mswin.vim a bit too for normal visual block editing.

set nocompatible " Make Vim behave in a more useful way. If you set this option in your vimrc file, you should probably put it at the very start. For Compatibility.
" Note that creating a vimrc file will cause the 'compatible' option to be off by default.

set runtimepath+=~/vim/vimfiles/bundle/Vundle.vim/
let path='~/vim/vimfiles/bundle'

filetype off " Required.

call vundle#begin(path)
Plugin 'bling/vim-airline'        " Lean & mean status/tabline for vim that's light as air.
Plugin 'gmarik/Vundle.vim'        " Vundle is short for Vim bundle and is a Vim plugin manager.
Plugin 'OmniSharp/omnisharp-vim'  " Plugin for Vim to provide IDE like abilities for C#.
Plugin 'scrooloose/syntastic'     " Syntax checking plugin that runs files through external syntax checkers and displays any resulting errors.
Plugin 'scrooloose/nerdtree'      " Allows you to explore your filesystem and to open files and directories.
Plugin 'Shougo/neocomplete.vim'   " Provides keyword completion system by maintaining a cache of keywords in the current buffer.
Plugin 'Shougo/unite.vim'         " Can search and display information from arbitrary sources like files, buffers, recently used files or registers.
Plugin 'tpope/vim-dispatch'       " Asynchronous build and test dispatcher. (I don't know what this does)
Plugin 'tpope/vim-eunuch'         " Vim sugar for the UNIX shell commands that need it the most. 
Plugin 'tpope/vim-fugitive'       " May very well be the best Git wrapper of all time.
Plugin 'tpope/vim-surround'       " Quoting/parenthesizing made simple (just use 'ct' for stuff)
Plugin 'tpope/vim-unimpaired'     " Pairs of handy bracket mappings.
call vundle#end()

filetype indent plugin on " Required.

colorscheme molokai " set t_Co=256 sets terminal to use 256 colors apparently bad (Linux)

" (See .gvimrc for all Gui and small color tweaks.)
" (Then Vim reads the _viminfo file)

" Section: Options (Yes, I did order them by length... I have a problem...)
" ----------------

syntax on               " Enable syntax highlighting
set t_vb=               " Disables visual bell entirely
set ruler               " Show line + col number of the cursor pos separated by comma if there's room, the rel pos of the displayed text in file is shown on far right
set hidden              " When off a buffer is unloaded when it is abandoned when on a buffer becomes hidden when it is abandoned
set number              " Display line numbers
set ttyfast             " Indicates fast terminal connection More chars will be sent to screen for redrawing instead of using ins/del line cmds
set mouse=a             " Enable the use of the mouse.  Only works for certain terminals (xterm, MS-DOS, Win32... etc.)
set showcmd             " Show (partial) command in the last line of the screen set this option off if your terminal is slow in visual made shows selected area
set confirm             " Instead of failing a command because of unsaved changes
set wildmenu            " When 'wildmenu' is on, command-line completion operates in an enhanced mode
set hlsearch            " Highlights words as you search
set smarttab            " Shiftwidth at the start of the line, softtabstop everywhere else
set expandtab           " Turns tabs into spaces
set showmatch           " When a bracket is inserted, briefly jump to the matching one the jump is only done if the match can be seen on the screen
set incsearch           " While typing a search show where the pattern as it was typed so far matches The matched string is highlighted
set smartcase           " Case insensitive searches become sensitive with capitals
set ignorecase          " The case of normal letters is ignored
set autoindent          " Copy indent from current line when starting a new line
set smartindent         " Do smart autoindenting when starting a new line
set complete-=i         " Searching includes can be slow ~tpope
set cmdheight=2         " Number of screen lines to use for the command-line.  Helps avoiding hit-enter prompts
set laststatus=2        " Always display the status line, even if only one window is displayed *Airline!
set shiftwidth=2        " Indentation settings for using 2 spaces instead of tabs.
set softtabstop=2       " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
set nostartofline       " Stop certain movements from always going to the 1st character of a line, affected gg and G
set ttimeoutlen=50      " Make Esc work faster, the time in milliseconds that is waited for a key code or mapped key sequence to complete
set encoding=utf-8      " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.kk
set notimeout ttimeout  " Quickly time out on keycodes not on mappings

set backspace=indent,eol,start  " Makes backspace work

" Undo with as many levels as you like stored into file to keep undos across sessions
set undodir=C:\Users\Shahan\vim\vimfiles\undodir
set undofile

" Section: Mappings
" -----------------

" My leader is the default leader key: '\'
nmap <leader>\ :nohl<CR>
nmap <leader>sp :setlocal spell! spelllang=en_us<CR>

" Maps gg and G to fix nostartofline 
nmap gg gg0
nmap G G$
xmap gg gg0
xmap G G$

imap jj <Esc> 
imap jk <Esc> 

" Enables ctrl+c to sysclipboard in visual mode*need " +xterm-clipboard,vimgtk(Linux)
"map <C-c> "+y<CR>

" Shift lines up or down ~i
nmap <C-j> ddp
nmap <C-k> ddkkp

" For when syntax highlighting/colorscheme dies because a file is too long.
nmap U :syntax sync fromstart<cr>:redraw!<cr>

" Section: Autocommands
" ---------------------

" Spooky Skeletons
autocmd BufNewFile *.c 0r ~/.vim/skeleton.c | call cursor(6,0)
autocmd BufNewFile *.java 0r ~/.vim/skeleton.java | call cursor(1,14)
autocmd BufNewFile *.py 0r ~/.vim/skeleton.py| call cursor(2,0)

" Always restore last cursor position
if has("autocmd")
  augroup restoreCursor
    autocmd!
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line ("'\"") <= line("$") |
          \   exe "normal! g'\"" |
          \ endif
  augroup END
endif

" Section: Plugin Settings
" -------------------------

" Airline

let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" Nerd Tree

au VimEnter *  NERDTree       " Open nerdtree when I open vim, useful in windows No terminal
let NERDTreeShowHidden=1      " Show hidden files in the tree
let NERDTreeQuitOnOpen=1      " Close nerd tree when I've opened a file
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1   
nmap <Leader>n :NERDTreeToggle<CR>

" OmniSharp

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" NeoComplete

set completeopt-=preview                                  " Disable preview scratch split
let g:acp_enableAtStartup = 0                             " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1                   " Use neocomplete.
let g:neocomplete#enable_smart_case = 1                   " Don't Use smartcase???
let g:neocomplete#sources#syntax#min_keyword_length = 3   " Set minimum syntax keyword length.
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'     " ^ ??? ^
let g:neocomplete#max_list = 25                           " ???

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable heavy omni completion.
call neocomplete#custom#source('_', 'sorters', [])

if !exists('g:neocomplete#sources')
  let g:neocomplete#sources = {}
endif

let g:neocomplete#enable_auto_select = 1                 " ???
let g:neocomplete#disable_auto_complete = 0              " ???

" Plugin key-mappings.
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><C-h>  pumvisible() ? neocomplete#cancel_popup() : "\<C-h>"
imap <expr><Tab> pumvisible() ? neocomplete#close_popup() : "\<Tab>"

" More enable heavy omni completion???
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#sources.cs = ['omni']
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^-!@%?/|&\{}\+\*\(<>\")\=);]'
let g:neocomplete#sources#omni#input_patterns.js = '[^. \t]\.\w*'
let g:neocomplete#sources#omni#input_patterns.c = '[^[:digit:] *;]\w*'
let g:clang_complete_auto=1
let g:clang_auto_select=0
let g:clang_use_library=1
let g:neocomplete#enable_refresh_always = 0

augroup js_aus
  autocmd!
  autocmd FileType javascript    setlocal omnifunc=tern#Complete
  autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
" End of Neocomplete Settings

" Cool stuff:
" Q to record macros and dot (.) for repeat last insert actions. 
" zt zz zb = center top, center, center bottom
