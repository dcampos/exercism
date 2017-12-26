function! LargestProduct(digits, span) abort
    if a:digits =~ '\D'
        throw 'invalid input'
    elseif a:span == 0
        return 1
    elseif a:span > len(a:digits) || a:span < 0
        return -1
    endif

    let i = 0
    let max = 0

    while i + a:span <= len(a:digits)
        let current = split(a:digits[i:(i+a:span-1)], '\zs')

        let prod = 1

        for n in current
            let prod = prod * n
        endfor

        let max = prod > max ? prod : max

        let i += 1
    endwhile

    return max
endfunction
