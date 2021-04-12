/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuldt.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vuldt.daos.OrderDAO;
import vuldt.daos.ProductDAO;
import vuldt.dtos.CartDTO;
import vuldt.dtos.ProductDTO;
import vuldt.dtos.UserDTO;

/**
 *
 * @author Le Duy Tuan Vu
 */
@WebServlet(name = "BuyingController", urlPatterns = {"/BuyingController"})
public class BuyingController extends HttpServlet {

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
            OrderDAO daoOrder = new OrderDAO();
            ProductDAO daoProduct = new ProductDAO();
            CartDTO cart = new CartDTO();
            boolean check = true;
            String fullName = "", phone = "", email = "", address = "";
            if (request.getParameter("txtNameCustomer") != null) {
                fullName = (String) request.getParameter("txtNameCustomer");
            }
            if (request.getParameter("txtPhoneCustomer") != null) {
                phone = (String) request.getParameter("txtPhoneCustomer");
            }
            if (request.getParameter("txtEmailCustomer") != null) {
                email = (String) request.getParameter("txtEmailCustomer");
            }
            if (request.getParameter("txtAddressCustomer") != null) {
                address = (String) request.getParameter("txtAddressCustomer");
            }

            if (fullName.trim().isEmpty()) {
                check = false;
                request.setAttribute("MESS_NAME_CUS", "Name must not empty !");
            }
            if (phone.trim().isEmpty()) {
                check = false;
                request.setAttribute("MESS_PHONE_CUS", "Phone number must not empty !");
            } else if (phone.trim().length() != 10) {
                check = false;
                request.setAttribute("MESS_PHONE_CUS", "Phone number must have 10 letter !");
            }
            if (email.trim().isEmpty()) {
                check = false;
                request.setAttribute("MESS_EMAIL_CUS", "Email must not empty !");
            }
            if (address.trim().isEmpty()) {
                check = false;
                request.setAttribute("MESS_ADDRESS_CUS", "Address must not empty !");
            }
            if (session.getAttribute("CART") == null) {
                request.setAttribute("MESS_BUYING", "You do not have any product in your cart !");
            }

            ArrayList<ProductDTO> listProNotReady = new ArrayList<>();
            ArrayList<ProductDTO> listProReady = new ArrayList<>();

            if (check) {
                if (session.getAttribute("CART") != null) {
                    cart = (CartDTO) session.getAttribute("CART");
                } else {
                    request.setAttribute("MESS_BUYING", "You do not have any product in your cart !");
                }
                if (cart.getCart().size() == 0) {
                    request.setAttribute("MESS_BUYING", "You do not have any product in your cart !");
                } else {
                    for (int i = 0; i < cart.getCart().size(); i++) {
                        if (cart.getCart().get(i).getQuantity() > daoProduct.getQuantityProduct(cart.getCart().get(i).getProductID())) {
                            listProNotReady.add(cart.getCart().get(i));
                        } else {
                            listProReady.add(cart.getCart().get(i));
                        }
                    }
                    if (!listProReady.isEmpty()) {
                        int numberPro = 0;
                        numberPro = cart.getCart().size() - listProReady.size();
                        session.setAttribute("NUM_PRO", numberPro);

                        int numberOrder = daoOrder.getNumberOrder() + 1;
                        String orderID = "order" + numberOrder;
                        String createDate = "";
                        Calendar calender = Calendar.getInstance();
                        int year = calender.get(Calendar.YEAR);
                        int month = calender.get(Calendar.MONTH) + 1;
                        int day = calender.get(Calendar.DAY_OF_MONTH);
                        createDate = year + "-" + month + "-" + day;
                        UserDTO user = (UserDTO) session.getAttribute("USER");
                        String userID = user.getUserID();

                        if (daoOrder.insertOrder(orderID, cart.getTotal(), createDate, phone, email, address, fullName, userID) != 0) {

                        }
                        for (int i = 0; i < listProReady.size(); i++) {
                            if (daoOrder.insertOrderDetail(listProReady.get(i).getProductID(), orderID, listProReady.get(i).getQuantity()) != 0) {
                                daoProduct.updateQuantity(listProReady.get(i).getProductID(), listProReady.get(i).getQuantity());
                            }
                        }
                        cart.changeList(listProNotReady);
                        session.setAttribute("CART", cart);
                    }
                    if (!listProNotReady.isEmpty()) {
                        request.setAttribute("MESS_BUYING", "Sorry, this product below not have enough quantity. Please delete and buy another product. Thank you !");
                    } else {
                        request.setAttribute("MESS_BUYING", "Buying successfully !");
                    }
                }
            }
            session.setAttribute("NAME_CUS", fullName);
            session.setAttribute("PHONE_CUS", phone);
            session.setAttribute("EMAIL_CUS", email);
            session.setAttribute("ADDRESS_CUS", address);
        } catch (Exception e) {
            log("Error at BuyingController: " + e.toString());
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
