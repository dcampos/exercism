
function! IsLeap(number) abort
    return (a:number % 4 == 0 && a:number % 100 != 0) || a:number % 400 == 0
endfunction
