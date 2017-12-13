unit module SpaceAge:ver<1>;

constant BASE-PERIOD = 31557600;

role Planet {
    method age-on ($seconds) {
        ($seconds / ($.value * BASE-PERIOD)).round(0.01);
    }
}

enum Planets does Planet is export (
    Earth   => 1.0,
    Mercury => 0.2408467,
    Venus   => 0.61519726,
    Mars    => 1.8808158,
    Jupiter => 11.862615,
    Saturn  => 29.447498,
    Uranus  => 84.016846,
    Neptune => 164.79132
);

