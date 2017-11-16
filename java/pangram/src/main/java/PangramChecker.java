import java.util.stream.Collectors;

public class PangramChecker {
    
    private String letters = "abcdefghijklmnopqrstuvwxyz";
      
    public boolean isPangram(String input) {
        return (letters.equals(input.toLowerCase().chars()
            .filter(Character::isLetter)
            .mapToObj(c -> String.valueOf((char) c))
            .sorted()
            .distinct()
            .collect(Collectors.joining(""))));
    }
}
