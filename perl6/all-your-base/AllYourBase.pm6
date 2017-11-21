unit module AllYourBase:ver<3>;

sub from-base($base, @digits) {
    @digits.reverse.map({$_ * ($base ** $++) }).sum;
}

sub to-base($base, $value is copy) {
    my @digits = $value.polymod($base xx *).reverse;
    return @digits || [0];
}

sub convert-base (
        :%bases!  where { %bases<to from>.all > 1 },
        :@digits! where { .all ~~ 0..^%bases<from> }
) is export {
    to-base(%bases<to>, from-base(%bases<from>, @digits));
}
