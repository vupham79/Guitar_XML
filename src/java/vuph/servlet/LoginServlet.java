/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vuph.dao.UserDAO;
import vuph.dto.UserDTO;

/**
 *
 * @author VuPH
 */
public class LoginServlet extends HttpServlet {
    // Servlets

    // Pages
    private final String LOGIN_PAGE = "login.jsp";
    private final String HOME_PAGE = "index.jsp";
    private final String ADMIN_PAGE = "admin.jsp";

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
        String url = LOGIN_PAGE;
        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            // Check login
            UserDAO dao = new UserDAO();
            UserDTO dto = dao.checkLogin(username, password);
            if (dto != null) {
                HttpSession session = request.getSession();
//            String real_path = getServletContext().getRealPath("/");
//            String file_path = real_path + XML_FILEPATH;

//            Document doc = XMLUtilities.parseFileToDoc(file_path);
                // Add attributes to Session
//            session.setAttribute("DOC", doc);
                if (dto.isIsAdmin()) {
                    url = ADMIN_PAGE;
                } else {
                    url = HOME_PAGE;
                }
                session.setAttribute("USER", dto);
            } else {
                request.setAttribute("error", "Username or Password not right!");
            }
        } catch (Exception e) {
            log("LoginServlet: " + e);
        } finally {
            System.out.println("DONE");
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
