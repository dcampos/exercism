let s:roman = [['M', 1000], ['CM', 900], ['D', 500], ['CD', 400], ['C', 100], ['XC', 90],
            \  ['L', 50], ['XL', 40], ['X', 10], ['IX', 9], ['V', 5], ['IV', 4], ['I', 1]]

function! ToRoman(number) abort
    let result = ''
    let origin = a:number

    for [roman, decimal] in s:romans
        while origin >= decimal
            let result .= roman
            let origin -= decimal
        endwhile
    endfor

    return result
endfunction
