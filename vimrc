let $DIR="$HOME/environment/dotfiles"
"This level of compatability level should work everywhere {{{
if (!exists("compatability_level"))
    let compatability_level = 0
endif
if (compatability_level >= 0)
	"echo "adding base line config"
    inoremap jj <esc>


source $DIR/extend/emacs.vim

" If on macvim take advantage of option key as meta.
" TODO: figure out a way to meta-ize option key on other platforms.
if has("gui_macvim")
	set macmeta
endif



nnoremap <F4> :1<cr>O<esc>O---<esc>O<esc>"=strftime("%c")<CR>po<tab>

endif
"}}}
" This level should not be used with IDEs but are necessary on headless nodes"{{{

if (compatability_level >= 1)
    nnoremap <leader>q :q<cr>

" Disable stupid backup and swap files - they trigger too many events
    " for file system watchers
    set nobackup
    set nowritebackup
    set noswapfile

    "Terminal
    nnoremap <c-t><c-t> :vsp term://zsh<cr>
    nnoremap <leader>E :wa<cr>:qa<cr>

    " AIRLINE STUFF
" let g:airline_theme='dark'
 "let g:airline_theme='powerlineish'
" let g:airline_theme='simple'
 "let g:airline_theme='tomorrow'
"let g:airline_theme='wombat'
" let g:airline_theme='molokai'
 let g:airline_theme='badwolf'
" let g:airline_theme='bubblegum'
" let g:airline_theme='jellybeans'
"let g:airline_section_a=''
let g:airline_section_b=''
"let g:airline_section_b='%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_c=''
"let g:airline_section_gutter=''
let g:airline_section_x='%{getcwd()}/%f'
"let g:airline_section_y='%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_y=''
let g:airline_section_z='%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
"let g:airline_section_z=''
let g:airline_section_warning=''


    " Buffer stuff"{{{
	nnoremap <Leader>b :bp<CR>
	nnoremap <Leader>f :bn<CR>
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
    "}}}
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
    "source ~/environment/homebrewed_juja/parse_note.vim
    if has('nvim')
        tnoremap <Esc> <C-\><C-n>

        tnoremap <A-h> <C-\><C-n><C-w>h
        tnoremap <A-j> <C-\><C-n><C-w>j
        tnoremap <A-k> <C-\><C-n><C-w>k
        tnoremap <A-l> <C-\><C-n><C-w>l
        nnoremap <A-h> <C-w>h
        nnoremap <A-j> <C-w>j
        nnoremap <A-k> <C-w>k
        nnoremap <A-l> <C-w>l
        nnoremap <A-S-l> :w<cr><C-w>la
    endif

endif"}}}


if (compatability_level >= 2)
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 1
    cnoreabbrev resource source ~/environment/dotfiles/vimrc
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


"nnoremap <F4> ggO<esc>O---<esc>O<esc>"=strftime("%c")<CR>po<tab>
endif











if ( 1 == 2  )
    source $HOME/environment/dotfiles/vim_archive.vim
endif

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""DUMP"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
if (compatability_level >= 2)
    let $HOMEBREW="$HOME/environment/homebrewed_mojo"
    source $HOMEBREW/parse_note.vim
    nnoremap <leader>C :!ctags -R .<cr>
    set expandtab

    nnoremap <a-l> :w<cr><c-w>laq<cr><Up><cr>
    function! Zen_html_tab()
        let line = getline('.')
        if match(line, '<.*>') >= 0
            return "\<c-y>n"
        endif
        return "\<c-y>,"
    endfunction

    autocmd FileType html imap <buffer><expr><tab> Zen_html_tab()

source $DIR/extend/Bclose.vim

    " Adding logic to catch terminal color - NOTE $TERM_COLOR has to be set
    " manually
if $TERM_COLOR == 'light'
    set background=light
elseif $TERM_COLOR == 'dark'
    set background=dark
endif


map <F1> :mksession! ~/.vim_session <CR>
map <F2> :source ~/.vim_session <CR>

nnoremap <leader>e :wq<cr>

function! Add_recent_screenshot()
    pyfile $HOMEBREW/add_screenshot.py
endfunction

function! Parse_date()
    pyfile $HOME/Google_Drive/dev/web/vis/examples/timeline/vis_timeline.py
endfunction

nnoremap <leader><c-f><c-f> :call Parse_date()<cr>

" markup util
inoremap <c-i><c-i> <c-o>:call Add_recent_screenshot()<cr>


cnoreabbrev SWTC SWTC /Users/tanedev/environment/dotfiles/fun/SWTC.vim/intro.swtc


endif
