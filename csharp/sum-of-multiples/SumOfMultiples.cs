using System;
using System.Linq;
using System.Collections.Generic;

public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> multiples, int max) =>
        Enumerable.Range(1, max - 1).Where(x => multiples.Any(m => x % m == 0)).Sum();
}