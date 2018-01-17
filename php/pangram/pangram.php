<?php

function isPangram($phrase) {
    $phrase = preg_replace('/[^a-z]/i', '', $phrase);
    $chars = array_unique(str_split($phrase));
    return count($chars) == 26;
}

