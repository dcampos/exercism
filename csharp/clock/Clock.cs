using System;

public struct Clock
{

    const int MinutesPerDay = 24 * 60;

    private int Time;

    public Clock(int hours, int minutes)
    {
        Time = hours * 60 + minutes;
        Normalize();
    }

    public int Hours
    {
        get => Time / 60 % 24;
    }

    public int Minutes
    {
        get => Time % 60;
    }

    public Clock Add(int minutesToAdd)
    {
        return new Clock(0, Time += minutesToAdd);
    }

    public Clock Subtract(int minutesToSubtract)
    {
        return new Clock(0, Time -= minutesToSubtract);
    }

    private void Normalize() {
        if (Time < 0)
            Time = MinutesPerDay - (Math.Abs(Time) % MinutesPerDay);
        else
            Time = Time % MinutesPerDay;
    }

    public override string ToString()
    {
        return $"{Hours:00}:{Minutes:00}";
    }
}