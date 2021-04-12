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

/**
 *
 * @author Le Duy Tuan Vu
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final static String ERROR = "invalid.html";
    private final static String LOGIN_PAGE = "login.jsp";
    private final static String LOGIN = "LoginController";
    private final static String SEARCH = "SearchController";
    private final static String SHOPPING = "ShoppingController";
    private final static String LOGOUT = "LogoutController";
    private final static String CART_PAGE = "cart.jsp";
    private final static String PAGE = "LoadDataAdminController";
    private final static String CREATE_PAGE = "createProduct.jsp";
    private final static String PREVIEW = "PreviewController";
    private final static String ADD_PRODUCT = "AddProductController";
    private final static String LOAD_DATA_UPDATE = "LoadDataUpdateController";
    private final static String LOAD = "LoadDataAdminController";
    private final static String UPDATE = "UpdateController";
    private final static String DELETE = "DeleteController";
    private final static String HOME = "LoadDataController";
    private final static String BUYING = "BuyingController";
    private final static String GET_INFOR = "UseProfileController";
    private final static String HISTORY = "HistoryController";
    private final static String SEARCH_ORDER = "SearchOrderController";
    private final static String DELETE_PRODUCT = "DeleteProductController";
    private final static String ADD_QUANTITY = "AddQuantityController";
    private final static String MINUS_QUANTITY = "MinusQuantityController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String action = request.getParameter("btnAction");
            if (action.equals("login page")) {
                url = LOGIN_PAGE;
            } else if (action.equals("SIGN IN")) {
                url = LOGIN;
            } else if (action.equals("SEARCH")) {
                url = SEARCH;
            } else if (action.equals("logout")) {
                url = LOGOUT;
            } else if (action.equals("ADD")) {
                url = SHOPPING;
            } else if (action.equals("all products")) {
                url = HOME;
            } else if (action.equals("cart page")) {
                url = CART_PAGE;
            } else if (action.equals("DELETE")) {
                url = DELETE;
            } else if (action.equals("use")) {
                url = GET_INFOR;
            } else if (action.equals("BUYING NOW")) {
                url = BUYING;
            } else if (action.equals("history")) {
                url = HISTORY;
            } else if (action.equals("SEARCH ORDER")) {
                url = SEARCH_ORDER;
            } else if (action.equals("NEW PRODUCT")) {
                session.setAttribute("CONTROLLER", "CREATE");
                url = CREATE_PAGE;
            } else if (action.equals("PREVIEW")) {
                url = PREVIEW;
            } else if (action.equals("CREATE PRODUCT")) {
                url = ADD_PRODUCT;
            } else if (action.equals("UPDATE")) {
                session.setAttribute("CONTROLLER", "UPDATE");
                url = LOAD_DATA_UPDATE;
            } else if (action.equals("DELETE MARK")) {
                url = DELETE_PRODUCT;
            } else if (action.equals("PAGE")) {
                url = PAGE;
            } else if (action.equals("ALL PRODUCT")) {
                url = LOAD;
            } else if (action.equals("them")) {
                url = ADD_QUANTITY;
            } else if (action.equals("giam")) {
                url = MINUS_QUANTITY;
            } else if (action.equals("UPDATE PRODUCT")) {
                url = UPDATE;
            }
            session.setAttribute("WELLCOME", null);
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
