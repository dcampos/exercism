using System;
using System.Linq;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public class NucleotideCount
{
    Dictionary<char, int> counts;
    string alphabet = "ACGT";

    public NucleotideCount(string sequence)
    {
        if (!Regex.Match(sequence, @"^[" + alphabet + "]*$").Success)
            throw new InvalidNucleotideException();

        counts = alphabet.ToDictionary(
            c => c,
            c => sequence.Where(e => c == e).Count());
    }

    public IDictionary<char, int> NucleotideCounts
    {
        get
        {
            return counts;
        }
    }
}

public class InvalidNucleotideException : Exception { }
