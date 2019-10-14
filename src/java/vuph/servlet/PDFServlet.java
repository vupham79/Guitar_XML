/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.servlet;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import org.apache.avalon.framework.configuration.ConfigurationException;
import org.apache.avalon.framework.configuration.DefaultConfigurationBuilder;
import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.FopFactoryBuilder;
import org.apache.xmlgraphics.util.MimeConstants;
import org.xml.sax.SAXException;
import vuph.constant.Constant;
import vuph.dao.CategoriesDAO;
import vuph.dto.UserDTO;
import vuph.generateObject.Categories;
import vuph.util.JAXBUtil;

/**
 *
 * @author VuPH
 */
public class PDFServlet extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            UserDTO dto = (UserDTO) session.getAttribute("USER");
            if (!dto.isIsAdmin()) {
                request.getRequestDispatcher(UNAUTHORIZED_PAGE).forward(request, response);
                return;
            }
            String realPath = getServletContext().getRealPath("/");
            String xsl = realPath + Constant.INSTRUMENT_FO_XSL;

            FopFactoryBuilder builder = new FopFactoryBuilder(new File(realPath + Constant.URL_IMAGE).toURI());
            DefaultConfigurationBuilder defaultConfigBuilder = new DefaultConfigurationBuilder();
            builder.setConfiguration(defaultConfigBuilder.buildFromFile(new File(realPath + "WEB-INF/document/pdf_config.xml")));
            FopFactory fopFactory = builder.build();
            //Setup a buffer to obtain the content length
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsl));
            transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
            //Make sure the XSL transformation's result is piped through to FOP
            Result res = new SAXResult(fop.getDefaultHandler());

            //Setup input
            CategoriesDAO catesDAO = new CategoriesDAO();
            Categories cates = catesDAO.getAllCategories();
            JAXBUtil.marshallToFile(cates, realPath + Constant.PATH_XML_OUTPUT);
            //Start the transformation and rendering process]
            Source src = new StreamSource(new File(realPath + Constant.PATH_XML_OUTPUT));
            transformer.transform(src, res);

            //Prepare response
            response.setContentType("application/pdf");
            response.setContentLength(out.size());

            //Send content to Browser
            response.getOutputStream().write(out.toByteArray());
            response.getOutputStream().flush();
        } catch (IOException | SQLException | TransformerException | FOPException e) {
            log("PDFServlet: " + e);
        } catch (SAXException ex) {
            Logger.getLogger(PDFServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ConfigurationException ex) {
            Logger.getLogger(PDFServlet.class.getName()).log(Level.SEVERE, null, ex);
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
