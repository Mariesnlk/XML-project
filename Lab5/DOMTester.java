package Lab5;


import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class DOMTester {
    public static void main(String[] args) throws IOException {
        String filename = "Lab5/books.xml";
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

        DocumentBuilder builder = null;
        try {
            builder = factory.newDocumentBuilder();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
        Document document = null;
        try {
            document = builder.parse(filename);
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Element rootElement = document.getDocumentElement();
        rootElement.normalize();
        NodeList books = rootElement.getElementsByTagName("book");
        int count = books.getLength();

        System.out.println("Enter author whose books u want to see");
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String author_name = reader.readLine();

        for (int i = 0; i < count; i++) {
            Element book = (Element) books.item(i);
            Element author = (Element) book.getElementsByTagName("author").item(0);
            String author_str = ((Text) author.getFirstChild()).getData();
            if(author_str.toLowerCase().equals(author_name.toLowerCase())){
                NodeList titles = book.getElementsByTagName("title");
                Element title = (Element) titles.item(0);
                Text titletext = (Text) title.getFirstChild();
                String titlevalue = titletext.getData();
                System.out.println("Title: " +titlevalue.trim());
            }

        }

    }
}

