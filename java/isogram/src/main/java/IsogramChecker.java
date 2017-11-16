public class IsogramChecker {

    public boolean isIsogram(String input) {
        return 
            input.toLowerCase().chars()
                .filter(c -> Character.isLetter(c))
                .distinct()
                .count() ==
            input.toLowerCase().chars()
                .filter(c -> Character.isLetter(c))
                .count();
    }
}