unit module RNA:ver<1>;

my %nuc = <G C C G T A A U>;

sub to-rna ($dna where { $dna.comb (<=) %nuc.keys }) is export {
    $dna.trans: %nuc;
}

