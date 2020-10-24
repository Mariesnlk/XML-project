import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;


    public class Restruct{

        public static void main(String[] args) throws Exception {
            TransformerFactory factory = TransformerFactory.newInstance();
            Source xsl = new StreamSource("src/Lab3/restruct.xsl");
            Source xml = new StreamSource("src/Lab3/restruct.xml");
            Result result = new StreamResult("src/Lab3/restructRes.xml");
            Transformer transformer = factory.newTransformer(xsl);
            transformer.transform(xml, result);
        }
    }

