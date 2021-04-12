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
import vuldt.daos.RecordDAO;
import vuldt.dtos.ProductDTO;
import vuldt.dtos.RecordDTO;
import vuldt.dtos.UserDTO;

/**
 *
 * @author Le Duy Tuan Vu
 */
@WebServlet(name = "DeleteProductController", urlPatterns = {"/DeleteProductController"})
public class DeleteProductController extends HttpServlet {

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
            String listProductID = "";
            if (request.getParameter("txtList") != null) {
                listProductID = (String) request.getParameter("txtList");
            }
            ArrayList<String> listDelete = new ArrayList();
            RecordDTO record = new RecordDTO();
            RecordDAO daoRecord = new RecordDAO();
            UserDTO user = new UserDTO();
            if (session.getAttribute("USER") != null) {
                user = (UserDTO) session.getAttribute("USER");
            }
            if (!listProductID.isEmpty()) {
                String arr[] = listProductID.split("-");
                for (int i = 0; i < arr.length; i++) {
                    if (!arr[i].isEmpty()) {
                        listDelete.add(arr[i]);
                        int temp = daoRecord.getNumberRecord() + 1;
                        String recordID = "record" + temp;

                        String createDate = "";
                        Calendar calender = Calendar.getInstance();
                        int year = calender.get(Calendar.YEAR);
                        int month = calender.get(Calendar.MONTH) + 1;
                        int day = calender.get(Calendar.DAY_OF_MONTH);
                        createDate = year + "-" + month + "-" + day;

                        record = new RecordDTO(recordID, createDate + " " + java.time.LocalTime.now(), "Delete product have ID is '" + arr[i] + "' on " + createDate + " at " + java.time.LocalTime.now() + " by userID is '" + user.getUserID()+"'", arr[i], user.getUserID(), true);
                        daoRecord.insertRecord(record);
                    }
                }
                for (String productID : listDelete) {
                    dao.deleteProduct(productID);
                }
                request.setAttribute("MESS_DELETE_AD", "Delete successfully !");

            } else {
                request.setAttribute("MESS_DELETE_AD", "Please mark the product you want to remove !");
            }

            // LOAD AGAINT LIST PRODUCT
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
            log("Error at DeleteProductController: " + e.toString());
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
