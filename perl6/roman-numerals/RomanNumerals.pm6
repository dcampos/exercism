unit module RomanNumerals:ver<1>;

constant @ROMAN = (<1000 900 500 400 100 90 50 40 10 9 5 4 1>
                    Z <M CM D CD C XC L XL X IX V IV I>).flat;

multi to-roman (Int $n, [Int $dec, Str $rom, *@rest] = @ROMAN) is export {
    $rom x ($n div $dec) ~ to-roman($n mod $dec, @rest)
}

multi to-roman (0, @ --> '') { }
