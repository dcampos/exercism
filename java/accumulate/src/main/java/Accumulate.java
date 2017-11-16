import java.util.List;
import java.util.function.UnaryOperator;
import java.util.stream.Collectors;

class Accumulate {

    public static <T> List<T> accumulate(List<T> input, UnaryOperator<T> function) {
        return input.stream()
            .map(e -> function.apply(e))
            .collect(Collectors.toList());
    }
}