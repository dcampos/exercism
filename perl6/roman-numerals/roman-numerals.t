#!/usr/bin/env perl6
use v6;
use Test;
use lib my $dir = $?FILE.IO.dirname;
use JSON::Fast;

my Str:D $exercise := 'RomanNumerals';
my Version:D $version = v1;
my Str $module //= $exercise;
plan 20;

use-ok $module or bail-out;
require ::($module);

if ::($exercise).^ver !~~ $version {
  warn "\nExercise version mismatch. Further tests may fail!"
    ~ "\n$exercise is $(::($exercise).^ver.gist). "
    ~ "Test is $($version.gist).\n";
  bail-out 'Example version must match test version.' if %*ENV<EXERCISM>;
}

require ::($module) <&to-roman>;

my $c-data = from-json $=pod.pop.contents;
for $c-data<cases>.values {
  is to-roman(.<number>), |.<expected description>;
}

=head2 Canonical Data
=begin code

{
  "exercise": "roman-numerals",
  "version": "1.0.0",
  "cases": [
    {
      "description": "1 is a single I",
      "property": "roman",
      "number": 1,
      "expected": "I"
    },
    {
      "description": "2 is two I's",
      "property": "roman",
      "number": 2,
      "expected": "II"
    },
    {
      "description": "3 is three I's",
      "property": "roman",
      "number": 3,
      "expected": "III"
    },
    {
      "description": "4, being 5 - 1, is IV",
      "property": "roman",
      "number": 4,
      "expected": "IV"
    },
    {
      "description": "5 is a single V",
      "property": "roman",
      "number": 5,
      "expected": "V"
    },
    {
      "description": "6, being 5 + 1, is VI",
      "property": "roman",
      "number": 6,
      "expected": "VI"
    },
    {
      "description": "9, being 10 - 1, is IX",
      "property": "roman",
      "number": 9,
      "expected": "IX"
    },
    {
      "description": "20 is two X's",
      "property": "roman",
      "number": 27,
      "expected": "XXVII"
    },
    {
      "description": "48 is not 50 - 2 but rather 40 + 8",
      "property": "roman",
      "number": 48,
      "expected": "XLVIII"
    },
    {
      "description": "50 is a single L",
      "property": "roman",
      "number": 59,
      "expected": "LIX"
    },
    {
      "description": "90, being 100 - 10, is XC",
      "property": "roman",
      "number": 93,
      "expected": "XCIII"
    },
    {
      "description": "100 is a single C",
      "property": "roman",
      "number": 141,
      "expected": "CXLI"
    },
    {
      "description": "60, being 50 + 10, is LX",
      "property": "roman",
      "number": 163,
      "expected": "CLXIII"
    },
    {
      "description": "400, being 500 - 100, is CD",
      "property": "roman",
      "number": 402,
      "expected": "CDII"
    },
    {
      "description": "500 is a single D",
      "property": "roman",
      "number": 575,
      "expected": "DLXXV"
    },
    {
      "description": "900, being 1000 - 100, is CM",
      "property": "roman",
      "number": 911,
      "expected": "CMXI"
    },
    {
      "description": "1000 is a single M",
      "property": "roman",
      "number": 1024,
      "expected": "MXXIV"
    },
    {
      "description": "3000 is three M's",
      "property": "roman",
      "number": 3000,
      "expected": "MMM"
    }
  ]
}

=end code

unless %*ENV<EXERCISM> {
  skip-rest 'exercism tests';
  exit;
}

subtest 'canonical-data' => {
  (my $c-data-file = "$dir/../../problem-specifications/exercises/{
    $dir.IO.resolve.basename
  }/canonical-data.json".IO.resolve) ~~ :f ??
    is-deeply $c-data, EVAL('from-json $c-data-file.slurp'), 'match problem-specifications' !!
    flunk 'problem-specifications file not found';
}

INIT { $module = 'Example' if %*ENV<EXERCISM> }
