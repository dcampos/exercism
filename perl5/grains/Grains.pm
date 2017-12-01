package Grains;

use bigint;

sub square {
    my ($square) = shift;
    2 ** ($square - 1);
}

sub total {
    2 ** 64 - 1;
}

1;
