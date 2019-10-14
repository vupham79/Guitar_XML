/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.servlet;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vuph.constant.Constant;
import vuph.dto.UserDTO;
import vuph.util.CrawlerUltimate;
import vuph.util.XMLUtilities;

/**
 *
 * @author VuPH
 */
public class CrawlServlet extends HttpServlet {

    private final String ADMIN_JSP = "admin.jsp";
    private final String UNAUTHORIZED_PAGE = "unauthorized.jsp";

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
        String url = UNAUTHORIZED_PAGE;
        try {
            HttpSession session = request.getSession();
            UserDTO dto = (UserDTO) session.getAttribute("USER");
            if (!dto.isIsAdmin()) {
                request.getRequestDispatcher(url).forward(request, response);
                return;
            }
            url = ADMIN_JSP;
            ServletContext context = request.getServletContext();
            String realPath = context.getRealPath("/");
            XMLUtilities xmlUtils = new XMLUtilities();
            String xmlConfigPath;
            String xslPath;
            String xsdPath = realPath + Constant.XSD_STORE;
            String xml;
            xmlConfigPath = realPath + Constant.CONFIG_WEBCRAWL;
            // DUC THUONG
            xslPath = realPath + Constant.XSL_DUC_THUONG;
            xml = CrawlerUltimate.crawl(xmlConfigPath, xslPath);
            xmlUtils.saveToDB(xml, xsdPath);
            // NHAC CU DONG NAI
            xslPath = realPath + Constant.XSL_NHAC_CU_DONG_NAI;
            xml = CrawlerUltimate.crawl(xmlConfigPath, xslPath);
            xmlUtils.saveToDB(xml, xsdPath);
            // SAI GON MUSICAL
            xslPath = realPath + Constant.XSL_SAI_GON_MUSICAL;
            xml = CrawlerUltimate.crawl(xmlConfigPath, xslPath);
            xmlUtils.saveToDB(xml, xsdPath);
            // HARMONICASHOP
            xslPath = realPath + Constant.XSL_HARMONICASHOP;
            xml = CrawlerUltimate.crawl(xmlConfigPath, xslPath);
            xmlUtils.saveToDB(xml, xsdPath);
            System.out.println("Finish");
            request.setAttribute("SUCCESS", "Crawl successfully");
        } catch (Exception e) {
            request.setAttribute("ERROR", "Crawl failed");
            log("CrawlServlet: " + e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
