nmap <space>s <plug>(SubversiveSubstituteRange)
xmap <space>s <plug>(SubversiveSubstituteRange)

nmap <space>ss <plug>(SubversiveSubstituteWordRange)

" ie = inner entire buffer
onoremap if :exec "normal! ggVG"<cr>

" iv = current viewable text in the buffer
onoremap iv :exec "normal! HVL"<cr>

" Run macro over selected rows
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Create missing folders when creating new file
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Create and move to split
" Check if a split already exists in the direction you want to move to.
" If it does, the function simply moves the focus to that split.
" If there isn’t a split already, the function creates a new split and
" moves the focus to that split
function! WinMove(key)
  let t:curwin = winnr()
  execute "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    execute "wincmd ".a:key
  endif
endfunction

" Search within range
function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction

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
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose('<bang>', '<args>')

function CloseBuffer()
  if bufname("") == "NERD_tree_1"
    return
  endif
  let lenBuffers = len(getbufinfo({'buflisted':1}))
  if lenBuffers == 1
    NvimTreeClose
    q!
  else
    Bclose
  endif
  " echo len(a:buffer)
  " :NERDTreeClose<CR>
endfunction

function CloseAll()
  if bufname("") == "NERD_tree_1"
    return
  endif
  NERDTreeClose
  q!
endfunction

" command! -bang -complete=buffer -nargs=? Bnum call BufferNumber('<bang>', '<args>')

function CheckNerd(where)
  if bufname("") != "NERD_tree_1"
    if a:where == "next"
      bnext
    else
      bprev
    endif
  endif
endfunction

nnoremap <silent> q :call CloseBuffer()<CR>
nnoremap <silent> <C-s> :w<CR>

let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
