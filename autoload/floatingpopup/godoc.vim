function! floatingpopup#godoc#Open()
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
