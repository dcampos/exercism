unit module Pangram:ver<2>;

sub is-pangram ($string) is export {
    ('a'..'z') (<=) $string.lc.comb;
}
