package Hamming;

sub compute {
    my ($a, $b) = @_;
    die 'DNA strands must be of equal length' unless length $a == length $b;
    scalar grep { substr($a, $_, 1) ne substr($b, $_, 1) } 0 .. length($a) - 1;
}

1;

