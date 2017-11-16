#!/usr/bin/env perl6
use v6;
use Test;
use lib my $dir = $?FILE.IO.dirname;
use JSON::Fast;

my Str:D $exercise := 'Hamming';
my Version:D $version = v2;
my Str $module //= $exercise;
plan 17;

use-ok $module or bail-out;
require ::($module);

if ::($exercise).^ver !~~ $version {
  warn "\nExercise version mismatch. Further tests may fail!"
    ~ "\n$exercise is $(::($exercise).^ver.gist). "
    ~ "Test is $($version.gist).\n";
  bail-out 'Example version must match test version.' if %*ENV<EXERCISM>;
}

require ::($module) <&hamming-distance>;

my $c-data = from-json $=pod.pop.contents;
for $c-data<cases>.values {
  if .<expected><error> {
    throws-like {hamming-distance(|.<strand1 strand2>)}, Exception, .<description>;
  } else {
    is hamming-distance(|.<strand1 strand2>), |.<expected description>;
  }
}

=head2 Canonical Data
=begin code

{
"exercise": "hamming",
"version": "2.0.1",
  "comments": [
    "Language implementations vary on the issue of unequal length strands.",
    "A language may elect to simplify this task by only presenting equal",
    "length test cases.  For languages handling unequal length strands as",
    "error condition, unequal length test cases are included here and are",
    "indicated with an expected value of -1.  Note however that -1 is",
    "simply an indication here in the JSON.  Actually returning -1 from",
    "a hamming distance function may or may not be idiomatic in a language.",
    "Language idioms of errors or exceptions should be followed.",
    "Alternative interpretations such as ignoring excess length at the end",
    "are not represented here."
  ],
  "cases": [
    {
      "description": "empty strands",
      "property": "distance",
      "strand1": "",
      "strand2": "",
      "expected": 0
    },
    {
      "description": "identical strands",
      "property": "distance",
      "strand1": "A",
      "strand2": "A",
      "expected": 0
    },
    {
      "description": "long identical strands",
      "property": "distance",
      "strand1": "GGACTGA",
      "strand2": "GGACTGA",
      "expected": 0
    },
    {
      "description": "complete distance in single nucleotide strands",
      "property": "distance",
      "strand1": "A",
      "strand2": "G",
      "expected": 1
    },
    {
      "description": "complete distance in small strands",
      "property": "distance",
      "strand1": "AG",
      "strand2": "CT",
      "expected": 2
    },
    {
      "description": "small distance in small strands",
      "property": "distance",
      "strand1": "AT",
      "strand2": "CT",
      "expected": 1
    },
    {
      "description": "small distance",
      "property": "distance",
      "strand1": "GGACG",
      "strand2": "GGTCG",
      "expected": 1
    },
    {
      "description": "small distance in long strands",
      "property": "distance",
      "strand1": "ACCAGGG",
      "strand2": "ACTATGG",
      "expected": 2
    },
    {
      "description": "non-unique character in first strand",
      "property": "distance",
      "strand1": "AAG",
      "strand2": "AAA",
      "expected": 1
    },
    {
      "description": "non-unique character in second strand",
      "property": "distance",
      "strand1": "AAA",
      "strand2": "AAG",
      "expected": 1
    },
    {
      "description": "same nucleotides in different positions",
      "property": "distance",
      "strand1": "TAG",
      "strand2": "GAT",
      "expected": 2
    },
    {
      "description": "large distance",
      "property": "distance",
      "strand1": "GATACA",
      "strand2": "GCATAA",
      "expected": 4
    },
    {
      "description": "large distance in off-by-one strand",
      "property": "distance",
      "strand1":  "GGACGGATTCTG",
      "strand2": "AGGACGGATTCT",
      "expected": 9
    },
    {
      "description": "disallow first strand longer",
      "property": "distance",
      "strand1": "AATG",
      "strand2": "AAA",
      "expected": {"error": "left and right strands must be of equal length"}
    },
    {
      "description": "disallow second strand longer",
      "property": "distance",
      "strand1": "ATA",
      "strand2": "AGTG",
      "expected": {"error": "left and right strands must be of equal length"}
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
