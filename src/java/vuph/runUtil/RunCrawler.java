/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.runUtil;

import javax.xml.transform.dom.DOMResult;
import vuph.constant.Constant;
import vuph.util.CrawlerUltimate;
import vuph.util.XMLUtilities;

/**
 *
 * @author VuPH
 */
public class RunCrawler {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String resultFilePath;
        String xmlConfigPath;
        String xslPath;
        
        xmlConfigPath = Constant.REAL_PATH + Constant.CONFIG_WEBCRAWL;
        
        // LOAN PHUONG THAO
        resultFilePath = Constant.REAL_PATH + Constant.PATH_XML_OUTPUT + Constant.OUTPUT_LOAN_PHUONG_THAO;
        xslPath = Constant.REAL_PATH + Constant.XSL_LOAN_PHUONG_THAO;
        runCrawl(xmlConfigPath, xslPath, resultFilePath);
        // NHAC CU DONG NAI
        resultFilePath = Constant.REAL_PATH + Constant.PATH_XML_OUTPUT + Constant.OUTPUT_NHAC_CU_DONG_NAI;
        xslPath = Constant.REAL_PATH + Constant.XSL_NHAC_CU_DONG_NAI;
        runCrawl(xmlConfigPath, xslPath, resultFilePath);
        // SAI GON MUSICAL
        resultFilePath = Constant.REAL_PATH + Constant.PATH_XML_OUTPUT + Constant.OUTPUT_SAI_GON_MUSICAL;
        xslPath = Constant.REAL_PATH + Constant.XSL_SAI_GON_MUSICAL;
        runCrawl(xmlConfigPath, xslPath, resultFilePath);
    }

    public static void runCrawl(String xmlConfigPath, String xslPath, String resultFilePath) {
        try {
            DOMResult rs = CrawlerUltimate.crawl(xmlConfigPath, xslPath);
            XMLUtilities.saveToXMLFile(rs, resultFilePath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
