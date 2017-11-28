<?php

function acronym($phrase) {
    $words = array();
    preg_match_all('/([A-Z]+)?([a-z]+)?/', $phrase, $words);
    $result = '';

    foreach ($words[0] as $word) {
        $result .= substr($word, 0, 1);
    }

    return strtoupper($result);
}
