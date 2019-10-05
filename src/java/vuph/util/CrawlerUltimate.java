/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.util;

import java.io.FileInputStream;
import java.io.InputStream;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;

/**
 *
 * @author VuPH
 */
public class CrawlerUltimate {

    public static DOMResult crawl(String configPath, String xslPath) {
        try {
            // init files
            StreamSource xslCate = new StreamSource(xslPath);
            InputStream is = new FileInputStream(configPath);
            // init transformer api
            TransformerFactory factory = TransformerFactory.newInstance();
            DOMResult domRs = new DOMResult();
            UltimateURIResolver resolver = new UltimateURIResolver();
            // apply uriResolver
            factory.setURIResolver(resolver);
            Transformer transformer = factory.newTransformer(xslCate);
            // transform xml config by input xsl
            transformer.transform(new StreamSource(is), domRs);
            return domRs;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
}
