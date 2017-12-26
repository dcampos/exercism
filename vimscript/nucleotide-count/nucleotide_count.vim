let s:nucs = ['A', 'C', 'G', 'T']

function! NucleotideCount(strand) abort
    if a:strand =~# '[^' . join(s:nucs, '') . ']'
        throw 'invalid nucleotide in strand'
    endif

    let chars = split(a:strand, '\zs')
    let counts = {}

    for nuc in s:nucs
        let counts[nuc] = count(chars, nuc)
    endfor

    return counts
endfunction
