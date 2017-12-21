let s:factors = [[3, 'Pling'], [5, 'Plang'], [7, 'Plong']]

function! Raindrops(number) abort
    let ret = ''

    for factor in s:factors
        if a:number % factor[0] == 0
            let ret .= factor[1]
        endif
    endfor

    return len(ret) ? ret : string(a:number)
endfunction
