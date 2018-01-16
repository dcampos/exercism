<?php

function encode($input) {
    $input = preg_replace_callback('/(.)(\1+)?/', function ($match) {
        return (strlen($match[0]) > 1 ? strlen($match[0]) : '') . $match[1];
    }, $input);

    return $input;
}

function decode($input) {
    $input = preg_replace_callback('/(\d+)?(.)/', function ($match) {
        return str_repeat($match[2], intval($match[1]) ?: 1);
    }, $input);

    return $input;
}

