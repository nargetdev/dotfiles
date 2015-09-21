"This level of compatability level should work everywhere {{{
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
endfunction "}}}
"remove trailing whitespace
cnoreabbrev trailing %s/\s\+$//

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
    source $HOME/environment/homebrewed_mojo/parse_note.vim
    nnoremap <leader>C :!ctags -R .<cr>
    set expandtab

    nnoremap <a-l> :w<cr><c-w>laq<cr><Up><cr>
    function! s:zen_html_tab()
        let line = getline('.')
        if match(line, '<.*>') >= 0
            return "\<c-y>n"
        endif
        return "\<c-y>,"
    endfunction

    autocmd FileType html imap <buffer><expr><tab> <sid>zen_html_tab()

    " Adding logic to catch terminal color - NOTE $TERM_COLOR has to be set
    " manually
if $TERM_COLOR == 'light'
    set background=light
elseif $TERM_COLOR == 'dark'
    set background=dark
endif


map <F1> :mksession! ~/.vim_session <CR>
map <F2> :source ~/.vim_session <CR>

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>

nnoremap <leader>e :wq<cr>

function! Add_recent_screenshot()
python << EOF
__author__ = 'tanedev'
import vim


screenshot_path = "/Users/tanedev/digital_assets/screenshots"


import os
import glob
newest = max(glob.iglob(screenshot_path + '/*'), key=os.path.getctime)

import shutil
shutil.copy(newest, "/Users/tanedev/environment/.tmp_storage/screenshot_snag")

#vim.command("i" + newest + "<esc>")

print "\n\n" + newest

EOF
endfunction

endif
