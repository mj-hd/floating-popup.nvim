let s:popup = {}

function! s:popup_open() dict abort
	let opener_bufnr = bufnr('%')
	call nvim_open_win(opener_bufnr, v:true, self.width(), self.height(), self.genopts())
	enew!
	call setline(1, self.content)
	setlocal nonumber nomodified nomodifiable
	setlocal winhl=Normal:floatingpopupNormal
	noremap <buffer> <silent> <Esc> :<C-U>close<CR>
	let popup_bufnr = bufnr('%')
	let self.bufnr = popup_bufnr
endfunction
let s:popup.open = funcref('s:popup_open')

function! s:popup_width() dict abort
	return 60 " TODO: calculate
endfunction
let s:popup.width = funcref('s:popup_width')

function! s:popup_height() dict abort
	return 20 " TODO: calculate
endfunction
let s:popup.height = funcref('s:popup_height')

function! s:popup_genopts() dict abort
	return {
		\	'relative': 'cursor',
		\	'col': 0,
		\	'row': 1,
		\ } " TODO: calculate
endfunction
let s:popup.genopts = funcref('s:popup_genopts')

function! s:popup_close() dict abort
	if !self.has_win()
		return
	endif
	noautocmd execute self.get_winnr() . 'wincmd c'
endfunction
let s:popup.close = funcref('s:popup_close')

function! s:popup_get_winnr() dict abort
	if !self.has_win()
		return
	endif
	return bufwinnr(self.bufnr)
endfunction
let s:popup.get_winnr = funcref('s:popup_get_winnr')

function! s:popup_has_win() dict abort
	return has_key(self, 'bufnr')
endfunction
let s:popup.has_win = funcref('s:popup_has_win')

function! floatingpopup#popup#new(content) abort
	let i = deepcopy(s:popup)
	let i.content = a:content
	return i
endfunction
