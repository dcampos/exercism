use lib '.';
use Meetup;

say Meetup::Grammar.parse($_, actions => Meetup::Actions.new).made
for 'The first Monday of November 2017',
    'The second Saturday of November 2017',
    'The third Thursday of November 2017',
    'The fourth Sunday of November 2017',
    'The wednesteenth of November 2017',
    'The last Saturday of November 2017';
