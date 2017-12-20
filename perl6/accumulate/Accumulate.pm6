unit module Accumulate:ver<1>;

sub accumulate(@list, &func) is export {
    [ .&func for @list ];
}
