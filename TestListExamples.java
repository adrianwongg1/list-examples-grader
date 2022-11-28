import static org.junit.Assert.*;
import org.junit.*;
import java.util.*;

public class TestListExamples {
  // Write your grading tests here!

  //test that the code actually runs
  @Test
  public void testFilter(){
    StringChecker checker = (String s) -> !s.isEmpty();
    ArrayList<String> input1 = new ArrayList<>();
    input1.add("one");
    input1.add("");
    input1.add("once");

    Assert.assertEquals(new ArrayList<String>(Arrays.asList("one", "once")), ListExamples.filter(input1, checker));
  }

  @Test
  public void testMergeOrder() {
    //takes in two lists, add 3 elements to input 1
    //add 3 elements to input 2
    //merge, see if the expected array matches the merged array
    ArrayList<String> input1 = new ArrayList<>();
    ArrayList<String> input2 = new ArrayList<>();
    ArrayList<String> expectedList = new ArrayList<>();

    input1.add("a");
    input1.add("b");
    input2.add("c");
    input2.add("d");
    input1.add("e");

    expectedList.add("a");
    expectedList.add("b");
    expectedList.add("c");
    expectedList.add("d");
    expectedList.add("e");

    assertArrayEquals(expectedList.toArray(), ListExamples.merge(input1,input2).toArray());

  }
}
