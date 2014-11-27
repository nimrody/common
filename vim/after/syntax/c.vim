
function! s:highlight()
    let list = taglist('.*')

    let flist = []

    for item in list
        let kind = item.kind
        if kind == 'f' 
            call add(flist, item)
        endif
    endfor

    if len(flist) > 3000
        return
    end

    for item in flist
        let name=item.name
        exec 'syntax keyword Identifier '.name
    endfor
endfunction

call s:highlight()
