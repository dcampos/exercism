<?php

const ROMANS = [
    1000 => "M",
    900  => "CM",
    500  => "D",
    400  => "CD",
    100  => "C",
    90   => "XC",
    50   => "L",
    40   => "XL",
    10   => "X",
    9    => "IX",
    5    => "V",
    4    => "IV",
    1    => "I"
];

function toRoman($decimal) {
    $result = '';
    foreach (ROMANS as $value => $roman) {
        $div = intdiv($decimal, $value);
        $result .= str_repeat($roman, $div);
        $decimal -= $div * $value;
    }
    return $result;
}
