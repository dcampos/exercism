package Leap 2;
use strict;
use warnings;

sub is_leap {
  my ($year) = @_;
  $year % 4 == 0 && $year % 100 != 0 || $year % 400 == 0 || 0;
}

1;
