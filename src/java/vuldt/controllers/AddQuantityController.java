/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuldt.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vuldt.daos.ProductDAO;
import vuldt.dtos.CartDTO;

/**
 *
 * @author Le Duy Tuan Vu
 */
@WebServlet(name = "AddQuantityController", urlPatterns = {"/AddQuantityController"})
public class AddQuantityController extends HttpServlet {

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
            String productID = "", temp = "";
            if (request.getParameter("txtProductID") != null) {
                productID = (String) request.getParameter("txtProductID");
            }
            if (request.getParameter("txtQuantity") != null) {
                temp = (String) request.getParameter("txtQuantity");
            }

            int quantity = 0;
            quantity = Integer.parseInt(temp);
            quantity = quantity + 1;

            ProductDAO dao = new ProductDAO();
            int quantityReal = 0;
            quantityReal = dao.getQuantityProduct(productID);

            CartDTO cart = new CartDTO();
            cart = (CartDTO) session.getAttribute("CART");

            if (quantityReal >= quantity) {
                for (int i = 0; i < cart.getCart().size(); i++) {
                    if (cart.getCart().get(i).getProductID().equals(productID)) {
                        cart.getCart().get(i).setQuantity(quantity);
                    }
                }
            }
        } catch (Exception e) {
            log("Error at AddQuantityController: " + e.toString());
        } finally {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
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
