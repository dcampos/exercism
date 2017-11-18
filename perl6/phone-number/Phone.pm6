unit module Phone:ver<3>;

grammar PHONE {
    token TOP {
        [ '+'? <code> ' '? ]?
        '('? <first-number> ')'? <sep>?
        <second-number> <sep>?
        <third-number> <.ws>
    }
    token code { '1' }
    token sep { <[\.\s\-]>+ }
    token first-number { <[2..9]> \d ** 2  }
    token second-number { <[2..9]> \d ** 2}
    token third-number { \d ** 4 }
}

sub clean-number ($n) is export {
    my $match = PHONE.parse($n);
    return $match
        ??
            $match<first-number> ~ $match<second-number> ~ $match<third-number>
        !!
            Nil
        ;
}