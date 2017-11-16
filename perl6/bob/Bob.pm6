unit class Bob:ver<1>;

method hey (Str:D $msg --> Str) {
    given $msg.trim {
        when !.chars { "Fine. Be that way!" }
        when /<:L>/ and not /<:Ll>/ { "Whoa, chill out!" }
        when .ends-with('?') { "Sure." }
        default { "Whatever." }
    }
}
