function! Hamming(strand1, strand2)
    if len(a:strand1) != len(a:strand2)
        throw 'The two strands must have the same length.'
    endif

    let l:sum = 0

    for i in range(len(a:strand1))
        let l:sum += a:strand1[i] != a:strand2[i]
    endfor

    return l:sum
endfunction
