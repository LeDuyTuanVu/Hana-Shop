/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuldt.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vuldt.daos.ProductDAO;
import vuldt.dtos.ProductDTO;
import vuldt.dtos.UserDTO;

/**
 *
 * @author Le Duy Tuan Vu
 */
@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
public class AddProductController extends HttpServlet {

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
            if (session.getAttribute("USER") == null) {

            } else {

            }

            String txtImage = "", txtProductName = "", txtPrice = "", txtDescription = "", txtQuantity = "", txtCategory = "", txtStatus = "", txtExpiryDate = "";
            boolean check = true;
            if (request.getParameter("txtProductName") != null) {
                txtProductName = (String) request.getParameter("txtProductName");
            }
            if (request.getParameter("txtImage") != null) {
                txtImage = (String) request.getParameter("txtImage");
            }
            if (request.getParameter("txtPrice") != null) {
                txtPrice = (String) request.getParameter("txtPrice");
            }
            if (request.getParameter("txtDescription") != null) {
                txtDescription = (String) request.getParameter("txtDescription");
            }
            if (request.getParameter("txtQuantity") != null) {
                txtQuantity = (String) request.getParameter("txtQuantity");
            }
            if (request.getParameter("comboxCategory") != null) {
                txtCategory = (String) request.getParameter("comboxCategory");
            }
            if (request.getParameter("comboxStatus") != null) {
                txtStatus = (String) request.getParameter("comboxStatus");
            }
            if (request.getParameter("txtExpiryDate") != null) {
                txtExpiryDate = (String) request.getParameter("txtExpiryDate");
            }

            if (txtProductName.trim().isEmpty()) {
                check = false;
                request.setAttribute("MESS_NAME_PRO", "Name of product must not empty !");
            }
            if (txtImage.trim().isEmpty()) {
                check = false;
                request.setAttribute("MESS_IMAGE_PRO", "Image of product must not empty !");
            }
            if (txtDescription.trim().isEmpty()) {
                check = false;
                request.setAttribute("MESS_DES_PRO", "Description of product must not empty !");
            }
            if (txtPrice.trim().isEmpty()) {
                check = false;
                request.setAttribute("MESS_PRICE_PRO", "Price of product must not empty !");
            } else if (Float.parseFloat(txtPrice) <= 0) {
                check = false;
                request.setAttribute("MESS_PRICE_PRO", "Price of product must bigger than 0 !");
            }
            if (txtQuantity.trim().isEmpty()) {
                check = false;
                request.setAttribute("MESS_QUANTITY_PRO", "Quantity of product must not empty !");
            } else if (Integer.parseInt(txtQuantity) <= 0) {
                check = false;
                request.setAttribute("MESS_QUANTITY_PRO", "Quantity of product must bigger than 0!");
            }
            if (txtExpiryDate.isEmpty()) {
                check = false;
                request.setAttribute("MESS_EXPIRY_DATE_PRO", "Expiry date of product must not empty !");
            } else {
                String dateTemp = "";
                Calendar calender = Calendar.getInstance();
                int year = calender.get(Calendar.YEAR);
                int month = calender.get(Calendar.MONTH) + 1;
                int day = calender.get(Calendar.DAY_OF_MONTH);
                dateTemp = year + "-" + month + "-" + day;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date date1 = sdf.parse(dateTemp);
                Date date2 = sdf.parse(txtExpiryDate);
                if (date1.compareTo(date2) > 0) {
                    check = false;
                    request.setAttribute("MESS_EXPIRY_DATE_PRO", "Expiry date must bigger than current date !");
                }
            }

            String createDate = "";
            boolean checkAddSuccess = true;
            if (check) {
                Calendar calender = Calendar.getInstance();
                int year = calender.get(Calendar.YEAR);
                int month = calender.get(Calendar.MONTH) + 1;
                int day = calender.get(Calendar.DAY_OF_MONTH);
                createDate = year + "-" + month + "-" + day;
                int numberAllProduct = 0;
                ProductDAO dao = new ProductDAO();
                numberAllProduct = dao.getNumberAllProduct() + 1;
                String productID = "product" + numberAllProduct;
                String categoryID = "";
                categoryID = dao.getCategoryID(txtCategory);
                ProductDTO product = new ProductDTO(productID, txtProductName, txtImage, txtDescription, Float.parseFloat(txtPrice), Integer.parseInt(txtQuantity), createDate, txtExpiryDate, categoryID, Boolean.parseBoolean(txtStatus));
                if (dao.addProduct(product) != 0) {
                    request.setAttribute("MESSAGE_ADD_PRODUCT", "Add product successfully !");
                    checkAddSuccess = false;
                } else {
                    request.setAttribute("MESSAGE_ADD_PRODUCT", "Add product unsuccessfully !");
                }
            }
            if (checkAddSuccess) {
                session.setAttribute("TXT_CREATE_NAME", txtProductName);
                session.setAttribute("TXT_CREATE_IMAGE", txtImage);
                session.setAttribute("TXT_CREATE_PRICE", txtPrice);
                session.setAttribute("TXT_CREATE_DAY", createDate);
                session.setAttribute("TXT_CREATE_QUANTITY", txtQuantity);
                session.setAttribute("TXT_CREATE_DESCRIPTION", txtDescription);
                session.setAttribute("TXT_CREATE_CATEGORY", txtCategory);
                session.setAttribute("TXT_CREATE_STATUS", txtStatus);
                session.setAttribute("TXT_CREATE_EXPIRY_DATE", txtExpiryDate);
            } else {
                session.setAttribute("TXT_CREATE_NAME", "");
                session.setAttribute("TXT_CREATE_IMAGE", "");
                session.setAttribute("TXT_CREATE_PRICE", "");
                session.setAttribute("TXT_CREATE_DAY", "");
                session.setAttribute("TXT_CREATE_QUANTITY", "");
                session.setAttribute("TXT_CREATE_DESCRIPTION", "");
                session.setAttribute("TXT_CREATE_CATEGORY", "");
                session.setAttribute("TXT_CREATE_STATUS", "");
                session.setAttribute("TXT_CREATE_EXPIRY_DATE", "");
            }
        } catch (Exception e) {
            log("Error at AddProductController: " + e.toString());
        } finally {
            request.getRequestDispatcher("createProduct.jsp").forward(request, response);
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
