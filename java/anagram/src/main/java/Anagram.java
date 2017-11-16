import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

class Anagram {
    private String baseWord;
    private String nBaseWord;

    Anagram(String baseWord) {
        this.baseWord = baseWord;
        this.nBaseWord = normalize(baseWord);
    }

	public List<String> match(List<String> list) {
        return list.stream()
            .filter(s -> !s.toLowerCase().equals(baseWord.toLowerCase()))
            .filter(s -> normalize(s).equals(nBaseWord))
            .collect(Collectors.toList());
    }
    
    private String normalize(String string) {
        return Arrays.stream(string.toLowerCase().split(""))
            .sorted().collect(Collectors.joining());
    }
}
