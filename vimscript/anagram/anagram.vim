"
" Given a word and a list of possible anagrams, select the correct sublist.
"
" Hints:
"
"   - Same words don't match.
"   - Cases are treated insensitivley.
"   - The returned list is sorted.
"
" Example:
"
"   :echo Anagram('foo', ['foo', 'bar', 'oof', 'Ofo'])
"   ['Ofo', 'oof']
"
function! Anagram(word, candidates) abort
    let ret = []

    for c in a:candidates
        if sort(split(c, '\zs')) == split(a:word, '\zs')
            call add(ret, c)
        endif
    endfor

    return ret
endfunction
