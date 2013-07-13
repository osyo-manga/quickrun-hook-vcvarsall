scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = {
\	"name" : "vcvarsall",
\	"kind" : "hook",
\	"config" : {
\		"enable" : 0,
\		"bat" : "",
\	},
\}

function! s:hook.on_module_loaded(session, context)
	if type(a:session.config.exec) == type([])
		let a:session.config.exec[0] = join([self.config.bat, $PROCESSOR_ARCHITECTURE, '\&']) . a:session.config.exec[0]
	else
		let a:session.config.exec = join([self.config.bat, $PROCESSOR_ARCHITECTURE, '\&']) . a:session.config.exec
	endif
endfunction


function! quickrun#hook#vcvarsall#new()
	return deepcopy(s:hook)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
