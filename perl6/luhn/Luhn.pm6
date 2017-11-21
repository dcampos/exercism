unit module Luhn:ver<2>;

sub is-luhn-valid (Str:D $input --> Bool) is export {
    return False if $input.trim.chars < 2 or $input ~~ / <-[\d\s]> /;

    my @list = $input.comb(/\d/).reverse;

    for @list.keys -> $i {
        @list[$i] *= 2 unless $i %% 2;
        @list[$i] -= 9 if @list[$i] > 9;
    }

    @list.sum %% 10;
}

