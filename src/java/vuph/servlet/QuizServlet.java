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
import vuph.constant.Constant;
import vuph.dao.CategoriesDAO;
import vuph.dao.UserDAO;
import vuph.dto.UserDTO;

/**
 *
 * @author VuPH
 */
public class QuizServlet extends HttpServlet {
    private final String HOME = "index.jsp";
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
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            String username = user.getUsername();
            String answers = request.getParameter("answer");
            String[] answer = answers.split(" ");
            CategoriesDAO catesDAO = new CategoriesDAO();
            int cateId = -1;
            if (answer[1].equals("3")) {
                if (answer[0].equals("2")) {
                    cateId = catesDAO.getCategoryIdByName(Constant.ELECTRIC_GUITAR);
                } else {
                    cateId = catesDAO.getCategoryIdByName(Constant.CLASSIC_GUITAR);
                }
            } else if (answer[1].equals("4")) {
                if (answer[0].equals("2")) {
                    cateId = catesDAO.getCategoryIdByName(Constant.PIANO);
                } else {
                    cateId = catesDAO.getCategoryIdByName(Constant.ORGAN);
                }
            } else if (answer[1].equals("5")) {
                if (answer[0].equals("2")) {
                    cateId = catesDAO.getCategoryIdByName(Constant.HARMONICA);
                } else {
                    cateId = catesDAO.getCategoryIdByName(Constant.FLUTE);
                }
            } else if (answer[1].equals("6")) {
                if (answer[0].equals("2")) {
                    cateId = catesDAO.getCategoryIdByName(Constant.DRUM);
                } else {
                    cateId = catesDAO.getCategoryIdByName(Constant.CAJON);
                }
            }
            UserDAO userDAO = new UserDAO();
            boolean update = userDAO.updateFavor(username, cateId);
            if (update) {
                url = HOME;
                request.setAttribute("SUCCESS", "Quiz Finished!");
            } else {
                request.setAttribute("ERROR", "Something wrong happened!");
            }
        } catch (Exception e) {
            log("QuizServlet: " + e);
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
