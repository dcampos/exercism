using System;

public class BinarySearch
{

    private int[] Input;

    public BinarySearch(int[] input)
    {
        Input = input;
    }

    public int Find(int value)
    {
        int left = 0;
        int right = Input.Length - 1;
        int middle;

        while (left <= right)
        {
            middle = (int) Math.Floor((left + right) / 2.0);

            if (Input[middle] < value) {
                left = middle + 1;
            } else if (Input[middle] > value) {
                right = middle - 1;
            } else {
                return middle;
            }
        }

        return -1;
    }
}