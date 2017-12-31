" vimrc
" Author: Tekin

" Simple sets {{{
" =============================
"          Simple sets
" =============================
colorscheme xemacs				" theme

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set relativenumber				" show relative numbers to current line
set number						" show line numbers. when used with relative number shows current line number
set scrolloff=10				" always show x lines from top/bottom
set tabstop=4					" number of visual spaces per TAB
set softtabstop=4				" number of spaces in tab when editing
"set expandtab					" tabs are spaces
set showcmd             		" display incomplete commands
"set cursorline         		" highlight current line
set wildmenu					" visual autocomplete for command menu
set lazyredraw					" redraw only when we need to
set showmatch					" hightlight matching [{()}]
set incsearch					" search as characters are entered
set hlsearch					" highlight matches
set foldenable					" enable folding code
set foldlevelstart=10			" open most folds by default (0 starts with all closed)
set foldnestmax=10				" max acceptable nested folds
set foldmethod=indent			" fold based on indent level
set modelines=1					" comments that declare certain Vim settings
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set history=50					" keep 50 lines of command line history
set ruler						" show the cursor position all the time

" }}}
" Complex sets {{{
" =============================
"         Complex sets
" =============================
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" allows cursor change in tmux mode
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif " exists('$TMUX')

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" }}}
" Backup stuff {{{
" =============================
"         Backup stuff
" =============================
" vim recovery files
" swap files (.swp) in a common location
" // means use the file's full path
set dir=~/.vim/_swap//

" backup files (~) in a common location if possible
" set backup
set backup
set backupdir=~/.vim/_backup/,~/tmp,.

" turn on undo files, put them in a common location
" set undofile
set undofile
set undodir=~/.vim/_undo/

" }}}
" Bindings {{{
" =============================
"            Bindings
" =============================
let mapleader=","		" leader is comma
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <space> za

" skips wrapped lines
nnoremap j gj
nnoremap k gk

" hightlight last inserted text
nnoremap gV `[V`]

" jk is escape
"inoremap jk <esc>

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" }}}
" Packages {{{
" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit

" }}}

" vim:foldmethod=marker:foldlevel=0
