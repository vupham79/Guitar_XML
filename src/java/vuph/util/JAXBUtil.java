/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.util;

import com.sun.codemodel.JCodeModel;
import com.sun.tools.xjc.api.ErrorListener;
import com.sun.tools.xjc.api.S2JJAXBModel;
import com.sun.tools.xjc.api.SchemaCompiler;
import com.sun.tools.xjc.api.XJC;
import java.io.File;
import java.io.Serializable;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import org.xml.sax.InputSource;
import org.xml.sax.SAXParseException;
import vuph.generateObject.Categories;
import vuph.generateObject.Category;
import vuph.generateObject.Instrument;

/**
 *
 * @author VuPH
 */
public class JAXBUtil implements Serializable {

    public static void convertXSDToJava(String filePath) {
        try {
            System.out.println("Start Generating Object");
            String output = "src/java";
            SchemaCompiler sc = XJC.createSchemaCompiler();
            sc.setErrorListener(new ErrorListener() {
                @Override
                public void error(SAXParseException saxpe) {
                    System.out.println("error: " + saxpe.getMessage());
                }

                @Override
                public void fatalError(SAXParseException saxpe) {
                    System.out.println("error: " + saxpe.getMessage());
                }

                @Override
                public void warning(SAXParseException saxpe) {
                    System.out.println("error: " + saxpe.getMessage());
                }

                @Override
                public void info(SAXParseException saxpe) {
                    System.out.println("error: " + saxpe.getMessage());
                }
            });
            sc.forcePackageName("vuph.generateObject");
            File schema = new File(filePath);
            InputSource is = new InputSource(schema.toURI().toString());
            sc.parseSchema(is);
            S2JJAXBModel model = sc.bind();
            JCodeModel code = model.generateCode(null, null);
            code.build(new File(output));
            System.out.println("Finished Generating Object");
        } catch (Exception e) {
            System.out.println("ConvertXMLToJava: " + e.getMessage());
        }
    }

    public static Categories unmarshall(String filepath) {
        Categories categories = null;
        try {
            JAXBContext jc = JAXBContext.newInstance(Categories.class);
            Unmarshaller um = jc.createUnmarshaller();
            File file = new File(filepath);
            categories = (Categories) um.unmarshal(file);
        } catch (Exception e) {
            System.out.println("Unmarshall: " + e);
        }
        return categories;
    }
}