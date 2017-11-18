unit module ETL:ver<1>;

no precompilation;

sub transform (%h --> Hash[Int:D, Str:D]) is export {
    Hash[Int:D, Str:D].new: %h.invert.map({ .key.lc => .value });
}
