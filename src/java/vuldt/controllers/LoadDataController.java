/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuldt.controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
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
public class LoadDataController extends HttpServlet {

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
            ArrayList<String> listCategory = new ArrayList<>();
            listCategory = dao.getListCategories();

            float price1, price2;
            price1 = dao.getMinPrice();
            price2 = dao.getMaxPrice();

            int numberPage = 0, sizePage = 20, numberProduct = 0;
            numberProduct = dao.getNumberProductFirst();
            numberPage = numberProduct / sizePage;
            if (numberProduct % sizePage != 0) {
                numberPage++;
            }

            ArrayList<ProductDTO> listProduct = new ArrayList<>();
            listProduct = dao.getListProductFirst();

            session.setAttribute("LIST_CATEGORY_NAME", listCategory);
            session.setAttribute("NUMBER_OF_PAGE", numberPage);
            session.setAttribute("LIST_PRODUCT", listProduct);
            session.setAttribute("PRICE1", price1);
            session.setAttribute("PRICE2", price2);
            session.setAttribute("TXT_CATEGORY", "All");
        } catch (Exception e) {
            log("Error at LoadDataController: " + e.toString());
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
