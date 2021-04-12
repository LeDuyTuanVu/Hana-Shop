/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuldt.controllers;

import java.io.IOException;
import java.util.ArrayList;
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
@WebServlet(name = "LoadDataAdminController", urlPatterns = {"/LoadDataAdminController"})
public class LoadDataAdminController extends HttpServlet {

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
            ArrayList<ProductDTO> list = new ArrayList();
            int endPage = 0, pageSize = 24, numOfProduct = 0, index = 0;
            numOfProduct = dao.getNumberAllProduct();
            endPage = numOfProduct / pageSize;
            if (numOfProduct % pageSize != 0) {
                endPage++;
            }
            String temp = "";
            if (request.getParameter("txtNumber") != null) {
                temp = (String) request.getParameter("txtNumber");
            }
            if (!temp.isEmpty()) {
                index = Integer.parseInt(temp);
                list = dao.getAllProduct(index);
            } else {
                list = dao.getAllProduct(1);
            }
            session.setAttribute("NUMBER_PAGE", endPage);
            session.setAttribute("LIST_ALL_PRO", list);

        } catch (Exception e) {
            log("Error at LoadDataAdminController: " + e.toString());
        } finally {
            request.getRequestDispatcher("admin.jsp").forward(request, response);
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
