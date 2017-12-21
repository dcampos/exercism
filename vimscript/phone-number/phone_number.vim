function! ToNANP(number) abort
    let clean = substitute(a:number, '\D', '', 'g')
    return clean =~ '^1\?\([2-9]\d\{2}\)\{2}\d\{4}$' ? clean[-10:] : ''
endfunction
