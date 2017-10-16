package test;

import org.junit.Test;

/**
 * Created by Administrator on 2017/8/25.
 */
public class TestCase {


    @Test
    public void test(){
        String s = "heello" + "nihao";
        String b ="heello" + "nihao";
        System.out.println(s.equals(b));
        System.out.println(s == b);
    }
}
