from string import maketrans

def to_rna(dna_strand):
    if not set(dna_strand).issubset('GCTA'):
        raise ValueError('Invalid DNA strand')
    return dna_strand.translate(maketrans('GCTA', 'CGAU'))
