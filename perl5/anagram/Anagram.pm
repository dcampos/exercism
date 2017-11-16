package Anagram;

sub match {
    my ($word, @possible) = @_;

    my @result;

    my $nword = nor($word);

    for my $p (@possible) {
        next if $p eq $word;
        push @result, $p
            if $nword eq nor($p);
    }

    return \@result;
}

sub nor {
    join('', sort(split //, lc shift))
}

1;
