let s:allergies = {
            \ 'eggs'          : 1,
            \ 'peanuts'       : 2,
            \ 'shellfish'     : 4,
            \ 'strawberries'  : 8,
            \ 'tomatoes'      : 16,
            \ 'chocolate'     : 32,
            \ 'pollen'        : 64,
            \ 'cats'          : 128,
            \ }

function! AllergicTo(score, allergy) abort
    return and(a:score, s:allergies[a:allergy]) > 0
endfunction

function! List(score) abort
    return sort(filter(keys(s:allergies),
                \ {i, a -> AllergicTo(a:score, a)}), 'SortAllergies')
endfunction

function! SortAllergies(a, b)
    return s:allergies[a:a] < s:allergies[a:b] ? -1
                \ : s:allergies[a:a] > s:allergies[a:b]
endfunction

