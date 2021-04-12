package vuldt.controllers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
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
@WebServlet(urlPatterns = {"/LoadDataUpdateController"})
public class LoadDataUpdateController extends HttpServlet {

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
            String productID = "";
            if (request.getParameter("txtProductID") != null) {
                productID = (String) request.getParameter("txtProductID");
            }
            if (!productID.isEmpty()) {
                ProductDTO product = new ProductDTO();
                product = dao.getProductByID(productID);
                session.setAttribute("TXT_UPDATE_NAME", product.getProductName());
                session.setAttribute("TXT_UPDATE_IMAGE", product.getImage());
                session.setAttribute("TXT_UPDATE_DESCRIPTION", product.getDescription());
                session.setAttribute("TXT_UPDATE_PRICE", product.getPrice());
                session.setAttribute("TXT_UPDATE_QUANTITY", product.getQuantity());
                session.setAttribute("TXT_UPDATE_STATUS", product.isStatus());
                session.setAttribute("TXT_UPDATE_DAY", product.getCreateDate());
                session.setAttribute("TXT_UPDATE_ID_PRODUCT", productID);
                session.setAttribute("TXT_UPDATE_EXPIRY_DATE", product.getExpiryDate());
                String categoryName = dao.getCategoryName(product.getCategoryID());
                session.setAttribute("TXT_UPDATE_CATEGORY", categoryName);
                session.setAttribute("TXT_UPDATE_STATUS", product.isStatus());
            }
        } catch (Exception e) {
            log("Error at LoadDataUpdateController: " + e.toString());
        } finally {
            request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
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
