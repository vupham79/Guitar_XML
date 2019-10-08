/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.util;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

/**
 *
 * @author VuPH
 */
public class CrawlerUltimate {

    public static StreamResult crawl(String configPath, String xslPath) {
        try {
            // init files
            StreamSource xslCate = new StreamSource(xslPath);
            InputStream is = new FileInputStream(configPath);
            // init transformer api
            TransformerFactory factory = TransformerFactory.newInstance();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            StreamResult streamRs = new StreamResult(out);
            UltimateURIResolver resolver = new UltimateURIResolver();
            // apply uriResolver
            factory.setURIResolver(resolver);
            Transformer transformer = factory.newTransformer(xslCate);
            transformer.setOutputProperty(OutputKeys.METHOD, "xml");
            transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
            transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            // transform xml config by input xsl
            transformer.transform(new StreamSource(is), streamRs);
            return streamRs;
        } catch (Exception e) {
            System.out.println("CrawlerUltimate-crawl: " + e);
        }
        return null;
    }
}
