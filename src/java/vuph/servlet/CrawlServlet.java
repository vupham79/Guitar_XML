/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.servlet;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.TransformerException;
import javax.xml.transform.dom.DOMResult;
import vuph.constant.Constant;
import vuph.util.CrawlerUltimate;
import vuph.util.XMLUtilities;

/**
 *
 * @author VuPH
 */
public class CrawlServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            ServletContext context = request.getServletContext();
            String realPath = context.getRealPath("/");
            String resultFilePath;
            String xmlConfigPath;
            String xslPath;
            DOMResult rs;
            // check if the directory can be created 
            File f = new File(realPath + Constant.PATH_XML_OUTPUT);
            // using the abstract path name 
            if (f.mkdir()) {
                System.out.println("Directory is created");
            }
            xmlConfigPath = realPath + Constant.CONFIG_WEBCRAWL;
            // LOAN PHUONG THAO
            resultFilePath = realPath + Constant.PATH_XML_OUTPUT + "ouput_loan_phuong_thao.xml";
            xslPath = realPath + Constant.XSL_LOAN_PHUONG_THAO;
            rs = CrawlerUltimate.crawl(xmlConfigPath, xslPath);
            XMLUtilities.saveToXMLFile(rs, resultFilePath);
            // NHAC CU DONG NAI
            resultFilePath = realPath + Constant.PATH_XML_OUTPUT + "output_nhac_cu_dong_nai.xml";
            xslPath = realPath + Constant.XSL_NHAC_CU_DONG_NAI;
            rs = CrawlerUltimate.crawl(xmlConfigPath, xslPath);
            XMLUtilities.saveToXMLFile(rs, resultFilePath);
            // SAI GON MUSICAL
            resultFilePath = realPath + Constant.PATH_XML_OUTPUT + "output_sai_gon_musical.xml";
            xslPath = realPath + Constant.XSL_SAI_GON_MUSICAL;
            rs = CrawlerUltimate.crawl(xmlConfigPath, xslPath);
            XMLUtilities.saveToXMLFile(rs, resultFilePath);
            request.setAttribute("SUCCESS", "Crawl successfully");
        } catch (FileNotFoundException | TransformerException e) {
            request.setAttribute("ERROR", "Crawl successfully");
            log("CrawlServlet: " + e);
        } finally {
            request.getRequestDispatcher("/").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
