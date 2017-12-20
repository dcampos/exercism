<?php

function isValid($str) {
    $str = strrev(preg_replace('/\s/', '', $str));

    if (strlen($str) < 2 || preg_match('/\D/', $str)) return false;

    for ($i = 1; $i < strlen($str); $i += 2) {
        $str[$i] = $str[$i] > 4 ? $str[$i] * 2 - 9 : $str[$i] * 2;
    }

    return array_sum(str_split($str)) % 10 == 0;
}
