<?php

function sumOfSquares($number) {
    return array_reduce(range(1, $number), function($sum, $current) {
        return $sum += $current ** 2;
    });
}

function squareOfSums($number) {
    return array_reduce(range(1, $number), function($sum, $current) {
        return $sum += $current;
    }) ** 2;
}

function difference($number) {
    return squareOfSums($number) - sumOfSquares($number);
}
