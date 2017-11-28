unit module Accumulate:ver<1>;

sub accumulate(@list, &func) is export {
    [ @list.map: { func($_) } ] if @list or return [];
}
