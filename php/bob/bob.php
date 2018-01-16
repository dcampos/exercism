<?php

class Bob {
    function respondTo($msg) {
        $msg = trim($msg);

        if (preg_match("/^$/", $msg)) {
            return "Fine. Be that way!";
        } elseif (preg_match("/[A-Z]/", $msg) && !preg_match("/[a-z]/", $msg)) {
            return "Whoa, chill out!";
        } elseif (preg_match("/\?$/", $msg)) {
            return "Sure.";
        } else {
            return "Whatever.";
        }
    }
}
