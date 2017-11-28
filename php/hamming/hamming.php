<?php

function distance($a, $b)
{
    if (strlen($a) != strlen($b))
        throw new InvalidArgumentException('DNA strands must be of equal length.');

    $count = 0;

    for ($i = 0; $i < strlen($a); $i++) {
        if ($a[$i] != $b[$i])
            $count++;
    }

    return $count;
}
