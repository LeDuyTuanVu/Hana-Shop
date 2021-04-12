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
import vuldt.daos.ProductDAO;
import vuldt.dtos.ProductDTO;

/**
 *
 * @author Le Duy Tuan Vu
 */
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

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
            ProductDAO dao = new ProductDAO();

            String txtSearch = "", txtCategory = "", categoryID = "";
            if (request.getParameter("txtSearch") != null) {
                txtSearch = (String) request.getParameter("txtSearch");
            }

            boolean check = true;
            float price1 = 0, price2 = 0;
            String temp1 = "", temp2 = "";
            if (request.getParameter("txtPrice1") != null) {
                temp1 = (String) request.getParameter("txtPrice1");
            }
            if (request.getParameter("txtPrice2") != null) {
                temp2 = (String) request.getParameter("txtPrice2");
            }
            if (!temp1.isEmpty()) {
                price1 = Float.parseFloat(temp1);
                if (price1 < 0) {
                    check = false;
                    request.setAttribute("MESSAGE_PRICE", "PRICE MUST BIGGER THAN 0 !");
                }
            } else {
                price1 = dao.getMinPrice();
            }
            if (!temp2.isEmpty()) {
                price2 = Float.parseFloat(temp2);
                if (price2 < 0) {
                    check = false;
                    request.setAttribute("MESSAGE_PRICE", "PRICE MUST BIGGER THAN 0 !");
                } else if (price2 <= price1) {
                    check = false;
                    request.setAttribute("MESSAGE_PRICE", "SECOND PRICE MUST BIGGER THAN FIRST PRICE !");
                }
            } else {
                price2 = dao.getMaxPrice();
            }

            if (request.getParameter("txtCategory") != null) {
                txtCategory = (String) request.getParameter("txtCategory");
                categoryID = dao.getCategoryID(txtCategory);
            }

            ArrayList<ProductDTO> listProduct = new ArrayList<>();
            int numberPage = 0, sizePage = 20, numberProduct = 0, index = 0;
            String sqlListProduct = "", sqlNumberProduct = "";
            String currentDate = "";
            Calendar calender = Calendar.getInstance();
            int year = calender.get(Calendar.YEAR);
            int month = calender.get(Calendar.MONTH) + 1;
            int day = calender.get(Calendar.DAY_OF_MONTH);
            currentDate = year + "-" + month + "-" + day;
            if (check) {
                if (txtCategory.equals("All")) {
                    sqlListProduct = "select productID, productName, image, description, price, createDate, quantity, categoryID, expiryDate, status from (select ROW_NUMBER() over (order by createDate desc) as sst, productID, productName, image, "
                            + "description, price, createDate, quantity, categoryID, expiryDate, status from tblProducts where quantity > 0 and expiryDate > '" + currentDate + "' and status = 1 and productName like '%" + txtSearch + "%' and price between " + price1 + " and " + price2 + ") as x";
                    sqlNumberProduct = "select count(productID) as num from tblProducts where status = 1 and quantity > 0 and expiryDate > '" + currentDate + "' and price between " + price1 + " and " + price2 + "and productName like '%" + txtSearch + "%'";
                } else {
                    sqlListProduct = "select productID, productName, image, description, price, createDate, quantity, categoryID, expiryDate, status from (select ROW_NUMBER() over (order by createDate desc) as sst, productID, productName, image, "
                            + "description, price, createDate, quantity, categoryID, expiryDate, status from tblProducts where quantity > 0 and expiryDate > '" + currentDate + "' and status = 1 and categoryID = '" + categoryID + "' and productName like '%" + txtSearch + "%' and price between " + price1 + " and " + price2 + ") as x";
                    sqlNumberProduct = "select count(productID) as num from tblProducts where status = 1 and expiryDate > '" + currentDate + "' and quantity > 0 and categoryID = '" + categoryID + "' and price between " + price1 + " and " + price2 + "and productName like '%" + txtSearch + "%'";
                }
                numberProduct = dao.getNumberProduct(sqlNumberProduct);
                numberPage = numberProduct / sizePage;
                if (numberProduct % sizePage != 0) {
                    numberPage++;
                }
                if (request.getParameter("txtNum") == null) {
                    listProduct = dao.getListProduct(1, sqlListProduct);
                } else {
                    index = Integer.parseInt((String) request.getParameter("txtNum"));
                    listProduct = dao.getListProduct(index, sqlListProduct);
                }
                session.setAttribute("NUMBER_OF_PAGE", numberPage);
                session.setAttribute("LIST_PRODUCT", listProduct);
            }
            session.setAttribute("TXT_SEARCH", txtSearch);
            session.setAttribute("TXT_CATEGORY", txtCategory);
            session.setAttribute("PRICE1", price1);
            session.setAttribute("PRICE2", price2);
        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
        } finally {
            request.getRequestDispatcher("home.jsp").forward(request, response);
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
