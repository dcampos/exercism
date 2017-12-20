unit module Raindrops:ver<1>;

constant SOUNDS = 3 but 'Pling', 5 but 'Plang', 7 but 'Plong';

sub convert (Int:D $num --> Str:D) is export {
    [~] SOUNDS.grep($num %% *) || $num;
}
