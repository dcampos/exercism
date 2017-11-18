unit module Raindrops:ver<1>;

my %h = 3 => 'Pling', 5 => 'Plang', 7 => 'Plong';

sub convert (Int:D $num --> Str:D) is export {
    [~] %h
        .grep({ $num %% .key})
        .sort({ .key })
        .map({ .value }) || $num.Str;
}