#!/usr/bin/env perl6
use v6;
use Test;
use lib my $dir = $?FILE.IO.dirname;
use JSON::Fast;

my Str:D $exercise := 'AtbashCipher';
my Version:D $version = v1;
my Str $module //= $exercise;
plan 14;

use-ok $module or bail-out;
require ::($module);

if ::($exercise).^ver !~~ $version {
  warn "\nExercise version mismatch. Further tests may fail!"
    ~ "\n$exercise is $(::($exercise).^ver.gist). "
    ~ "Test is $($version.gist).\n";
  bail-out 'Example version must match test version.' if %*ENV<EXERCISM>;
}

require ::($module) <&encode &decode>;

my $c-data = from-json $=pod.pop.contents;
is .<phrase>.&::(.<property>), |.<expected description> for $c-data<cases>»<cases>».Array.flat;

=head2 Canonical Data
=begin code

{
  "exercise": "atbash-cipher",
  "version": "1.0.0",
  "comments": [
    "The tests are divided into two groups: ",
    "* Encoding from English to atbash cipher",
    "* Decoding from atbash cipher to all-lowercase-mashed-together English"
  ],
  "cases": [
    {
      "description": "encode",
      "comments": [ "Test encoding from English to atbash" ],
      "cases": [
        {
          "description": "encode yes",
          "property": "encode",
          "phrase": "yes",
          "expected": "bvh"
        },
        {
          "description": "encode no",
          "property": "encode",
          "phrase": "no",
          "expected": "ml"
        },
        {
          "description": "encode OMG",
          "property": "encode",
          "phrase": "OMG",
          "expected": "lnt"
        },
        {
          "description": "encode spaces",
          "property": "encode",
          "phrase": "O M G",
          "expected": "lnt"
        },
        {
          "description": "encode mindblowingly",
          "property": "encode",
          "phrase": "mindblowingly",
          "expected": "nrmwy oldrm tob"
        },
        {
          "description": "encode numbers",
          "property": "encode",
          "phrase": "Testing,1 2 3, testing.",
          "expected": "gvhgr mt123 gvhgr mt"
        },
        {
          "description": "encode deep thought",
          "property": "encode",
          "phrase": "Truth is fiction.",
          "expected": "gifgs rhurx grlm"
        },
        {
          "description": "encode all the letters",
          "property": "encode",
          "phrase": "The quick brown fox jumps over the lazy dog.",
          "expected": "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
        }
      ]
    },
    {
      "description": "decode",
      "comments": [ "Test decoding from atbash to English" ],
      "cases": [
        {
          "description": "decode exercism",
          "property": "decode",
          "phrase": "vcvix rhn",
          "expected": "exercism"
        },
        {
          "description": "decode a sentence",
          "property": "decode",
          "phrase": "zmlyh gzxov rhlug vmzhg vkkrm thglm v",
          "expected": "anobstacleisoftenasteppingstone"
        },
        {
          "description": "decode numbers",
          "property": "decode",
          "phrase": "gvhgr mt123 gvhgr mt",
          "expected": "testing123testing"
        },
        {
          "description": "decode all the letters",
          "property": "decode",
          "phrase": "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt",
          "expected": "thequickbrownfoxjumpsoverthelazydog"
        }
      ]
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
