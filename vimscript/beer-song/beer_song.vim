function! HowMany(bottles)
    return printf("%s %s",
                \ (a:bottles == 0 ? 'no more' : a:bottles),
                \ (a:bottles == 1 ? 'bottle' : 'bottles'))
endfunction

function! Verse(number) abort
    let how_many = HowMany(a:number)

    let result = printf("%s of beer on the wall, %s of beer.\n",
                \ substitute(how_many, '\v(.)', '\u\1', ''), how_many)

    let remaining = a:number == 0 ? 99 : a:number - 1

    if remaining == 99
        let result .= "Go to the store and buy some more"
    else
        let result .= printf("Take %s down and pass it around",
                    \ (remaining == 0 ? 'it' : 'one'))
    endif

    let result .= printf(", %s of beer on the wall.\n", HowMany(remaining))

    return result
endfunction

function! Verses(start, end) abort
    return join(map(range(a:start, a:end, -1), {i, n -> Verse(n)}), "\n")
endfunction
