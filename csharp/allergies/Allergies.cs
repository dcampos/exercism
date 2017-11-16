using System;
using System.Linq;
using System.Collections.Generic;

public class Allergies
{
    private static readonly Dictionary<string, int> AllergyMap = new Dictionary<string, int>();

    private int Mask;

    static Allergies() {
        AllergyMap["eggs"] = 1;
        AllergyMap["peanuts"] = 1 << 1;
        AllergyMap["shellfish"] = 1 << 2;
        AllergyMap["strawberries"] = 1 << 3;
        AllergyMap["tomatoes"] = 1 << 4;
        AllergyMap["chocolate"] = 1 << 5;
        AllergyMap["pollen"] = 1 << 6;
        AllergyMap["cats"] = 1 << 7;
    }

    public Allergies(int mask)
    {
        Mask = mask;
    }

    public bool IsAllergicTo(string allergy)
    {
        return (AllergyMap[allergy] & Mask) != 0;
    }

    public IList<string> List()
    {
        return AllergyMap.Keys.Where(k => (AllergyMap[k] & Mask) != 0).ToList();
    }
}