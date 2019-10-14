/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.transform.stream.StreamResult;
import vuph.dao.CategoriesDAO;
import vuph.dto.UserDTO;
import vuph.generateObject.Categories;
import vuph.util.JAXBUtil;

/**
 *
 * @author VuPH
 */
public class PublishServlet extends HttpServlet {

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
            CategoriesDAO catesDAO = new CategoriesDAO();
            Categories cates = catesDAO.getAllCategories();
            Map<String, Integer> totals = new HashMap<>();
            for (int i = 0; i < cates.getCategory().size(); i++) {
                String name = cates.getCategory().get(i).getCategoryName();
                int total = cates.getCategory().get(i).getCount().intValue();
                totals.put(name, total);
            }
            StreamResult rs = JAXBUtil.marshall(cates);
            context.setAttribute("XML", rs.getOutputStream().toString());
            context.setAttribute("TOTALS", totals);
        } catch (Exception e) {
            log("PublishServlet: " + e);
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
