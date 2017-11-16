import java.util.ArrayList;
import java.util.List;

public class Flattener {

    public List<Object> flatten(List<Object> list) {
        List<Object> ret = new ArrayList<>();

        for (Object item : list) {
            if (item instanceof List) {
                ret.addAll(flatten((List<Object>) item));
            } else if (item != null) {
                ret.add(item);
            }
        }

        return ret;
    }
}