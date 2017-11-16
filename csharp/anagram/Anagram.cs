using System;
using System.Linq;

public class Anagram
{
    private string baseWord;

    public Anagram(string baseWord)
    {
        this.baseWord = baseWord;
    }

    public string[] Anagrams(string[] potentialMatches)
    {
        var nBaseWord = Normalize(baseWord);
        return potentialMatches
            .Where(w => w.ToLower() != baseWord.ToLower())
            .Where(w => Normalize(w) == nBaseWord)
            .ToArray();
    }

    private string Normalize(string w)
    {
        return string.Concat(w.ToLower().OrderBy(c => c));
    }
}