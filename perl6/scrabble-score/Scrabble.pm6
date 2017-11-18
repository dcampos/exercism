unit module Scrabble:ver<1>;

my Int %letters{Str} =
        <A E I O U L N R S T>.any => 1,
        <D G>.any => 2,
        <B C M P>.any => 3,
        <F H V W Y>.any => 4,
        K => 5,
        <J X>.any => 8,
        <Q Z>.any => 10
        ;

sub score ($_) is export {
    .uc.comb.map(-> $l { %letters{$l} }).sum
}
