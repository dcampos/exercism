import java.util.Arrays;
import java.util.stream.IntStream;

class SumOfMultiples {
    int sum;

    SumOfMultiples(int number, int[] set) {
        sum = IntStream.range(1, number)
                .filter(x -> Arrays.stream(set).anyMatch(m -> (x % m == 0)))
                .sum();
    }

    int getSum() {
        return sum;
    }
}
