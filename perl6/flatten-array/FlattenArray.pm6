unit module FlattenArray:ver<1>;

sub flatten-array(@input --> Array) is export {
    [ gather @input».&{ .take with $_ } ];
}
