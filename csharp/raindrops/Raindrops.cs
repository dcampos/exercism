using System;
using System.Collections.Generic;
using System.Linq;

public static class Raindrops
{
    private static Dictionary<int, string> sounds = new Dictionary<int, string>();

    static Raindrops() {
        sounds.Add(3, "Pling");
        sounds.Add(5, "Plang");
        sounds.Add(7, "Plong");
    }

    public static string Convert(int number)
    {
        String rd = string.Concat(sounds.Keys
            .Where(x => number % x == 0)
            .Select(x => sounds[x]));
        return rd.Length > 0 ? rd : number.ToString();
    }
}