import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.util.Scanner;

public class Trans {
    public static void main(String[] args) throws Exception {
        TransformerFactory factory = TransformerFactory.newInstance();
        Source xsl = new StreamSource("src/personality.xsl");
        Transformer transformer = factory.newTransformer(xsl);
        Source xml = new StreamSource("src/personality.xml");
        Result result = new StreamResult("src/personalityOut.xml");
        Integer salary = null;
        while (salary == null) {
            try {
                Scanner scanner = new Scanner(System.in);
                System.out.println("Enter the value of salary: ");
                salary = scanner.nextInt();
            } catch (Exception e) {
                System.out.println("You have some problems! Try again!");
            }
        }
        System.out.println(salary);
        transformer.setParameter("cond", salary);
        transformer.transform(xml, result);
    }
}
