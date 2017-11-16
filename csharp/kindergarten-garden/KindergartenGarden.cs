using System;
using System.Linq;
using System.Collections.Generic;

public enum Plant
{
    Violets,
    Radishes,
    Clover,
    Grass
}

public class KindergartenGarden
{
    private const int PlantsByChild = 2;
    private static readonly string[] DefaultChildren = new[] {
            "Alice", "Bob", "Charlie", "David",
            "Eve", "Fred", "Ginny", "Harriet",
            "Ileana", "Joseph", "Kincaid", "Larry"
    };

    private List<string> children = new List<string>();

    private Dictionary<string, List<Plant>> plantsByChild
        = new Dictionary<string, List<Plant>>();

    public KindergartenGarden(string diagram) : this(diagram, DefaultChildren)
    {
    }

    public KindergartenGarden(string diagram, IEnumerable<string> children)
    {
        this.children.AddRange(children);
        this.children.ForEach(s => AllocatePlants(diagram, s));
    }

    private Plant PlantForInitial(char initial)
    {
        var names = Enum.GetNames(typeof(Plant));
        return names.Where(n => n.StartsWith(initial))
            .Select(n => (Plant)Enum.Parse(typeof(Plant), n)).First();
    }

    public IEnumerable<Plant> Plants(string child) => plantsByChild[child];

    public void AllocatePlants(string diagram, string child)
    {
        int index = children.IndexOf(child);

        var plants = new List<Plant>();

        diagram.Split("\n")
            .ToList()
            .ForEach(row => plants.AddRange(GetPlants(row, index)));

        plantsByChild[child] = plants;
    }

    private List<Plant> GetPlants(string row, int index) =>
        row.Skip(index * PlantsByChild)
            .Take(PlantsByChild)
            .Select(c => PlantForInitial(c))
            .ToList();

}