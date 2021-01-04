import com.nk.util.ChineseCharToEn;
import org.junit.Test;

public class TestEN {
    @Test
    public void fun(){
        String s = "传参";
        System.out.println(ChineseCharToEn.getAllFirstLetter(s));
    }
}
