using System;
using System.Collections.Generic;
using System.Linq;

public class SaddlePoints
{
    private int[] MaxByRow, MinByCol;

    private int[,] values;

    public SaddlePoints(int[,] values)
    {
        this.values = values;

        MaxByRow = new int[values.GetUpperBound(0) + 1];
        MinByCol = new int[values.GetUpperBound(1) + 1];

        for (int i = 0; i <= values.GetUpperBound(0); i++)
        {
            MaxByRow[i] = 0;

            for (int j = 0; j <= values.GetUpperBound(1); j++)
            {
                if (values[i,j] > MaxByRow[i]) MaxByRow[i] = values[i,j];

                if (i == 0) MinByCol[j] = int.MaxValue;

                if (values[i,j] < MinByCol[j]) MinByCol[j] = values[i,j];
            }
        }
    }

    public IEnumerable<Tuple<int, int>> Calculate()
    {
        List<Tuple<int, int>> tuples = new List<Tuple<int, int>>();

        for (int i = 0; i <= values.GetUpperBound(0); i++)
        {
            for (int j = 0; j <= values.GetUpperBound(1); j++)
            {
                if (values[i,j] == MaxByRow[i] && values[i,j] == MinByCol[j])
                {
                    tuples.Add(Tuple.Create(i, j));
                }
            }
        }

        return tuples;
    }
}