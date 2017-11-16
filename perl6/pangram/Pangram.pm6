unit module Pangram:ver<2>;

sub is-pangram ($string) is export {
    $string.lc.subst(/<:!L>/, '', :g).comb.unique.elems == 26;
}
