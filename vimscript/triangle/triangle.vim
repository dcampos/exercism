"
" Determine if a triangle is equilateral, isosceles, or scalene.
"
" An equilateral triangle has all three sides the same length.
"
" An isosceles triangle has at least two sides the same length.
" (It is sometimes specified as having exactly two sides the
" same length, but for the purposes of this exercise we'll say
" at least two.)
"
" A scalene triangle has all sides of different lengths.
"

function! Equilateral(triangle) abort
    if (a:triangle[0] == 0 || a:triangle[1] == 0 || a:triangle[2] == 0)
        return 0
    endif
    return !IsEnequal(a:triangle) ? 0 : len(uniq(sort(a:triangle))) == 1
endfunction

function! Isosceles(triangle) abort
    return !IsEnequal(a:triangle) ? 0 : len(uniq(sort(a:triangle))) <= 2
endfunction

function! Scalene(triangle) abort
    return !IsEnequal(a:triangle) ? 0 : len(uniq(sort(a:triangle))) == 3
endfunction

function! IsEnequal(triangle) abort
    return a:triangle[0] + a:triangle[1] >= a:triangle[2]
      \ && a:triangle[0] + a:triangle[2] >= a:triangle[1]
      \ && a:triangle[1] + a:triangle[2] >= a:triangle[0]
      " \ && len(uniq(filter(a:triangle, {i, n -> n == 0}))) == 0
      " \ &&
endfunction
