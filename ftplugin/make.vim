" This is necessary because when you use this command and go to another
" makefile vim will try to source this file again and give you errors.
if exists('*Gf_patch')
    "echo 'not sourcing again'
    finish
"else
    "echo 'not defined... sourcing'
endif

function! Gf_patch(path)
" Store the variable piece in reg0
execute 'normal! yiW'
if @0[0]=='$'
    "echo 'yes you have a make variable to expand'
    normal! w"vyi(
    let var=@v
    let finished=0
    normal! f)l"pyW
    let path=@p
    while !finished
        if var == 'HOME'
            let path=$HOME.path
            break
        endif
        call search(@v."[^)]", 'b')
        normal! f=wyiW
        if @0[0] != '$'
            let path = @0.path
            let finished = 1
        else
            normal! w"vyi(
            let var=@v
            normal! f)l"pyW
            let path=@p.path
        endif
    endwhile
    execute "edit ".path
else
    execute "edit ".@0
endif
endfunction

nnoremap gf :call Gf_patch('')<cr>

nnoremap <2-LeftMouse> :call Gf_patch('')<cr>
