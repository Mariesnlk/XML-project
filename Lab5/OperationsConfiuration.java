package Lab5;

import com.sun.xml.internal.ws.api.model.wsdl.WSDLOutput;
import org.w3c.dom.*;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;


public class OperationsConfiguration {

    public static void main(String[] args) throws TransformerException, ParserConfigurationException, IOException, XPathExpressionException, SAXException {
        String filename = "src/Lab5/books.xml";
        //get tree
        File inputFile = new File(filename);
        DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
        Document doc = docBuilder.parse(inputFile);
        Node book = doc.getElementsByTagName("book").item(0);

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        DOMSource source = new DOMSource(doc);
        StreamResult consoleResult = new StreamResult(System.out);

        System.out.println("Do you want to change elements?");
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String state = reader.readLine();

        //adding result into new xml file
        Result result = new StreamResult("src/Lab5/out.xml");

        if (state.equals("No")) {
            transformer.transform(source, consoleResult);
        } else if (state.equals("Yes")) {
            // loop the book child node
            NodeList list = book.getChildNodes();

            System.out.println("Enter what parameter u want to change");
            String element_naming = reader.readLine();
            System.out.println("Enter old meaning of parameter u want to change");
            String old_naming = reader.readLine();
            System.out.println("Enter new meaning of parameter u want to change");
            String new_naming = reader.readLine();

            for (int temp = 0; temp < list.getLength(); temp++) {
                Node node = list.item(temp);
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) node;
                    if (element_naming.equals(eElement.getNodeName())) {
                        if (old_naming.equals(eElement.getTextContent())) {
                            eElement.setTextContent(new_naming);
                        }
                    }
                }
            }

            transformer.transform(source, consoleResult);
            transformer.transform(source, result);
        }
    }
}
