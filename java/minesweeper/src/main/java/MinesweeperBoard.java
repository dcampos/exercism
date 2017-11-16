import java.util.ArrayList;
import java.util.List;

public class MinesweeperBoard {
    List<String> input;

    public MinesweeperBoard(List<String> input) {
        this.input = input;
    }

    public List<String> withNumbers() {
        List<String> result = new ArrayList<>();
        result.addAll(input);

        for (int i = 0; i < input.size(); i++) {
            String line = input.get(i);
            for (int j = 0; j < line.length(); j++) {
                if (line.charAt(j) == '*') {
                    increaseCount(result, i, j - 1);
                    increaseCount(result, i, j + 1);
                    increaseCount(result, i - 1, j);
                    increaseCount(result, i + 1, j);
                    increaseCount(result, i + 1, j + 1);
                    increaseCount(result, i + 1, j - 1);
                    increaseCount(result, i - 1, j + 1);
                    increaseCount(result, i - 1, j - 1);
                }
            }
        }

        return result;
    }

    private void increaseCount(List<String> result, int row, int col) {
        if (row < 0 || row >= result.size()) return;

        String line = result.get(row);

        if (col < 0 || col >= line.length()) return;

        char c = line.charAt(col);

        int n;

        if (Character.isDigit(c)) {
            n = Character.getNumericValue(c);
            n++;
        } else if (c == ' ') {
            n = 1;
        } else {
            return;
        }

        String str = line.substring(0, col) + n;

        if (col < line.length())
            str += line.substring(col + 1);

        result.set(row, str);
    }
}