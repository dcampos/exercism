unit class Robot:ver<1>;

our @used-names;

has $.name;

submethod BUILD {
    self.reset-name;
}

method reset-name {
    repeat { $!name = self!create-name } until $.name !(<=) @used-names;
    @used-names.push: $.name;
}

method !create-name {
     (roll 2, 'A'..'Z').join ~ (roll 3, 0..9).join;
}
