function! Equilateral(triangle) abort
    return CheckInequality(a:triangle) && len(uniq(sort(a:triangle))) == 1
endfunction

function! Isosceles(triangle) abort
    return CheckInequality(a:triangle) && len(uniq(sort(a:triangle))) <= 2
endfunction

function! Scalene(triangle) abort
    return CheckInequality(a:triangle) && a:triangle[0] != a:triangle[1]
endfunction

function! CheckInequality(triangle) abort
    return count(a:triangle, 0) == 0
      \ && a:triangle[0] + a:triangle[1] >= a:triangle[2]
      \ && a:triangle[0] + a:triangle[2] >= a:triangle[1]
      \ && a:triangle[1] + a:triangle[2] >= a:triangle[0]
endfunction
