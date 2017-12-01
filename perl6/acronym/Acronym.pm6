unit module Acronym:ver<1>;

sub abbreviate ($_) is export {
    .comb(/\w )> \w*/).join.uc;
}
