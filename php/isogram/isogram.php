<?php

function isIsogram($input) {
    $input = preg_replace('/[\s\-]/', '', $input);
    $chars = preg_split('//u', strtolower($input), -1, PREG_SPLIT_NO_EMPTY);
    return count(array_unique($chars)) == count($chars);
}

