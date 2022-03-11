if exists('g:autoflake_vim_loaded')
  finish
endif
let g:autoflake_vim_loaded = 1
lockvar g:autoflake_vim_loaded

let saved_cpo = &cpo
set cpo&vim

function! autoflake#execute(bang, option)
  if &ft != 'python'
    return
  endif

  if !executable('autoflake')
    echohl ErrorMsg
    echom "Please install autoflake first. (pip install autoflake)"
    echohl None
    return
  endif

  noautocmd write
  let filename = expand('%:p')

  if a:bang
    call <SID>execute_diff(filename, a:option)
  else
    call <SID>execute_inplace(filename, a:option)
  endif
endfunction

" dump the current file to a tempfile
" execute autoflake inplace to the tempfile
" delete the content of the current file and then fetch from the tempfile
function! s:execute_inplace(filename, option)
  let saved_cursor = getpos('.')
  let option = '-i ' . a:option
  let tmpfile = tempname()
  call system(printf('cat %s > %s', a:filename, tmpfile))
  let command = printf('autoflake %s %s', option, tmpfile)
  call system(command)
  %d
  execute 'read ' . tmpfile
  1d
  call delete(tmpfile)
  call setpos('.', saved_cursor)
endfunction

function! s:execute_diff(filename, option)
  let command = printf('autoflake %s %s', a:option, a:filename)
  let result = systemlist(command)
  if len(result) > 0 
    call <sid>show(result)
  endif
endfunction

function! s:show(result)
  botright new autoflake
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call append(0, a:result)
  setlocal nomodifiable
  setlocal nonu nornu
  setlocal filetype=diff
endfunction

function! s:arg_complete(arg_lead, cmd_line, cursor_pos)
  let args = [
        \ '--expand-star-imports',
        \ '--remove-all-unused-imports',
        \ '--ignore-init-module-imports',
        \ '--remove-duplicate-keys', 
        \ '--remove-unused-variables'
        \ ]

  return filter(args, 'v:val =~ "^" . a:arg_lead')
endfunction

command! -bang -complete=customlist,<SID>arg_complete -nargs=* Autoflake silent call autoflake#execute(<bang>0, <q-args>)

let &cpo = saved_cpo
