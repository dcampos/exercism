using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public static class Markdown
{
    private static Dictionary<string, string> Replacements = new Dictionary<string, string>() 
    {
        {"__", "strong"},
        {"_", "em"},
    };

    private static string Wrap(string text, string tag) => $"<{tag}>{text}</{tag}>";

    private static string ParseText(string line)
    {
        foreach (var item in Replacements.Keys)
        {
            string pattern = $"{item}(.*){item}";
            string replacement = string.Format("<{0}>$1</{0}>", Replacements[item]);
            line = Regex.Replace(line, pattern, replacement);
        }
        return line;
    }

    private static string ParseHeader(string line)
    {
        var count = line.TakeWhile(c => c == '#').Count();

        var headerTag = "h" + count;
        var headerHtml = Wrap(line.Substring(count + 1), headerTag);

        return headerHtml;
    }

    private static string ParseListItem(string line, List<string> lines)
    {
        var innerHtml = Wrap(ParseText(line.Substring(2)), "li");

        if (lines.Count > 0 && lines[0].StartsWith("*")) {
            line = lines.RemoveFirst();
            innerHtml += ParseListItem(line, lines);
        }

        return innerHtml;
    }

    private static string ParseParagraph(string line)
    {
            return Wrap(ParseText(line), "p");
    }

    private static string ParseLine(string line, List<string> lines)
    {
        string result = "";

        if (line.StartsWith('*'))
            result = Wrap(ParseListItem(line, lines), "ul");
        else if (line.StartsWith('#')) 
            result = ParseHeader(line);
        else
            result = ParseParagraph(line);

        if (result == null)
            throw new ArgumentException("Invalid markdown");

        return result;
    }

    public static string Parse(string markdown)
    {
        var lines = markdown.Split('\n').ToList();
        var result = "";

        while (lines.Count > 0)
        {
            var line = lines.RemoveFirst();
            result += ParseLine(line, lines);
        }

        return result;
    }

    public static T RemoveFirst<T>(this List<T> list)
    {
        if (list.Count < 1)
            throw new ArgumentException("List cannot be empty.");

        var item = list[0];
        list.RemoveAt(0);
        return item;
    }
}
