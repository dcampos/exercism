function! IsPangram(sentence) abort
    let normalized = substitute(tolower(a:sentence), '\A', '', 'g')
    return len(uniq(sort(split(normalized, '\zs')))) == 26
endfunction
