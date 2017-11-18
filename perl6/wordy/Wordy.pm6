unit module Wordy:ver<1>;

grammar GRAMMAR {
    rule TOP { 'What is' <num> <operation>+ '?' }
    proto rule operation { * }
          rule operation:sym<add> { 'plus' <num> }
          rule operation:sym<sub> { 'minus' <num> }
          rule operation:sym<mul> { 'multiplied by' <num> }
          rule operation:sym<div> { 'divided by' <num> }
    token num { < + - >? \d+ }
}

class Calc {
    has $!result = 0;

    method TOP ($/) { make $!result }
    method operation:sym<add> ($/) { $!result += $<num> }
    method operation:sym<sub> ($/) { $!result -= $<num> }
    method operation:sym<mul> ($/) { $!result *= $<num> }
    method operation:sym<div> ($/) { $!result /= $<num> }
    method num ($/) { $!result ||= $/ }
}

sub answer ($question) is export {
    GRAMMAR.parse($question, actions => Calc.new).made || die;
}
