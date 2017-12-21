function! Difference(number) abort
    return SquareOfSum(a:number) - SumOfSquares(a:number)
endfunction

function! SquareOfSum(number) abort
    return float2nr(pow(Sum(range(1, a:number), {n -> n}), 2))
endfunction

function! SumOfSquares(number) abort
    return float2nr(Sum(range(1, a:number), {n -> pow(n, 2)}))
endfunction

function! Sum(list, func) abort
    let sum = 0
    for i in a:list
        let sum += a:func(i)
    endfor
    return sum
endfunction
