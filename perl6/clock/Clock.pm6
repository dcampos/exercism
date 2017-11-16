unit class Clock:ver<1>;

has $.minutes;

submethod BUILD(:$hour = 0, :$minute = 0) {
    self.add-minutes($hour * 60 + $minute);
}

method add-minutes($minutes) {
    $!minutes += $minutes;
    self;
}

method time() {
    ($!minutes div 60 % 24, $!minutes % 60).fmt: '%02d', ':';
}

