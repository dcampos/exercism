using System;
using System.Linq;

public static class Hamming
{
    public static int Distance(string firstStrand, string secondStrand)
    {
        if (firstStrand.Length != secondStrand.Length)
            throw new ArgumentException();

        return firstStrand.Zip(secondStrand, (a, b) => a != b ? 1 : 0).Sum();
    }
}