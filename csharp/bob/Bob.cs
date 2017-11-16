using System;
using System.Linq;
using System.Text.RegularExpressions;

public static class Bob
{
    public static string Response(string statement)
    {
        statement = statement.Trim();

        if (statement.Length == 0)
        {
            return "Fine. Be that way!";
        }
        else if (statement.Any(c => char.IsLetter(c))
          && statement.Where(c => char.IsLetter(c)).All(c => char.IsUpper(c)))
        {
            return "Whoa, chill out!";
        }
        else if (statement.EndsWith('?'))
        {
            return "Sure.";
        }

        return "Whatever.";
    }
}