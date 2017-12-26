let s:scrabble = [
            \ [['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'], 1],
            \ [['D', 'G'],                                         2],
            \ [['B', 'C', 'M', 'P'],                               3],
            \ [['F', 'H', 'V', 'W', 'Y'],                          4],
            \ [['K'],                                              5],
            \ [['J', 'X'],                                         8],
            \ [['Q', 'Z'],                                         10],
            \ ]

function! Score(word) abort
    let chars = split(toupper(a:word), '\zs')

    let score = 0

    for [letters, value] in s:scrabble
        for letter in letters
            let ccount = count(chars, letter)
            let score += ccount * value
        endfor
    endfor

    return score
endfunction
