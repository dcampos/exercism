unit module WordCount:ver<1>;

sub count-words ($str) is export {
    $str.lc.comb(/\w+ [\' \w+]*/).Bag;
}
