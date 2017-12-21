function! WordCount(phrase) abort
    let words = split(tolower(a:phrase), '[^''a-zA-Z0-9]\+')
    let ret = {}

    for word in words
        let word = substitute(word, '^''*\|''*$', '', 'g')
        let ret[word] = has_key(ret, word) ? ret[word] + 1 : 1
    endfor

    return ret
endfunction
