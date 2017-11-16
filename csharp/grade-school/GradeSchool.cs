using System;
using System.Linq;
using System.Collections.Generic;

public class School
{
    Dictionary<string, int> students = new Dictionary<string, int>();

    public void Add(string student, int grade)
    {
        students.Add(student, grade);
    }

    public IEnumerable<string> Roster()
    {
        return students.Keys
            .OrderBy(k => students[k])
            .ThenBy(k => k);
    }

    public IEnumerable<string> Grade(int grade)
    {
        return students.Keys
            .OrderBy(k => k)
            .Where(v => students[v] == grade);
    }
}