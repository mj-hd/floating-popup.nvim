function! s:gogetdoc()
  let l:cmd = [
        \ 'gogetdoc',
        \ '-tags', go#config#BuildTags(),
        \ '-pos', expand("%:p:gs!\\!/!") . ':#' . go#util#OffsetCursor()]

  if &modified
    let l:cmd += ['-modified']
    return go#util#Exec(l:cmd, go#util#archive())
  endif

  return go#util#Exec(l:cmd)
endfunction

function! floatingpopup#godoc#Open() abort
  let [l:out, l:err] = s:gogetdoc()
  if out == -1
    call go#util#EchoError(out)
    return
  endif
  if l:err
    call go#util#EchoError(out)
    return
  endif
  let l:out = append(0, split(l:out, "\n"))
  call floatingpopup#popup#new(out).open()
endfunction
