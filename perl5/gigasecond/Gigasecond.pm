package Gigasecond;

use strict;
use warnings;
use DateTime;

sub new {
    my ($class, $year, $month, $day) = @_;

    my $self = DateTime->new(
        year  => $year,
        month => $month,
        day   => $day
    )->add(
        seconds => 10 ** 9
    )->truncate(
        to => 'day'
    );

    bless \$self, $class;
}

sub date {
    ${ my $self = shift };
}

1;
