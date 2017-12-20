function! Answer(drivel) abort

    if a:drivel !~# '[a-z]' && a:drivel =~# '[A-Z]'
        return 'Whoa, chill out!'
    elseif a:drivel =~ '?$'
        return 'Sure.'
    elseif a:drivel =~ '^\s*$'
        return 'Fine. Be that way!'
    else
        return 'Whatever.'
    endif

endfunction
