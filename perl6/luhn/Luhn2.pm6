unit module Luhn:ver<1>;

grammar Luhn {
    rule TOP   { [ <odd>? <even> ]+ <odd> }
    token even { <digit>  }
    token odd  { <digit>  }
    token ws   { <space>* }
}

class LuhnValidator {
    method TOP  ($/) { make (|$<odd>».made, |$<even>».made).sum %% 10 }
    method even ($/) { make ($/ * 2).Str.comb.sum }
    method odd  ($/) { make ~$/ }
}

sub is-luhn-valid ($input) is export {
    Luhn.parse( $input, actions => LuhnValidator.new ).made.so;
}