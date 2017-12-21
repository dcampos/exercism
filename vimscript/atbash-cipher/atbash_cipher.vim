let s:letters = [
    \   'abcdefghijklmnopqrstuvwxyz',
    \   'zyxwvutsrqponmlkjihgfedcba'
    \ ]

function! AtbashDecode(cipher) abort
    let phrase = substitute(tolower(a:cipher), '\W', '', 'g')
    return tr(phrase, s:letters[1], s:letters[0])
endfunction

function! AtbashEncode(plaintext) abort
    let phrase = substitute(tolower(a:plaintext), '\W', '', 'g')
    let phrase = substitute(phrase, '\(\w\{5}\)\($\)\@!', '\1 ', 'g')
    return tr(phrase, s:letters[0], s:letters[1])
endfunction
