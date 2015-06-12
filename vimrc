"This level of compatability level should work everywhere
if (compatability_level >= 0)
	"echo "adding base line config"
    inoremap jj <esc>

 "Cocoa/Emacs style insert mode"{{{
" If on macvim take advantage of option key as meta.
" TODO: figure out a way to meta-ize option key on other platforms.
if has("gui_macvim")
	set macmeta
endif

imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <M-b> <C-o>b
imap <M-f> <C-o>e<Right>
imap <C-d> <Del>
imap <C-h> <BS>
imap <M-d> <C-o>de
imap <M-h> <C-w>
imap <C-k> <C-r>=<SID>kill_line()<CR>
imap <C-p> <Up>
imap <C-n> <Down>

" command line mode
"cmap <C-p> <Up>     "I like the previous command,
"cmap <C-n> <Down>   "next command funcionality.
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <M-b> <S-Left>
cmap <M-f> <S-Right>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <M-d> <S-Right><C-w>
cnoremap <M-h> <C-w>
cnoremap <C-k> <C-f>D<C-c><C-c>:<Up>


function! s:home()
	let start_col = col('.')
	normal! ^
	if col('.') == start_col
		normal! 0
	endif
	return ''
endfunction

function! s:kill_line()
	let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
	if len(text_after_cursor) == 0
		normal! J
	else
		call setline(line('.'), text_before_cursor)
	endif
	return ''
endfunction

	function! s:split_line_text_at_cursor()
		let line_text = getline(line('.'))
		let text_after_cursor  = line_text[col('.')-1 :]
		let text_before_cursor = (col('.') > 1) ? line_text[: col('.')-2] : ''
		return [text_before_cursor, text_after_cursor]
	endfunction"}}}
"remove trailing whitespace
cnoreabbrev trailing %s/\s\+$//

nnoremap <F4> O<esc>O---<esc>O<esc>"=strftime("%c")<CR>po<tab>
endif

if (compatability_level >= 1)
        "echo "adding more config"
    " Disable stupid backup and swap files - they trigger too many events
    " for file system watchers
    set nobackup
    set nowritebackup
    set noswapfile

    "WINDOW RESIZE
    " fine adjust
    nnoremap <up> <c-w>1+
    nnoremap <down> <c-w>1-
    nnoremap <left> <c-w>1<
    nnoremap <right> <c-w>1>

        set textwidth=79  " lines longer than 79 columns will be broken
        set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
        set tabstop=4     " a hard TAB displays as 4 columns
        set expandtab     " insert spaces when hitting TABs
        set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
        set shiftround    " round indent to multiple of 'shiftwidth'
        set autoindent    " align the new line indent with the previous line"

        set listchars=tab:→\ ,eol:¬
    source ~/config/homebrewed_utilities/parse_note.vim
endif


if (compatability_level >= 2)
    "echo 'in we go'
    cnoreabbrev resource source ~/config/dotfiles/vimrc
else
    echo 'we didnt enter here'
endif

if (compatability_level >= 3)
    echo "we shouldn't get here"
"COMMAND ALIAS
"Command alias in case you desire to have tabs instead of spaces"
cnoreabbrev tabular set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
"Scratch that"
cnoreabbrev notab set tabstop=4 shiftwidth=4 expandtab


cnoreabbrev reindent %!astyle

"remove trailing whitespace
cnoreabbrev trailing %s/\s\+$//

"DUMP
nnoremap <c-e> :Errors<cr>
nnoremap <c-g> :nohl<cr>

"Mysource"
source ~/config/dotfiles/vimconf_light/vim_local_extras/Bdelete.vim


nnoremap <F4> O<esc>O---<esc>O<esc>"=strftime("%c")<CR>po<tab>
endif











if ( 1 == 2  )

    echo "never see this"

"Hello and welcome to my .vimrc file!
"Enjoi!
"{{{ Prelude: Folding
"
	" This document uses a heirarchical folding schema.
"
""}}} <-- That's a fold marker.  Use 'set foldmethod=marker' to utilize.
 if !1 | finish | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
