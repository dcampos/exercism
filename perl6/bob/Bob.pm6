unit class Bob:ver<2>;

my role Message {
    method is-shout    { /<:L>/ and !/<:Ll>/ }
    method is-question { self.ends-with('?') }
    method is-silence  { !self }
}

method hey (Str:D $msg --> Str) {
    given $msg.trim but Message {
        when .is-silence                { "Fine. Be that way!" }
        when .is-shout and .is-question { "Calm down, I know what I'm doing!" }
        when .is-shout                  { "Whoa, chill out!" }
        when .is-question               { "Sure." }
        default                         { "Whatever." }
    }
}
