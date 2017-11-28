unit module NucleotideCount:ver<1>;

subset Strand of Str where /^<[ACGT]>*$/;

sub nucleotide-count (Strand $strand) is export {
    $strand.comb;
}
