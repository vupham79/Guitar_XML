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

/**
 *
 * @author VuPH
 */
public class ProcessServlet extends HttpServlet {
    // Servlets
    private final String LOGIN_SERVLET = "LoginServlet";
    private final String SEARCH_SERVLET = "SearchServlet";
    private final String LOGOUT_SERVLET = "LogoutServlet";
    private final String CRAWL_SERVLET = "CrawlServlet";
    // Pages
    private final String INVALID_PAGE = "invalid.html";
    private final String QUIZ_PAGE = "quiz.jsp";
    private final String LOGIN_PAGE = "login.jsp";
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
        String url = "index.jsp";
        try {
            String action = request.getParameter("action");
            if (action.equals("Login")) {
                url = LOGIN_SERVLET;
            } else if (action.equals("Search")) {
                url = SEARCH_SERVLET;
            } else if (action.equals("Log out")) {
                url = LOGOUT_SERVLET;
            } else if (action.equals("Crawl")) {
                url = CRAWL_SERVLET;
            } else if (action.equals("Làm Quiz")) {
                url = QUIZ_PAGE;
            } else if (action.equals("Log In")) {
                url = LOGIN_PAGE;
            }
        } catch (Exception e) {
            log("ProcessServlet: " + e);
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
