function! Anagram(word, candidates) abort
    let ret = []
    let wchars = sort(split(a:word, '\zs'), 'i')

    for c in a:candidates
        let cchars = sort(split(c, '\zs'), 'i')
        if cchars ==? wchars && c !=? a:word
            call add(ret, c)
        endif
    endfor

    return sort(ret)
endfunction
