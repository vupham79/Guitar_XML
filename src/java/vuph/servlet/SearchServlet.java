///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package vuph.servlet;
//
//import java.io.IOException;
//import java.text.DecimalFormat;
//import java.util.ArrayList;
//import java.util.List;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.xml.xpath.XPath;
//import javax.xml.xpath.XPathConstants;
//import org.w3c.dom.Document;
//import org.w3c.dom.NamedNodeMap;
//import org.w3c.dom.Node;
//import org.w3c.dom.NodeList;
//import vuph.util.XMLUtilities;
//
///**
// *
// * @author VuPH
// */
//public class SearchServlet extends HttpServlet {
//    // Servlet
//
//    // Page
//    private final String INVALID_PAGE = "invalid.html";
//    private final String SEARCH_PAGE = "index.jsp";
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        String url = INVALID_PAGE;
//        try {
//            String search = request.getParameter("txtSearch");
//            HttpSession session = request.getSession();
//            Document doc = (Document) session.getAttribute("DOC");
//            if (doc != null) {
//                XPath xpath = XMLUtilities.getXPath();
//                String eval = "//guitar[contains(name,'" + search + "')]";
//
//                NodeList guitars = (NodeList) xpath.evaluate(eval, doc, XPathConstants.NODESET);
//
//                if (guitars != null) {
////                    List<InstrumentDTO> list = new ArrayList<>();
////                    for (int i = 0; i < guitars.getLength(); i++) {
////                        Node child = guitars.item(i);
////                        String store = "", guitar_url = "", brand = "", name = "",
////                                price = "";
////                        NamedNodeMap attrs = child.getAttributes();
////                        // Get attributes
////                        store = attrs.getNamedItem("store").getNodeValue();
////                        guitar_url = attrs.getNamedItem("url").getNodeValue();
////                        brand = attrs.getNamedItem("brand").getNodeValue();
////                        // Get inner value
////                        NodeList guitarChild = child.getChildNodes();
////                        for (int j = 0; j < guitarChild.getLength(); j++) {
////                            Node temp = guitarChild.item(j);
////                            if (temp.getNodeName().equals("name")) {
////                                name = temp.getTextContent().trim();
////                            } else if (temp.getNodeName().equals("price")) {
////                                price = temp.getTextContent().trim();
////                                double price_convert = Double.parseDouble(price);
////                                DecimalFormat formatter = new DecimalFormat("#,###");
////                                price = formatter.format(price_convert) + " đ";
////                            }
////                        }
//                        // Apply to DTO
//                        
////                        list.add(dto);
//                    }
//                    request.setAttribute("RESULT", list);
//                    url = SEARCH_PAGE;
//                    log("result: " + list.size());
//                }
//            } else {
//
//            }
//        } catch (Exception e) {
//            log("SearchServlet: " + e);
//        } finally {
//            RequestDispatcher rd = request.getRequestDispatcher(url);
//            rd.forward(request, response);
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
