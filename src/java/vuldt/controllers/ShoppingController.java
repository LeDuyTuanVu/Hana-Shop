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
import vuldt.dtos.ProductDTO;

/**
 *
 * @author Le Duy Tuan Vu
 */
@WebServlet(name = "ShoppingController", urlPatterns = {"/ShoppingController"})
public class ShoppingController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final static String LOGIN = "login.jsp";
    private final static String HOME = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME;
        try {
            HttpSession session = request.getSession();
            ProductDAO dao = new ProductDAO();
            CartDTO cart = new CartDTO();
            if (session.getAttribute("USER") == null) {
                url = LOGIN;
            } else {
                String productID = "";
                if (request.getParameter("txtProductID") != null) {
                    productID = (String) request.getParameter("txtProductID");
                }
                int quantityReal = 0;
                String temp = "";
                if (request.getParameter("txtQuantity") != null) {
                    temp = (String) request.getParameter("txtQuantity");
                }
                quantityReal = Integer.parseInt(temp);

                ProductDTO product = dao.getProductByID(productID);
                if (session.getAttribute("CART") == null) {
                    cart = new CartDTO();
                } else {
                    cart = (CartDTO) session.getAttribute("CART");
                }
                int quantity = cart.getQuantityByID(productID);
                if (quantity >= quantityReal) {
                    request.setAttribute("MESSAGE_ADD_FAIL", "SORRY, WE DO NOT HAVE ENOUGH QUANTITY FOR SALE !");
                } else if (cart.addProduct(product)) {
                    request.setAttribute("MESSAGE_SHOPPING", "ADDED " + product.getProductName().toUpperCase() + " INTO YOUR CART SUCCESSFULLY !");
                }
                session.setAttribute("CART", cart);
                session.setAttribute("NUM_PRO", cart.getCart().size());
            }
        } catch (Exception e) {
            log("Error at ShoppingController: " + e.toString());
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
