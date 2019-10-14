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

    private final String ADMIN_PAGE = "admin.jsp";
    private final String LOGIN_PAGE = "login.jsp";
    private final String FAVOR_PAGE = "favor.jsp";

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
            HttpSession session = request.getSession();
            UserDTO dto = (UserDTO) session.getAttribute("USER");
            if (dto != null) {
                if (dto.isIsAdmin()) {
                    url = ADMIN_PAGE;
                    request.getRequestDispatcher(url).forward(request, response);
                    return;
                }
                if (dto.getCateIdOfFavor() != 0) {
                    url = FAVOR_PAGE;
                    request.getRequestDispatcher(url).forward(request, response);
                    return;
                }
                String username = dto.getUsername();
                String answers = request.getParameter("answer");
                String[] answer = answers.split(" ");
                CategoriesDAO catesDAO = new CategoriesDAO();
                String cateName = "";
                int cateId = 0;
                if (answer[1].equals("3")) {
                    if (answer[0].equals("2")) {
                        cateName = Constant.ELECTRIC_GUITAR;
                        cateId = catesDAO.getCategoryIdByName(Constant.ELECTRIC_GUITAR);
                    } else {
                        cateName = Constant.CLASSIC_GUITAR;
                        cateId = catesDAO.getCategoryIdByName(Constant.CLASSIC_GUITAR);
                    }
                } else if (answer[1].equals("4")) {
                    if (answer[0].equals("2")) {
                        cateName = Constant.PIANO;
                        cateId = catesDAO.getCategoryIdByName(Constant.PIANO);
                    } else {
                        cateName = Constant.ORGAN;
                        cateId = catesDAO.getCategoryIdByName(Constant.ORGAN);
                    }
                } else if (answer[1].equals("5")) {
                    if (answer[0].equals("2")) {
                        cateName = Constant.HARMONICA;
                        cateId = catesDAO.getCategoryIdByName(Constant.HARMONICA);
                    } else {
                        cateName = Constant.FLUTE;
                        cateId = catesDAO.getCategoryIdByName(Constant.FLUTE);
                    }
                } else if (answer[1].equals("6")) {
                    if (answer[0].equals("2")) {
                        cateName = Constant.DRUM;
                        cateId = catesDAO.getCategoryIdByName(Constant.DRUM);
                    } else {
                        cateName = Constant.CAJON;
                        cateId = catesDAO.getCategoryIdByName(Constant.CAJON);
                    }
                }
                UserDAO userDAO = new UserDAO();
                boolean update = userDAO.updateFavor(username, cateId);
                if (update) {
                    url = FAVOR_PAGE;
                    dto.setCateIdOfFavor(cateId);
                    String favorDescription = userDAO.getFavorDescription(cateId);
                    session.setAttribute("FavorDescription", favorDescription);
                } else {
                    request.setAttribute("ERROR", "Something wrong happened!");
                }
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
