<?php

function from($date) {
    $interval = new DateInterval('PT' . (10 ** 9) . 'S');
    $result = clone $date;
    return $result->add($interval);
}

