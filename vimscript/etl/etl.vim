function! Transform(scores) abort
    let result = {}

    for number in keys(a:scores)
        for letter in a:scores[number]
            let result[tolower(letter)] = str2nr(number)
        endfor
    endfor

    return result
endfunction
