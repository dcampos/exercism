package Bob 2;

use strict;
use warnings;

sub hey {
  (my $msg = shift) =~ s/^\s+|\s+$//g;

  return 'Whoa, chill out!'   if $msg =~ /\p{L}/ && $msg !~ /\p{Ll}/;
  return 'Sure.'              if $msg =~ /\?$/;
  return 'Fine. Be that way!' if $msg =~ /^$/;
  return 'Whatever.';
}

1;
