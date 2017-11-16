import java.util.HashMap;
import java.util.Map;

class Scrabble {

    private Map<Integer, Integer> values = new HashMap<>();
    private String word;

    Scrabble(String word) {
        this.word = word;
        addValues("aeioulnrst", 1);
        addValues("dg", 2);
        addValues("bcmp", 3);
        addValues("fhvwy", 4);
        addValues("k", 5);
        addValues("jx", 8);
        addValues("qz", 10);
    }

    private void addValues(String string, int i) {
        string.chars().forEach(n -> values.put(n, i));
	}

	int getScore() {
        return word.toLowerCase().chars()
            .map(n -> values.get(n)).sum();
    }

}