import java.util.stream.IntStream;

public class Hamming {
    private int distance;

    Hamming(String leftStrand, String rightStrand) {
        if (leftStrand.length() != rightStrand.length())
            throw new IllegalArgumentException("leftStrand and rightStrand must be of equal length.");

        distance = IntStream.range(0, leftStrand.length())
            .map(i -> leftStrand.charAt(i) != rightStrand.charAt(i) ? 1 : 0)
            .sum();
    }

    int getHammingDistance() {
        return distance;
    }
}