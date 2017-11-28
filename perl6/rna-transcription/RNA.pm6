unit module RNA:ver<1>;

my %nuc = <G C T A> Z=> <C G A U>;

sub to-rna ($dna where { $dna.comb (<=) %nuc.keys }) is export {
    $dna.trans: %nuc;
}

