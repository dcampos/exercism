unit module Allergies:ver<3>;

my %allergies =
    :eggs(1),
    :peanuts(2),
    :shellfish(4),
    :strawberries(8),
    :tomatoes(16),
    :chocolate(32),
    :pollen(64),
    :cats(128);

sub allergic-to(Int:D $mask, Str:D $what --> Bool) is export {
    (%allergies{$what} +& $mask) > 0;
}

sub list-allergies(Int:D $mask --> Seq) is export {
    %allergies.keys.grep({ %allergies{$_} +& $mask })
}