NeoBundle 'Shougo/vimproc', {
            \   'build' : {
            \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \   },
            \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'


NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'groenewege/vim-less'

"NeoBundle 'fugitive'

NeoBundle 'powerline/powerline'
NeoBundle 'mattn/emmet-vim'
	"Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

""{{{Vundle
"
"" What follows is everything that the Vundle plugin uses. If you're not using 
"" vundle... well you should be.
"" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
"	"{{{ Vundle wireframe - you probably won't need to change any of this.
"	set nocompatible              " be iMproved, required
"	filetype off                  " required
"
"	" make vundle source from ssh not https
"	let g:vundle_default_git_proto = 'git'
"
"	" set the runtime path to include Vundle and initialize
"	set rtp+=~/.vim/bundle/vundle/
"	call vundle#rc()
"	" alternatively, pass a path where Vundle should install bundles
"	"let path = '~/some/path/here'
"	"call vundle#rc(path)
"
"	" let Vundle manage Vundle, required
"	Bundle 'gmarik/vundle'
"	"}}}
"
"	"{{{ Most crucial Bundles
"	Bundle 'The-NERD-tree'
"	Bundle 'The-NERD-Commenter'
"	Bundle 'Gundo'
"	Bundle 'Lokaltog/powerline'
"	Bundle 'tpope/vim-fugitive'
"	Bundle 'airblade/vim-gitgutter'
"	Bundle 'majutsushi/tagbar'
"	Bundle 'xolox/vim-easytags'
"	Bundle 'xolox/vim-misc'
"	"Bundle 'scrooloose/syntastic'
"
"	" Crucial, although occasionally problematic:
"	Bundle 'Valloric/YouCompleteMe'
"	Bundle 'emmet-vim'
"
"	" Unsure
"	Bundle 'Lokaltog/vim-easymotion'
"	"Bundle 'L9'
"	"Bundle 'FuzzyFinder'
"	"}}}
"
"
"	Bundle 'groenewege/vim-less'
"
"
""{{{ Utilities
"	Bundle 'jplaut/vim-arduino-ino'
""}}}
"
"	"{{{ Nice to haves
"	Bundle 'Rename'
"	Bundle 'minibufexpl.vim'
"	Bundle 'ctrlp.vim'
"	"Bundle 'ShowMarks'
"	"}}}
"
"	"{{{LandFill /// bundle formats
"	"
"" The following are examples of different formats supported.
"" Keep bundle commands between here and filetype plugin indent on.
"" scripts on GitHub repos
""Bundle 'ap/vim-css-color'
""Bundle 'christoomey/vim-tmux-navigator'
""Bundle 'Lokaltog/vim-easymotion'
""Bundle 'tpope/vim-rails.git'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
""Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"" scripts from http://vim-scripts.org/vim/scripts.html
""Bundle 'Lucius'
""Bundle 'css_color.vim'
""Bundle 'minibufexpl.vim'
""Bundle 'pbcopy.vim'
""Bundle 'vimux'
""Bundle 'Conque-Shell'
""Bundle 'vim-powerline'
""Color Schemes
""=============
""Bundle 'mayansmoke'
""=============
"" scripts not on GitHub
""Bundle 'git@github.com:vim-scripts/c.vim.git'
""Bundle 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
""Bundle 'file:///home/gmarik/path/to/plugin'
"" ...
"
""}}}
"
"	"{{{ Other's Plugins
"		"" Jamie Plugins"{{{
"		"" Bundles (plugins)
"		"Bundle 'Lokaltog/vim-powerline'
"
"		"if v:version < 703 || !has('patch584')
"			"Bundle 'tsaleh/vim-supertab'
"		"else
"			"Bundle 'Valloric/YouCompleteMe'
"		"endif
"
"		"Bundle 'airblade/vim-gitgutter'
"		"Bundle 'godlygeek/tabular'
"		"Bundle 'kien/ctrlp.vim'
"		"Bundle 'majutsushi/tagbar'
"		"Bundle 'matthias-guenther/hammer.vim'
"		"Bundle 'mileszs/ack.vim'
"		"Bundle 'python_match.vim'
"		"Bundle 'sjl/gundo.vim'
"		"Bundle 'tpope/vim-fugitive'
"		"Bundle 'tpope/vim-markdown'
"		"Bundle 'tpope/vim-unimpaired'
"		"Bundle 'vim-scripts/file-line'
"		"Bundle 'vim-scripts/matchit.zip'
"		"Bundle 'scrooloose/nerdtree'
"		"Bundle 'scrooloose/syntastic'
"		"Bundle 'phleet/vim-arcanist'
"
"		"" Language Support
"		"Bundle 'digitaltoad/vim-jade'
"		"Bundle 'groenewege/vim-less'
"		"Bundle 'hail2u/vim-css3-syntax'
"		"Bundle 'kchmck/vim-coffee-script'
"		"Bundle 'nono/vim-handlebars'
"		"Bundle 'skammer/vim-css-color'
"		"Bundle 'derekwyatt/vim-scala'
"		"Bundle 'wavded/vim-stylus'
"		"Bundle 'pangloss/vim-javascript'
"
"		"" Color
"		"Bundle "Solarized"
"		"Bundle "altercation/vim-colors-solarized"
"		""}}}
"	"}}}
"
"	"{{{Plugin closure
"	filetype plugin indent on     " required
"	"" To ignore plugin indent changes, instead use:
"	""filetype plugin on
"	""
"	"" Brief help
"	"" :BundleList          - list configured bundles
"	"" :BundleInstall(!)    - install (update) bundles
"	"" :BundleSearch(!) foo - search (or refresh cache first) for foo
"	"" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"	"" j
"	"" see :h vundle for more details or wiki for FAQ
"	"" NOTE: comments after Bundle commands are not allowed.
"	"" Put your stuff after this line
"	"}}}
"
""}}}

" do i need this?
"call pathogen#infect()

"{{{ Color
	" In case using in terminal.
set t_Co=16
set background=dark
let g:solarized_termcolors=256
let g:solarized_termcolors=16

""make search highlights less painfull on the eyes
hi Search cterm=NONE ctermfg=grey ctermbg=blue

set cursorline
hi cursorline ctermbg=233
hi cursorline guibg=#000000

""Highlight the current line
"hi CursorLine cterm=bold guibg=Grey40

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod
"color lucius

" Enable syntax highlighting
" You need to reload this file for the change to apply
syntax on
"}}}

"{{{ Basic Vim Necesities

"use this shit:  "{{{"}}}
set foldmethod=marker

""Remap mapleader key from default <\> to <,>
let mapleader=","

""Make it easy to escape.  Just press j twice, quickly.
imap jj <esc>
imap jk <esc>
set timeout timeoutlen=400 ttimeoutlen=400

" so you can watch you vim settings take affect imediately
autocmd! bufwritepost .vimrc source %
"}}}

"{{{ Sensible - These should all be things most everybody wants
" normal backspace functionality
set backspace=2

	"{{{ Line numbers
	set number
	highlight LineNr ctermfg=darkgrey"}}}

	""Prevent the cursor from moving back a space when exit insert mode"{{{
	let CursorColumnI = 0 "the cursor column position in INSERT
	autocmd InsertEnter * let CursorColumnI = col('.')
	autocmd CursorMovedI * let CursorColumnI = col('.')
	autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif"}}}

""Case aint no1thang for searching
set ignorecase

""Make Y behave like D and C
nnoremap Y y$

""make vim show you what keys have been pressed (lower right)
set showcmd

	" easy save and exits"{{{
	nnoremap <leader>s :w<cr>
	nnoremap <leader>S :wa<cr>


	nnoremap <leader>e ZZ
	nnoremap <leader>E :wa<cr>:qa<cr>"}}}

nnoremap <2-leftmouse> za

	"{{{ window resize

	" fine adjust
	nnoremap <up> <c-w>1+
	nnoremap <down> <c-w>1-
	nnoremap <left> <c-w>1<
	nnoremap <right> <c-w>1>

	" coarse adjust
	nnoremap <s-up> <c-w>5+
	nnoremap <s-down> <c-w>5-
	nnoremap <s-left> <c-w>5<
	nnoremap <s-right> <c-w>5>

	"}}}

"save the state of your folds yo!
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"Keep at least 3 lines on screen below cursor
set scrolloff=3

"This allows <left> and <right> to wrap to next or previous line
set whichwrap=<,>,[,]

"" New window splits will open on the bottom or to the right
set splitbelow
set splitright

"{{{ To warn that file has changed on disk.
"au FileChangedShell * echo "Warning: File changed on disk"
au CursorHold * checktime
"}}}
nnoremap <C-g> :nohl<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>"{{{
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h"}}}

" easier moving between tabs"{{{
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>"}}}

" easier moving of code blocks"{{{
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation"}}}
" map sort function to a key
vnoremap <Leader>s :sort<CR>




" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/
"}}}

"{{{ My prefs - These are things I've grown accustom to.

"{{{ <Fn> mappings

""Write and load session (window, info, stuffs)
map <F2> :mksession! ~/.vim_session <CR>
map <F3> :source ~/.vim_session <CR>
nnoremap <F4> O<esc>O---<esc>O<esc>"=strftime("%c")<CR>po<tab>

""togle for sensible paste functionality.
set pastetoggle=<F10>

"}}}

" Execute a command;
nnoremap <c-c> :!

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Basic cursor movement and deletion keybindings from emacs, for vim."{{{


	" Cocoa/Emacs style insert mode"{{{
	" If on macvim take advantage of option key as meta.
	" TODO: figure out a way to meta-ize option key on other platforms.
	if has("gui_macvim")
		set macmeta
	endif

	imap <C-b> <Left>
	imap <C-f> <Right>
	imap <C-a> <C-o>:call <SID>home()<CR>
	imap <C-e> <End>
	imap <M-b> <C-o>b
	imap <M-f> <C-o>e<Right>
	imap <C-d> <Del>
	imap <C-h> <BS>
	imap <M-d> <C-o>de
	imap <M-h> <C-w>
	imap <C-k> <C-r>=<SID>kill_line()<CR>
	imap <C-p> <Up>
	imap <C-n> <Down>

	" command line mode
	"cmap <C-p> <Up>     "I like the previous command,
	"cmap <C-n> <Down>   "next command funcionality.
	cmap <C-b> <Left>
	cmap <C-f> <Right>
	cmap <C-a> <Home>
	cmap <C-e> <End>
	cmap <M-b> <S-Left>
	cmap <M-f> <S-Right>
	cnoremap <C-d> <Del>
	cnoremap <C-h> <BS>
	cnoremap <M-d> <S-Right><C-w>
	cnoremap <M-h> <C-w>
	cnoremap <C-k> <C-f>D<C-c><C-c>:<Up>

	function! s:home()
		let start_col = col('.')
		normal! ^
		if col('.') == start_col
			normal! 0
		endif
		return ''
	endfunction

	function! s:kill_line()
		let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
		if len(text_after_cursor) == 0
			normal! J
		else
			call setline(line('.'), text_before_cursor)
		endif
		return ''
	endfunction

	function! s:split_line_text_at_cursor()
		let line_text = getline(line('.'))
		let text_after_cursor  = line_text[col('.')-1 :]
		let text_before_cursor = (col('.') > 1) ? line_text[: col('.')-2] : ''
		return [text_before_cursor, text_after_cursor]
	endfunction"}}}
"}}}

		" Vimux"{{{
		 "map <silent> <LocalLeader>rl :wa<CR> :VimuxRunLastCommand<CR>
		 "map <silent> <LocalLeader>vi :wa<CR> :VimuxInspectRunner<CR>
		 "map <silent> <LocalLeader>vk :wa<CR> :VimuxInterruptRunner<CR>
		 "map <silent> <LocalLeader>vx :wa<CR> :VimuxClosePanes<CR>
		 "map <silent> <LocalLeader>vp :VimuxPromptCommand<CR>
		 "vmap <silent> <LocalLeader>vs "vy :call VimuxRunCommand(@v)<CR>
		 "nmap <silent> <LocalLeader>vs vip<LocalLeader>vs<CR>"}}}
	"{{{Bufferstuffs
	""Mappings to access buffers (don't use '\p' because a
	"" delay before pressing 'p' would accidentally paste).
	"" \l       : list buffers
	"" \b \f \g : go back/forward/last-used
	"" \1 \2 \3 : go to buffer 1/2/3 etc
	nnoremap <Leader>l :ls<CR>
	nnoremap <Leader>b :bp<CR>
	nnoremap <Leader>v :bn<CR>
	nnoremap <Leader>g :e#<CR>
	nnoremap <Leader>1 :1b<CR>
	nnoremap <Leader>2 :2b<CR>
	nnoremap <Leader>3 :3b<CR>
	nnoremap <Leader>4 :4b<CR>
	nnoremap <Leader>5 :5b<CR>
	nnoremap <Leader>6 :6b<CR>
	nnoremap <Leader>7 :7b<CR>
	nnoremap <Leader>8 :8b<CR>
	nnoremap <Leader>9 :9b<CR>
	nnoremap <Leader>0 :10b<CR>
	""It's useful to show the buffer number in the status line.
	set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

	""Discard buffer in current window
	nnoremap <Leader>d :bdelete<CR>

	""Access window commands with {,w}
	nnoremap <Leader>w <c-w>

	""You may now shoot yourself in the foot by changing buffers
	""without writing first
	set hidden
	set confirm "put a safety on the gun
	"set autowrite "take the bullets out of the gun
	"}}}

"{{{Text, tab and indent related

 " Be smart when using tabs ;)
 set smarttab

 " 1 tab == 2 spaces
 set shiftwidth=2
 set tabstop=2
 set softtabstop=2

 set ai "Auto indent
 set si "Smart indent
 set wrap "Wrap lines


"" Automatic bracket completion
"inoremap {      {}<Left>
"inoremap {  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"}}}

"File type specific"{{{

" For *.txt files vim automatically handles things like Word does
autocmd BufRead,BufNewFile *.txt setl tw=79
autocmd BufRead,BufNewFile *.txt set whichwrap+=hl
au BufEnter *.txt setl tx ts=4 sw=4 fo+=n2a
"autocmd BufRead,BufNewFile *.txt setl fo=aw2tq

" for rc files I had strange fo coming up
 autocmd BufRead,BufNewFile *rc setl fo=tcq

"}}}
"}}}

"{{{ Archived

""allow incrementing of letters as well as numbers using <c-a> <c-x>
":set nf=octal,hex

""get ready to jump to (row,col)
"nnoremap <c-x> :cal cursor(

"Run this command to delete trailing whitespace
":%s/\s\+$//

"if has("gui_running")
	"set updatetime=420
	"autocmd CursorHold * call Timer()
	"function! Timer()
	  "call feedkeys("f\e")
	  "echo strftime("%c")
	  "" K_IGNORE keycode does not work after version 7.2.025)
	  "" there are numerous other keysequences that you can use
	"endfunction
"endif


	"{{{Color Ref Card
	"hi x016_Grey0 ctermfg=16 guifg=#000000 "rgb=0,0,0
	"hi x017_NavyBlue ctermfg=17 guifg=#00005f "rgb=0,0,95
	"hi x018_DarkBlue ctermfg=18 guifg=#000087 "rgb=0,0,135
	"hi x019_Blue3 ctermfg=19 guifg=#0000af "rgb=0,0,175
	"hi x020_Blue3 ctermfg=20 guifg=#0000d7 "rgb=0,0,215
	"hi x021_Blue1 ctermfg=21 guifg=#0000ff "rgb=0,0,255
	"hi x022_DarkGreen ctermfg=22 guifg=#005f00 "rgb=0,95,0
	"hi x023_DeepSkyBlue4 ctermfg=23 guifg=#005f5f "rgb=0,95,95
	"hi x024_DeepSkyBlue4 ctermfg=24 guifg=#005f87 "rgb=0,95,135
	"hi x025_DeepSkyBlue4 ctermfg=25 guifg=#005faf "rgb=0,95,175
	"hi x026_DodgerBlue3 ctermfg=26 guifg=#005fd7 "rgb=0,95,215
	"hi x027_DodgerBlue2 ctermfg=27 guifg=#005fff "rgb=0,95,255
	"hi x028_Green4 ctermfg=28 guifg=#008700 "rgb=0,135,0
	"hi x029_SpringGreen4 ctermfg=29 guifg=#00875f "rgb=0,135,95
	"hi x030_Turquoise4 ctermfg=30 guifg=#008787 "rgb=0,135,135
	"hi x031_DeepSkyBlue3 ctermfg=31 guifg=#0087af "rgb=0,135,175
	"hi x032_DeepSkyBlue3 ctermfg=32 guifg=#0087d7 "rgb=0,135,215
	"hi x033_DodgerBlue1 ctermfg=33 guifg=#0087ff "rgb=0,135,255
	"hi x034_Green3 ctermfg=34 guifg=#00af00 "rgb=0,175,0
	"hi x035_SpringGreen3 ctermfg=35 guifg=#00af5f "rgb=0,175,95
	"hi x036_DarkCyan ctermfg=36 guifg=#00af87 "rgb=0,175,135
	"hi x037_LightSeaGreen ctermfg=37 guifg=#00afaf "rgb=0,175,175
	"hi x038_DeepSkyBlue2 ctermfg=38 guifg=#00afd7 "rgb=0,175,215
	"hi x039_DeepSkyBlue1 ctermfg=39 guifg=#00afff "rgb=0,175,255
	"hi x040_Green3 ctermfg=40 guifg=#00d700 "rgb=0,215,0
	"hi x041_SpringGreen3 ctermfg=41 guifg=#00d75f "rgb=0,215,95
	"hi x042_SpringGreen2 ctermfg=42 guifg=#00d787 "rgb=0,215,135
	"hi x043_Cyan3 ctermfg=43 guifg=#00d7af "rgb=0,215,175
	"hi x044_DarkTurquoise ctermfg=44 guifg=#00d7d7 "rgb=0,215,215
	"hi x045_Turquoise2 ctermfg=45 guifg=#00d7ff "rgb=0,215,255
	"hi x046_Green1 ctermfg=46 guifg=#00ff00 "rgb=0,255,0
	"hi x047_SpringGreen2 ctermfg=47 guifg=#00ff5f "rgb=0,255,95
	"hi x048_SpringGreen1 ctermfg=48 guifg=#00ff87 "rgb=0,255,135
	"hi x049_MediumSpringGreen ctermfg=49 guifg=#00ffaf "rgb=0,255,175
	"hi x050_Cyan2 ctermfg=50 guifg=#00ffd7 "rgb=0,255,215
	"hi x051_Cyan1 ctermfg=51 guifg=#00ffff "rgb=0,255,255
	"hi x052_DarkRed ctermfg=52 guifg=#5f0000 "rgb=95,0,0
	"hi x053_DeepPink4 ctermfg=53 guifg=#5f005f "rgb=95,0,95
	"hi x054_Purple4 ctermfg=54 guifg=#5f0087 "rgb=95,0,135
	"hi x055_Purple4 ctermfg=55 guifg=#5f00af "rgb=95,0,175
	"hi x056_Purple3 ctermfg=56 guifg=#5f00d7 "rgb=95,0,215
	"hi x057_BlueViolet ctermfg=57 guifg=#5f00ff "rgb=95,0,255
	"hi x058_Orange4 ctermfg=58 guifg=#5f5f00 "rgb=95,95,0
	"hi x059_Grey37 ctermfg=59 guifg=#5f5f5f "rgb=95,95,95
	"hi x060_MediumPurple4 ctermfg=60 guifg=#5f5f87 "rgb=95,95,135
	"hi x061_SlateBlue3 ctermfg=61 guifg=#5f5faf "rgb=95,95,175
	"hi x062_SlateBlue3 ctermfg=62 guifg=#5f5fd7 "rgb=95,95,215
	"hi x063_RoyalBlue1 ctermfg=63 guifg=#5f5fff "rgb=95,95,255
	"hi x064_Chartreuse4 ctermfg=64 guifg=#5f8700 "rgb=95,135,0
	"hi x065_DarkSeaGreen4 ctermfg=65 guifg=#5f875f "rgb=95,135,95
	"hi x066_PaleTurquoise4 ctermfg=66 guifg=#5f8787 "rgb=95,135,135
	"hi x067_SteelBlue ctermfg=67 guifg=#5f87af "rgb=95,135,175
	"hi x068_SteelBlue3 ctermfg=68 guifg=#5f87d7 "rgb=95,135,215
	"hi x069_CornflowerBlue ctermfg=69 guifg=#5f87ff "rgb=95,135,255
	"hi x070_Chartreuse3 ctermfg=70 guifg=#5faf00 "rgb=95,175,0
	"hi x071_DarkSeaGreen4 ctermfg=71 guifg=#5faf5f "rgb=95,175,95
	"hi x072_CadetBlue ctermfg=72 guifg=#5faf87 "rgb=95,175,135
	"hi x073_CadetBlue ctermfg=73 guifg=#5fafaf "rgb=95,175,175
	"hi x074_SkyBlue3 ctermfg=74 guifg=#5fafd7 "rgb=95,175,215
	"hi x075_SteelBlue1 ctermfg=75 guifg=#5fafff "rgb=95,175,255
	"hi x076_Chartreuse3 ctermfg=76 guifg=#5fd700 "rgb=95,215,0
	"hi x077_PaleGreen3 ctermfg=77 guifg=#5fd75f "rgb=95,215,95
	"hi x078_SeaGreen3 ctermfg=78 guifg=#5fd787 "rgb=95,215,135
	"hi x079_Aquamarine3 ctermfg=79 guifg=#5fd7af "rgb=95,215,175
	"hi x080_MediumTurquoise ctermfg=80 guifg=#5fd7d7 "rgb=95,215,215
	"hi x081_SteelBlue1 ctermfg=81 guifg=#5fd7ff "rgb=95,215,255
	"hi x082_Chartreuse2 ctermfg=82 guifg=#5fff00 "rgb=95,255,0
	"hi x083_SeaGreen2 ctermfg=83 guifg=#5fff5f "rgb=95,255,95
	"hi x084_SeaGreen1 ctermfg=84 guifg=#5fff87 "rgb=95,255,135
	"hi x085_SeaGreen1 ctermfg=85 guifg=#5fffaf "rgb=95,255,175
	"hi x086_Aquamarine1 ctermfg=86 guifg=#5fffd7 "rgb=95,255,215
	"hi x087_DarkSlateGray2 ctermfg=87 guifg=#5fffff "rgb=95,255,255
	"hi x088_DarkRed ctermfg=88 guifg=#870000 "rgb=135,0,0
	"hi x089_DeepPink4 ctermfg=89 guifg=#87005f "rgb=135,0,95
	"hi x090_DarkMagenta ctermfg=90 guifg=#870087 "rgb=135,0,135
	"hi x091_DarkMagenta ctermfg=91 guifg=#8700af "rgb=135,0,175
	"hi x092_DarkViolet ctermfg=92 guifg=#8700d7 "rgb=135,0,215
	"hi x093_Purple ctermfg=93 guifg=#8700ff "rgb=135,0,255
	"hi x094_Orange4 ctermfg=94 guifg=#875f00 "rgb=135,95,0
	"hi x095_LightPink4 ctermfg=95 guifg=#875f5f "rgb=135,95,95
	"hi x096_Plum4 ctermfg=96 guifg=#875f87 "rgb=135,95,135
	"hi x097_MediumPurple3 ctermfg=97 guifg=#875faf "rgb=135,95,175
	"hi x098_MediumPurple3 ctermfg=98 guifg=#875fd7 "rgb=135,95,215
	"hi x099_SlateBlue1 ctermfg=99 guifg=#875fff "rgb=135,95,255
	"hi x100_Yellow4 ctermfg=100 guifg=#878700 "rgb=135,135,0
	"hi x101_Wheat4 ctermfg=101 guifg=#87875f "rgb=135,135,95
	"hi x102_Grey53 ctermfg=102 guifg=#878787 "rgb=135,135,135
	"hi x103_LightSlateGrey ctermfg=103 guifg=#8787af "rgb=135,135,175
	"hi x104_MediumPurple ctermfg=104 guifg=#8787d7 "rgb=135,135,215
	"hi x105_LightSlateBlue ctermfg=105 guifg=#8787ff "rgb=135,135,255
	"hi x106_Yellow4 ctermfg=106 guifg=#87af00 "rgb=135,175,0
	"hi x107_DarkOliveGreen3 ctermfg=107 guifg=#87af5f "rgb=135,175,95
	"hi x108_DarkSeaGreen ctermfg=108 guifg=#87af87 "rgb=135,175,135
	"hi x109_LightSkyBlue3 ctermfg=109 guifg=#87afaf "rgb=135,175,175
	"hi x110_LightSkyBlue3 ctermfg=110 guifg=#87afd7 "rgb=135,175,215
	"hi x111_SkyBlue2 ctermfg=111 guifg=#87afff "rgb=135,175,255
	"hi x112_Chartreuse2 ctermfg=112 guifg=#87d700 "rgb=135,215,0
	"hi x113_DarkOliveGreen3 ctermfg=113 guifg=#87d75f "rgb=135,215,95
	"hi x114_PaleGreen3 ctermfg=114 guifg=#87d787 "rgb=135,215,135
	"hi x115_DarkSeaGreen3 ctermfg=115 guifg=#87d7af "rgb=135,215,175
	"hi x116_DarkSlateGray3 ctermfg=116 guifg=#87d7d7 "rgb=135,215,215
	"hi x117_SkyBlue1 ctermfg=117 guifg=#87d7ff "rgb=135,215,255
	"hi x118_Chartreuse1 ctermfg=118 guifg=#87ff00 "rgb=135,255,0
	"hi x119_LightGreen ctermfg=119 guifg=#87ff5f "rgb=135,255,95
	"hi x120_LightGreen ctermfg=120 guifg=#87ff87 "rgb=135,255,135
	"hi x121_PaleGreen1 ctermfg=121 guifg=#87ffaf "rgb=135,255,175
	"hi x122_Aquamarine1 ctermfg=122 guifg=#87ffd7 "rgb=135,255,215
	"hi x123_DarkSlateGray1 ctermfg=123 guifg=#87ffff "rgb=135,255,255
	"hi x124_Red3 ctermfg=124 guifg=#af0000 "rgb=175,0,0
	"hi x125_DeepPink4 ctermfg=125 guifg=#af005f "rgb=175,0,95
	"hi x126_MediumVioletRed ctermfg=126 guifg=#af0087 "rgb=175,0,135
	"hi x127_Magenta3 ctermfg=127 guifg=#af00af "rgb=175,0,175
	"hi x128_DarkViolet ctermfg=128 guifg=#af00d7 "rgb=175,0,215
	"hi x129_Purple ctermfg=129 guifg=#af00ff "rgb=175,0,255
	"hi x130_DarkOrange3 ctermfg=130 guifg=#af5f00 "rgb=175,95,0
	"hi x131_IndianRed ctermfg=131 guifg=#af5f5f "rgb=175,95,95
	"hi x132_HotPink3 ctermfg=132 guifg=#af5f87 "rgb=175,95,135
	"hi x133_MediumOrchid3 ctermfg=133 guifg=#af5faf "rgb=175,95,175
	"hi x134_MediumOrchid ctermfg=134 guifg=#af5fd7 "rgb=175,95,215
	"hi x135_MediumPurple2 ctermfg=135 guifg=#af5fff "rgb=175,95,255
	"hi x136_DarkGoldenrod ctermfg=136 guifg=#af8700 "rgb=175,135,0
	"hi x137_LightSalmon3 ctermfg=137 guifg=#af875f "rgb=175,135,95
	"hi x138_RosyBrown ctermfg=138 guifg=#af8787 "rgb=175,135,135
	"hi x139_Grey63 ctermfg=139 guifg=#af87af "rgb=175,135,175
	"hi x140_MediumPurple2 ctermfg=140 guifg=#af87d7 "rgb=175,135,215
	"hi x141_MediumPurple1 ctermfg=141 guifg=#af87ff "rgb=175,135,255
	"hi x142_Gold3 ctermfg=142 guifg=#afaf00 "rgb=175,175,0
	"hi x143_DarkKhaki ctermfg=143 guifg=#afaf5f "rgb=175,175,95
	"hi x144_NavajoWhite3 ctermfg=144 guifg=#afaf87 "rgb=175,175,135
	"hi x145_Grey69 ctermfg=145 guifg=#afafaf "rgb=175,175,175
	"hi x146_LightSteelBlue3 ctermfg=146 guifg=#afafd7 "rgb=175,175,215
	"hi x147_LightSteelBlue ctermfg=147 guifg=#afafff "rgb=175,175,255
	"hi x148_Yellow3 ctermfg=148 guifg=#afd700 "rgb=175,215,0
	"hi x149_DarkOliveGreen3 ctermfg=149 guifg=#afd75f "rgb=175,215,95
	"hi x150_DarkSeaGreen3 ctermfg=150 guifg=#afd787 "rgb=175,215,135
	"hi x151_DarkSeaGreen2 ctermfg=151 guifg=#afd7af "rgb=175,215,175
	"hi x152_LightCyan3 ctermfg=152 guifg=#afd7d7 "rgb=175,215,215
	"hi x153_LightSkyBlue1 ctermfg=153 guifg=#afd7ff "rgb=175,215,255
	"hi x154_GreenYellow ctermfg=154 guifg=#afff00 "rgb=175,255,0
	"hi x155_DarkOliveGreen2 ctermfg=155 guifg=#afff5f "rgb=175,255,95
	"hi x156_PaleGreen1 ctermfg=156 guifg=#afff87 "rgb=175,255,135
	"hi x157_DarkSeaGreen2 ctermfg=157 guifg=#afffaf "rgb=175,255,175
	"hi x158_DarkSeaGreen1 ctermfg=158 guifg=#afffd7 "rgb=175,255,215
	"hi x159_PaleTurquoise1 ctermfg=159 guifg=#afffff "rgb=175,255,255
	"hi x160_Red3 ctermfg=160 guifg=#d70000 "rgb=215,0,0
	"hi x161_DeepPink3 ctermfg=161 guifg=#d7005f "rgb=215,0,95
	"hi x162_DeepPink3 ctermfg=162 guifg=#d70087 "rgb=215,0,135
	"hi x163_Magenta3 ctermfg=163 guifg=#d700af "rgb=215,0,175
	"hi x164_Magenta3 ctermfg=164 guifg=#d700d7 "rgb=215,0,215
	"hi x165_Magenta2 ctermfg=165 guifg=#d700ff "rgb=215,0,255
	"hi x166_DarkOrange3 ctermfg=166 guifg=#d75f00 "rgb=215,95,0
	"hi x167_IndianRed ctermfg=167 guifg=#d75f5f "rgb=215,95,95
	"hi x168_HotPink3 ctermfg=168 guifg=#d75f87 "rgb=215,95,135
	"hi x169_HotPink2 ctermfg=169 guifg=#d75faf "rgb=215,95,175
	"hi x170_Orchid ctermfg=170 guifg=#d75fd7 "rgb=215,95,215
	"hi x171_MediumOrchid1 ctermfg=171 guifg=#d75fff "rgb=215,95,255
	"hi x172_Orange3 ctermfg=172 guifg=#d78700 "rgb=215,135,0
	"hi x173_LightSalmon3 ctermfg=173 guifg=#d7875f "rgb=215,135,95
	"hi x174_LightPink3 ctermfg=174 guifg=#d78787 "rgb=215,135,135
	"hi x175_Pink3 ctermfg=175 guifg=#d787af "rgb=215,135,175
	"hi x176_Plum3 ctermfg=176 guifg=#d787d7 "rgb=215,135,215
	"hi x177_Violet ctermfg=177 guifg=#d787ff "rgb=215,135,255
	"hi x178_Gold3 ctermfg=178 guifg=#d7af00 "rgb=215,175,0
	"hi x179_LightGoldenrod3 ctermfg=179 guifg=#d7af5f "rgb=215,175,95
	"hi x180_Tan ctermfg=180 guifg=#d7af87 "rgb=215,175,135
	"hi x181_MistyRose3 ctermfg=181 guifg=#d7afaf "rgb=215,175,175
	"hi x182_Thistle3 ctermfg=182 guifg=#d7afd7 "rgb=215,175,215
	"hi x183_Plum2 ctermfg=183 guifg=#d7afff "rgb=215,175,255
	"hi x184_Yellow3 ctermfg=184 guifg=#d7d700 "rgb=215,215,0
	"hi x185_Khaki3 ctermfg=185 guifg=#d7d75f "rgb=215,215,95
	"hi x186_LightGoldenrod2 ctermfg=186 guifg=#d7d787 "rgb=215,215,135
	"hi x187_LightYellow3 ctermfg=187 guifg=#d7d7af "rgb=215,215,175
	"hi x188_Grey84 ctermfg=188 guifg=#d7d7d7 "rgb=215,215,215
	"hi x189_LightSteelBlue1 ctermfg=189 guifg=#d7d7ff "rgb=215,215,255
	"hi x190_Yellow2 ctermfg=190 guifg=#d7ff00 "rgb=215,255,0
	"hi x191_DarkOliveGreen1 ctermfg=191 guifg=#d7ff5f "rgb=215,255,95
	"hi x192_DarkOliveGreen1 ctermfg=192 guifg=#d7ff87 "rgb=215,255,135
	"hi x193_DarkSeaGreen1 ctermfg=193 guifg=#d7ffaf "rgb=215,255,175
	"hi x194_Honeydew2 ctermfg=194 guifg=#d7ffd7 "rgb=215,255,215
	"hi x195_LightCyan1 ctermfg=195 guifg=#d7ffff "rgb=215,255,255
	"hi x196_Red1 ctermfg=196 guifg=#ff0000 "rgb=255,0,0
	"hi x197_DeepPink2 ctermfg=197 guifg=#ff005f "rgb=255,0,95
	"hi x198_DeepPink1 ctermfg=198 guifg=#ff0087 "rgb=255,0,135
	"hi x199_DeepPink1 ctermfg=199 guifg=#ff00af "rgb=255,0,175
	"hi x200_Magenta2 ctermfg=200 guifg=#ff00d7 "rgb=255,0,215
	"hi x201_Magenta1 ctermfg=201 guifg=#ff00ff "rgb=255,0,255
	"hi x202_OrangeRed1 ctermfg=202 guifg=#ff5f00 "rgb=255,95,0
	"hi x203_IndianRed1 ctermfg=203 guifg=#ff5f5f "rgb=255,95,95
	"hi x204_IndianRed1 ctermfg=204 guifg=#ff5f87 "rgb=255,95,135
	"hi x205_HotPink ctermfg=205 guifg=#ff5faf "rgb=255,95,175
	"hi x206_HotPink ctermfg=206 guifg=#ff5fd7 "rgb=255,95,215
	"hi x207_MediumOrchid1 ctermfg=207 guifg=#ff5fff "rgb=255,95,255
	"hi x208_DarkOrange ctermfg=208 guifg=#ff8700 "rgb=255,135,0
	"hi x209_Salmon1 ctermfg=209 guifg=#ff875f "rgb=255,135,95
	"hi x210_LightCoral ctermfg=210 guifg=#ff8787 "rgb=255,135,135
	"hi x211_PaleVioletRed1 ctermfg=211 guifg=#ff87af "rgb=255,135,175
	"hi x212_Orchid2 ctermfg=212 guifg=#ff87d7 "rgb=255,135,215
	"hi x213_Orchid1 ctermfg=213 guifg=#ff87ff "rgb=255,135,255
	"hi x214_Orange1 ctermfg=214 guifg=#ffaf00 "rgb=255,175,0
	"hi x215_SandyBrown ctermfg=215 guifg=#ffaf5f "rgb=255,175,95
	"hi x216_LightSalmon1 ctermfg=216 guifg=#ffaf87 "rgb=255,175,135
	"hi x217_LightPink1 ctermfg=217 guifg=#ffafaf "rgb=255,175,175
	"hi x218_Pink1 ctermfg=218 guifg=#ffafd7 "rgb=255,175,215
	"hi x219_Plum1 ctermfg=219 guifg=#ffafff "rgb=255,175,255
	"hi x220_Gold1 ctermfg=220 guifg=#ffd700 "rgb=255,215,0
	"hi x221_LightGoldenrod2 ctermfg=221 guifg=#ffd75f "rgb=255,215,95
	"hi x222_LightGoldenrod2 ctermfg=222 guifg=#ffd787 "rgb=255,215,135
	"hi x223_NavajoWhite1 ctermfg=223 guifg=#ffd7af "rgb=255,215,175
	"hi x224_MistyRose1 ctermfg=224 guifg=#ffd7d7 "rgb=255,215,215
	"hi x225_Thistle1 ctermfg=225 guifg=#ffd7ff "rgb=255,215,255
	"hi x226_Yellow1 ctermfg=226 guifg=#ffff00 "rgb=255,255,0
	"hi x227_LightGoldenrod1 ctermfg=227 guifg=#ffff5f "rgb=255,255,95
	"hi x228_Khaki1 ctermfg=228 guifg=#ffff87 "rgb=255,255,135
	"hi x229_Wheat1 ctermfg=229 guifg=#ffffaf "rgb=255,255,175
	"hi x230_Cornsilk1 ctermfg=230 guifg=#ffffd7 "rgb=255,255,215
	"hi x231_Grey100 ctermfg=231 guifg=#ffffff "rgb=255,255,255
	"hi x232_Grey3 ctermfg=232 guifg=#080808 "rgb=8,8,8
	"hi x233_Grey7 ctermfg=233 guifg=#121212 "rgb=18,18,18
	"hi x234_Grey11 ctermfg=234 guifg=#1c1c1c "rgb=28,28,28
	"hi x235_Grey15 ctermfg=235 guifg=#262626 "rgb=38,38,38
	"hi x236_Grey19 ctermfg=236 guifg=#303030 "rgb=48,48,48
	"hi x237_Grey23 ctermfg=237 guifg=#3a3a3a "rgb=58,58,58
	"hi x238_Grey27 ctermfg=238 guifg=#444444 "rgb=68,68,68
	"hi x239_Grey30 ctermfg=239 guifg=#4e4e4e "rgb=78,78,78
	"hi x240_Grey35 ctermfg=240 guifg=#585858 "rgb=88,88,88
	"hi x241_Grey39 ctermfg=241 guifg=#626262 "rgb=98,98,98
	"hi x242_Grey42 ctermfg=242 guifg=#6c6c6c "rgb=108,108,108
	"hi x243_Grey46 ctermfg=243 guifg=#767676 "rgb=118,118,118
	"hi x244_Grey50 ctermfg=244 guifg=#808080 "rgb=128,128,128
	"hi x245_Grey54 ctermfg=245 guifg=#8a8a8a "rgb=138,138,138
	"hi x246_Grey58 ctermfg=246 guifg=#949494 "rgb=148,148,148
	"hi x247_Grey62 ctermfg=247 guifg=#9e9e9e "rgb=158,158,158
	"hi x248_Grey66 ctermfg=248 guifg=#a8a8a8 "rgb=168,168,168
	"hi x249_Grey70 ctermfg=249 guifg=#b2b2b2 "rgb=178,178,178
	"hi x250_Grey74 ctermfg=250 guifg=#bcbcbc "rgb=188,188,188
	"hi x251_Grey78 ctermfg=251 guifg=#c6c6c6 "rgb=198,198,198
	"hi x252_Grey82 ctermfg=252 guifg=#d0d0d0 "rgb=208,208,208
	"hi x253_Grey85 ctermfg=253 guifg=#dadada "rgb=218,218,218
	"hi x254_Grey89 ctermfg=254 guifg=#e4e4e4 "rgb=228,228,228
	"hi x255_Grey93 ctermfg=255 guifg=#eeeeee "rgb=238,238,238
	"}}}

"{{{ Platform specific
		"{{{Mac Specific
		"let g:ycm_warning_symbol = 'W!'
		"let g:ycm_filepath_completion_use_working_dir=1
		""let g:ycm_extra_conf_globlist=['~/eecs/281market/*']
		"let g:ycm_extra_conf_globlist=['~/*']  "stop confirmation dialogue
		"let g:ycm_collect_identifiers_from_tags_files=1
		"let g:ycm_seed_identifiers_with_syntax=1
		"let g:ycm_extra_conf_vim_data=['v:version']
		"let g:ycm_global_ycm_extra_conf = '~/'
		"}}}
		"{{{Linux Specific
		"let g:ycm_path_to_python_interpreter='/usr/bin/python'
		"let g:syntastic_cpp_checkers='gcc'
		"let g:syntastic_cpp_compiler='clang++'
		"let g:syntastic_cpp_compiler_options='-std=c++11 -stdlib=libc++'
		"let g:syntastic_debug=1
		"}}}
"}}}
"Hacks"{{{
" Not sure where these came from"{{{
"let prvft='f'
"let prvftc=32
"fun! MLvF(c,...)
    "let [g:prvftc,g:prvft]=[a:c,a:0? 'f':'F']
    "let pos=searchpos('\C\V'.nr2char(g:prvftc),'bW')
    "call setpos("'x", pos==[0,0]? [0,line('.'),col('.'),0] : [0,pos[0],pos[1],0])
    "return "`x"
"endfun
"fun! MLvf(c,...)
    "let [g:prvftc,g:prvft]=[a:c,a:0? 'F':'f']
    "let pos=searchpos('\C\V'.nr2char(g:prvftc).(mode(1)=='no'? '\zs' : ''),'W')
    "call setpos("'x", pos==[0,0]? [0,line('.'),col('.'),0] : [0,pos[0],pos[1],0])
    "return "`x"
"endfun
"fun! MLvT(c,...)
    "let [g:prvftc,g:prvft]=[a:c,a:0? 't':'T']
    "let pos=searchpos('\C\V'.nr2char(g:prvftc).'\zs','bW')
    "call setpos("'x", pos==[0,0]? [0,line('.'),col('.'),0] : [0,pos[0],pos[1],0])
    "return "`x"
"endfun
"fun! MLvt(c,...)
    "let [g:prvftc,g:prvft]=[a:c,a:0? 'T':'t']
    "let pos=searchpos('\C\V\_.'.(mode(1)=='no'? '\zs' : '').nr2char(g:prvftc),'W')
    "call setpos("'x", pos==[0,0]? [0,line('.'),col('.'),0] : [0,pos[0],pos[1],0])
    "return "`x"
"endfun
"no <expr> F MLvF(getchar())
"no <expr> f MLvf(getchar())
"no <expr> T MLvT(getchar())
"no <expr> t MLvt(getchar())
"no <expr> ; MLv{prvft}(prvftc)
"no <expr> , MLv{prvft<#'Z'? tolower(prvft) : toupper(prvft)}(prvftc,1)"}}}
"}}}
"}}}

" RECENTLY ADDED
""""""""""""""""
" DUMP

"default formatoptions
set formatoptions=tcq
set fo-=cro

cnoremap W w
"let g:ycm_global_ycm_extra_conf='/Users/nateargetsinger/.vim/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='/Users/nateargetsinger/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'


nnoremap ]q :cn<cr>
nnoremap [q :cp<cr>

com! FormatJSON %!python -m json.tool


nnoremap <c-s> :Unite neobundle/search

set wrap linebreak nolist

set autoread

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1

endif
