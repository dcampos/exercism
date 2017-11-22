unit module Meetup:ver<1>;

my %days-of-week = <Monday Tuesday Wednesday Thursday
    Friday Saturday Sunday> Z=> (1..7);

my %months = <January February March April May June
    July August September October November December> Z=> (1..12);

my %ords = <first second third fourth last> Z=> (0...3, -1);

my %teenths = %days-of-week.map({ .key.lc.substr(0, *-3) ~ 'teenth' => .value });

grammar Meetup::Grammar {
    rule TOP          { [ <ord> <day-of-week> | <teenth> ] 'of' <month> <year> }
    token ord         { <{ %ords.keys.join('||') }> }
    token day-of-week { <{ %days-of-week.keys.join('||') }> }
    token teenth      { <{ %teenths.keys.join('||') }> }
    token month       { <{ %months.keys.join('||') }> }
    token year        { \d+ }
}

class Meetup::Actions {
    method TOP ($/) {
        my $date = Date.new(year => $<year>, month => $<month>.made);

        my $dw;

        with $<ord> {
            my $ord = $<ord>.made;
            $date += $ord == %ords<last> ?? $date.days-in-month - 7 !! $ord * 7;
            $dw = $<day-of-week>.made;
        } else {
            $date += 12;
            $dw = $<teenth>.made;
        }

        make $date + (($dw - $date.day-of-week) mod 7);
    }

    method month ($/)       { make %months{ $/ } }
    method day-of-week ($/) { make %days-of-week{ $/ } }
    method ord ($/)         { make %ords{ $/ } }
    method teenth ($/)      { make %teenths{ $/ } }
}

sub meetup-date ($desc) is export {
    Meetup::Grammar.parse($desc, actions => Meetup::Actions.new).made;
}

