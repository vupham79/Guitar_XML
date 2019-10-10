/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.runUtil;

import vuph.util.JAXBUtil;

/**
 *
 * @author VuPH
 */
public class RunJAXBUtil {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Start");
        RunJAXBUtil.convertXSDToJava();
        System.out.println("Finished");
    }

    public static void convertXSDToJava() {
        // Instrument XSD -> Java object
        String filepath = "web/WEB-INF/schema/instrument.xsd";
        JAXBUtil.convertXSDToJava(filepath);
        // Category XSD -> Java object
        filepath = "web/WEB-INF/schema/category.xsd";
        JAXBUtil.convertXSDToJava(filepath);
        // Categories -> Java object
        filepath = "web/WEB-INF/schema/categories.xsd";
        JAXBUtil.convertXSDToJava(filepath);
        // Store -> Java object
        filepath = "web/WEB-INF/schema/store.xsd";
        JAXBUtil.convertXSDToJava(filepath);
    }
    
    public static void unmarshall() {
//        JAXBUtil.unmarshall(Constant.REAL_PATH + Constant.PATH_XML_OUTPUT + Constant.OUTPUT_LOAN_PHUONG_THAO);
    }
}
