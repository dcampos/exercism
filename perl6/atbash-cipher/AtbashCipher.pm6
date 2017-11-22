unit module AtbashCipher:ver<1>;

my %letters = ['a'...'z'] Z=> ['z'...'a'];

sub encode ($phrase) is export {
    $phrase.lc.trans(%letters).subst(/\W/, '', :g).comb(5);
}

sub decode ($phrase) is export {
    $phrase.trans(%letters).subst(/\W/, '', :g);
}
