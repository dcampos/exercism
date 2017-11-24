import java.util.Arrays;
import java.util.stream.Collectors;

class Acronym {
    private String phrase;

    Acronym(String phrase) {
        this.phrase = phrase;
    }

    String get() {
        return Arrays.stream(phrase.split("\\W+"))
            .map(s -> s.substring(0, 1))
            .collect(Collectors.joining())
            .toUpperCase();
    }

}