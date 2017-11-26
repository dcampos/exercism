using System;

public class Robot
{
    public string Name { get; set; }

    private static Random random = new Random();

    public Robot()
    {
        Reset();
    }

    public void Reset()
    {
        Name = string.Format("{0}{1}{2:000}",
            (char) random.Next('A', 'Z' + 1),
            (char) random.Next('A', 'Z' + 1),
            random.Next(0, 1000));
    }
}