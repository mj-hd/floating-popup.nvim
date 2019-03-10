if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

command! -nargs=0 GoDocPopup call floatingpopup#godoc#Open()
