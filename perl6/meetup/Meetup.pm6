unit module Meetup:ver<1>;

my %days-of-week = <Monday Tuesday Wednesday Thursday Friday Saturday Sunday>.antipairs;

my %months = <
    January February March
    April May June July August
    September October November December
    >.antipairs;

my %ords = <first second third fourth last>.antipairs;

my %teenths = %days-of-week.map({ .key.lc.substr(0, *-3) ~ 'teenth' => .value });

grammar Meetup::Grammar {
    rule TOP          { <day-of-month> 'of' <month> <year> }
    rule day-of-month { [ <ord> <day-of-week> | <teenth> ] }
    token ord         { <{ %ords.keys.join('||') }> }
    token day-of-week { <{ %days-of-week.keys.join('||') }> }
    token teenth      { <{ %teenths.keys.join('||') }> }
    token month       { <{ %months.keys.join('||') }> }
    token year        { \d+ }
}

class Meetup::Actions {
    method TOP ($/) {
        my $month = %months{$<month>} + 1;
        my $date = Date.new(year => $<year>, month => $month);

        my $dom = $<day-of-month>.made;

        if ($dom<ord>:exists) {
            my $dw = $dom<day-of-week>;
            my $ord = $dom<ord>;
            my $start = $ord == 4 ?? $date.days-in-month - 6 !! $ord * 7 + 1;
            $date = increase-day($date, $start, $dw);
        } else {
            my $dw = $dom<day-of-week>;
            $date = increase-day($date, 13, $dw);
        }

        make $date;
    }

    method month ($/)       { make %months{ $/ } + 1 }
    method day-of-month ($/) {
        make $<ord>
            ?? { ord => $<ord>.made, day-of-week => $<day-of-week>.made }
            !! { day-of-week => $<teenth>.made }
    }
    method day-of-week ($/) { make %days-of-week{ $/ } + 1 }
    method ord ($/)         { make %ords{ $/ } }
    method teenth ($/)      { make %teenths{ $/ } + 1 }

    sub increase-day($date is copy, $start, $dw) {
        $date = $date.clone(day => $start);
        my $cur = $date.day-of-week;
        my $dif = $cur > $dw ?? $dw + 7 - $cur !! $dw - $cur;
        $date.later(days => $dif);
    }
}

sub meetup-date ($desc) is export {
    Meetup::Grammar.parse($desc, actions => Meetup::Actions.new).made;
}

