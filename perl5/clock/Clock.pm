package Clock;

use overload '+' => sub {
    my ($self, $min) = @_;
    Clock->new([0, $$self + $min]);
};

use overload '-' => sub {
    my ($self, $min) = @_;
    Clock->new([0, $$self - $min]);
};

use overload 'eq' => sub {
    my ($self, $other) = @_;
    return "$self" eq $other;
};

use overload '""' => sub {
    my $self = shift;
    sprintf "%02d:%02d",
        ($$self / 60) % 24, $$self % 60;
};

sub new {
    my ($class, $clock) = @_;
    my $time = $clock->[0] * 60 + ($clock->[1] || 0);
    $time += 24 * 60 if $time < 0;
    bless \$time, $class;
}

1;
