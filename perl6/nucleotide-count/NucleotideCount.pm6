unit module NucleotideCount:ver<1>;

sub nucleotide-count ($strand where { $strand ~~ /^<[ACGT]>*$/ }) is export {
    $strand.comb;
}