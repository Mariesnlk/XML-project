package Lab5;

import org.w3c.dom.*;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import java.io.File;
import java.io.IOException;
import java.util.Scanner;


public class OperationsConfiguration {

    public static void main(String[] args) throws TransformerException, ParserConfigurationException, IOException, XPathExpressionException, SAXException {
        String filename = "src/Lab5/books.xml";
        //get tree
        File inputFile = new File(filename);
        DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
        Document doc = docBuilder.parse(inputFile);

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        DOMSource source = new DOMSource(doc);
        StreamResult consoleResult = new StreamResult(System.out);

        System.out.println("Do you want to change elements?");
        Scanner scanner = new Scanner(System.in);
        String state = scanner.nextLine();

        //adding result into new xml file
        Result result = new StreamResult("src/Lab5/out.xml");

        if (state.equals("No")) {
            transformer.transform(source, consoleResult);
        } else if (state.equals("Yes")) {

            System.out.println("Enter xpath or simply");
            String choose = scanner.nextLine();

            if (choose.toLowerCase().equals("xpath")) {

                System.out.println("Enter element");
                String elem = scanner.nextLine();
                System.out.println("Enter old meaning");
                String old_meaning = scanner.nextLine();
                System.out.println("Enter new meaning");
                String new_meaning = scanner.nextLine();


                // Using XPath
                String xpathExpression = "/bookstore/book/" + elem + "[text()=" + "'" + old_meaning + "'" + "]";
                XPath xpath = XPathFactory.newInstance().newXPath();
                NodeList nodelist = (NodeList) xpath.compile(xpathExpression).evaluate(doc, XPathConstants.NODESET);
                // Update the found nodes
                for (int i = 0; i < nodelist.getLength(); i++) {
                    Node node = nodelist.item(i);
                    node.setTextContent(new_meaning);
                }
            } else if (choose.toLowerCase().equals("simply")) {

                // loop the book child node
                Node book = doc.getElementsByTagName("book").item(2);
                NodeList list = book.getChildNodes();

                System.out.println("Enter what parameter u want to change");
                String element_naming = scanner.nextLine();
                System.out.println("Enter new meaning of parameter u want to change");
                String new_naming = scanner.nextLine();

                for (int temp = 0; temp < list.getLength(); temp++) {
                    Node node = list.item(temp);
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        Element eElement = (Element) node;
                        if (element_naming.equals(eElement.getNodeName())) {
                            eElement.setTextContent(new_naming);
                        }
                    }
                }
            }

            //transformer.transform(source, consoleResult);
            transformer.transform(source, result);
        }
    }
}
