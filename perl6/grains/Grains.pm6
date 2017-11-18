unit module Grains:ver<1>;

my $squares = (1..64);

sub grains-on-square(Int:D $square where * (<=) $squares) is export {
    [**] 2, $square-1;
}

sub total-grains is export {
    $squares.map: { grains-on-square($_) } ==> sum;
}
