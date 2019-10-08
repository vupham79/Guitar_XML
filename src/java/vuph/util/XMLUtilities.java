/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 *
 * @author VuPH
 */
public class XMLUtilities implements Serializable {
    public static Document parseFileToDoc(String file_path) 
            throws SAXException, IOException, ParserConfigurationException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse(file_path);
        return doc;
    }
    
    public static XPath getXPath() {
        XPathFactory factory = XPathFactory.newInstance();
        XPath xpath = factory.newXPath();
        
        return xpath;
    }
    
    public static void saveToXMLFile(DOMResult dom, String resultFileName) throws TransformerException, FileNotFoundException {
        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer();
        StreamResult sr = new StreamResult(new FileOutputStream(resultFileName));
        transformer.transform(new DOMSource(dom.getNode()), sr);
    }
    
    public static <T> boolean validateXML(T obj, String xmlFilePath, String xsdPath) throws IOException {
        try {
            SchemaFactory sf = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            Schema schema = sf.newSchema(new File(xsdPath));
            InputSource source = new InputSource(new BufferedReader(new FileReader(xmlFilePath)));
            Validator validator = schema.newValidator();
            validator.validate(new SAXSource(source));
            System.out.println("Validated");
            return true;
        } catch (SAXException ex) {
            System.out.println("\nERROR validate-----------------------------");
            System.out.println(ex.getMessage() + "\n");
            return false;
        }
    }
    
    public static void saveToDB(StreamResult rs) {
        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            boolean isValidated = XMLUltils.validateXML(category, xmlOutput, categorySchemaPath);
        } catch (Exception e) {
        }
    }
}
