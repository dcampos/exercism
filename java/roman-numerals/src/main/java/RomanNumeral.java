import static java.util.Collections.nCopies;
import static java.lang.String.join;

class RomanNumeral {

    private final int decimal;

    private static int[] numbers =
        {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
    private static String[] symbols =
        {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};

    RomanNumeral(int decimal) {
        this.decimal = decimal;
    }

    String getRomanNumeral() {
        int value = decimal;
        StringBuilder result = new StringBuilder();

        for (int i = 0; i < numbers.length; i++) {
            int repeat = value / numbers[i];
            value -= numbers[i] * repeat;
            result.append(join("", nCopies(repeat, symbols[i])));
        }

        return result.toString();
    }
}