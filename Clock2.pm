package Clock;

use overload '+' => sub {
    my ($self, $min) = @_;

    Clock->new([$self->[0] + $min / 60,
        $self->[1] + $min % 60]);
};

use overload '-' => sub {
    my ($self, $min) = @_;

    my $clock = Clock->new([$self->[0] - $min / 60,
        $self->[1] - $min % 60]);
    $clock->[0] = 24 + $clock->[0] if $clock->[0] < 0;
    $clock;
};

use overload 'eq' => sub {
    my ($self, $other) = @_;
    return "$self" eq $other;
};

use overload '""' => sub {
    my $self = shift;
    sprintf "%02d:%02d",
        ($self->[0] + $self->[1] / 60) % 24, $self->[1] % 60;
};

sub new {
    my ($class, $clock) = @_;
    $hour = $clock->[0];
    $minute = $clock->[1] || 0;
    bless [$hour, $minute], $class;
}

1;
