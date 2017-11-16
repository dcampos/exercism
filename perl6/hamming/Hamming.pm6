unit module Hamming:ver<1>;

sub hamming-distance ($strand1, $strand2) is export {
    die 'left and right strands must be of equal length'
        unless $strand1.chars == $strand2.chars;

    $strand1.comb Z!eq $strand2.comb ==> grep({ $_ }) ==> elems;
}