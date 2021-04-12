/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuldt.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import vuldt.dtos.OrderDTO;
import vuldt.utils.ConnectionDB;

/**
 *
 * @author Le Duy Tuan Vu
 */
public class OrderDAO {

    Connection connect = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public int insertOrder(String orderID, float total, String date, String phone, String email, String address, String fullName, String userID) throws NamingException, SQLException, ClassNotFoundException {
        int result = 0;

        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "insert into tblOrders(orderID, fullName, total, date, phone, email, address, userID, status) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = connect.prepareStatement(sql);
                pst.setString(1, orderID);
                pst.setString(2, fullName);
                pst.setFloat(3, total);
                pst.setString(4, date);
                pst.setString(5, phone);
                pst.setString(6, email);
                pst.setString(7, address);
                pst.setString(8, userID);
                pst.setInt(9, 1);
                result = pst.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return result;
    }

    public int insertOrderDetail(String productID, String orderID, int quantity) throws NamingException, SQLException, ClassNotFoundException {
        int result = 0;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "insert into tblOrderDetails(productID, orderID, quantity, status) values(?, ?, ?, ?)";
                PreparedStatement pst = connect.prepareStatement(sql);
                pst.setString(1, productID);
                pst.setString(2, orderID);
                pst.setInt(3, quantity);
                pst.setInt(4, 1);
                result = pst.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return result;
    }

    public int getNumberOrder() throws NamingException, SQLException, ClassNotFoundException {
        int result = -1;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select COUNT(orderID) number from tblOrders";
                PreparedStatement pst = connect.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("number");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return result;
    }

    public ArrayList<OrderDTO> getListOrderByName(String nameProduct, String userID, String date) throws NamingException, SQLException, ClassNotFoundException {
        ArrayList<OrderDTO> list = new ArrayList<>();
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "";
                if (date.isEmpty()) {
                    sql = "select P.productName, OD.quantity, O.total, P.image, P.price, O.date\n"
                            + "from tblOrders O, tblOrderDetails OD, tblProducts P, tblUsers U\n"
                            + "where U.userID = O.userID and O.orderID = OD.orderID and OD.productID = P.productID and P.productName like ? and U.userID = ?";
                    PreparedStatement pst = connect.prepareStatement(sql);
                    pst.setString(1, "%" + nameProduct + "%");
                    pst.setString(2, userID);
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        OrderDTO order = new OrderDTO(rs.getString("productName"), rs.getInt("quantity"), rs.getFloat("total"), rs.getString("image"), rs.getFloat("price"), rs.getString("date"));
                        list.add(order);
                    }
                } else {
                    sql = "select P.productName, OD.quantity, O.total, P.image, P.price, O.date\n"
                            + "from tblOrders O, tblOrderDetails OD, tblProducts P, tblUsers U\n"
                            + "where U.userID = O.userID and O.orderID = OD.orderID and OD.productID = P.productID and P.productName like ? and O.date = ? and U.userID = ?";
                    PreparedStatement pst = connect.prepareStatement(sql);
                    pst.setString(1, "%" + nameProduct + "%");
                    pst.setString(2, date);
                    pst.setString(3, userID);
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        OrderDTO order = new OrderDTO(rs.getString("productName"), rs.getInt("quantity"), rs.getFloat("total"), rs.getString("image"), rs.getFloat("price"), rs.getString("date"));
                        list.add(order);
                    }
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return list;
    }

    public ArrayList<OrderDTO> getAllOrder(String userID) throws NamingException, SQLException, ClassNotFoundException {
        ArrayList<OrderDTO> list = new ArrayList<>();
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select ROW_NUMBER() over (order by O.date desc) as sst, P.productName, OD.quantity, O.total, P.image, P.price, O.date\n"
                        + "from tblOrders O, tblOrderDetails OD, tblProducts P, tblUsers U\n"
                        + "where U.userID = O.userID and O.orderID = OD.orderID and OD.productID = P.productID and U.userID = ?";
                PreparedStatement pst = connect.prepareStatement(sql);
                pst.setString(1, userID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String nameProduct = rs.getString("productName");
                    int quantity = rs.getInt("quantity");
                    float total = rs.getFloat("total");
                    String image = rs.getString("image");
                    float price = rs.getFloat("price");
                    String date = rs.getString("date");
                    OrderDTO order = new OrderDTO(nameProduct, quantity, total, image, price, date);
                    list.add(order);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return list;
    }
}
