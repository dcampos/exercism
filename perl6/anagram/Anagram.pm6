unit module Anagram:ver<2>;

sub match-anagrams (:$subject!, :@candidates!) is export {
    @candidates
        .grep({ !/:i ^ $subject $/ })
        .grep({ .lc.comb.Bag === $subject.lc.comb.Bag })
        .Set;
}
