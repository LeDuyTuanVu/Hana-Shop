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
import java.util.Calendar;
import javax.naming.NamingException;
import vuldt.dtos.ProductDTO;
import vuldt.utils.ConnectionDB;

/**
 *
 * @author Le Duy Tuan Vu
 */
public class ProductDAO {

    Connection connect = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public ArrayList<String> getListCategories() throws NamingException, SQLException, ClassNotFoundException {
        ArrayList<String> list = new ArrayList<>();
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select categoryName from tblCategories where status = 1";
                pst = connect.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    list.add(rs.getString("categoryName"));
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

    public ArrayList<ProductDTO> getListProductFirst() throws NamingException, SQLException, ClassNotFoundException {
        ArrayList<ProductDTO> list = new ArrayList<>();
        String currentDate = "";
        Calendar calender = Calendar.getInstance();
        int year = calender.get(Calendar.YEAR);
        int month = calender.get(Calendar.MONTH) + 1;
        int day = calender.get(Calendar.DAY_OF_MONTH);
        currentDate = year + "-" + month + "-" + day;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select productID, productName, image, description, price, createDate, quantity, categoryID, expiryDate, status from (select ROW_NUMBER() over (order by createDate desc) as sst, productID, productName, image, description, price, createDate, quantity, categoryID, expiryDate, status from tblProducts where quantity > 0 and status = 1 and expiryDate > ?) as X where sst between 1*20-19 and 1*20";
                pst = connect.prepareStatement(sql);
                pst.setString(1, currentDate);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String expiryDate = rs.getString("expiryDate");
                    String categoryID = rs.getString("categoryID");
                    boolean status = true;
                    ProductDTO product = new ProductDTO(productID, productName, image, description, price, quantity, createDate, expiryDate, categoryID, status);
                    list.add(product);
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

    public int getNumberProductFirst() throws NamingException, SQLException, ClassNotFoundException {
        int num = 0;
        String currentDate = "";
        Calendar calender = Calendar.getInstance();
        int year = calender.get(Calendar.YEAR);
        int month = calender.get(Calendar.MONTH) + 1;
        int day = calender.get(Calendar.DAY_OF_MONTH);
        currentDate = year + "-" + month + "-" + day;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select count(productID) as num from tblProducts where status = 1 and quantity > 0 and expiryDate > ?";
                pst = connect.prepareStatement(sql);
                pst.setString(1, currentDate);
                rs = pst.executeQuery();
                if (rs.next()) {
                    num = rs.getInt("num");
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
        return num;
    }

    public String getCategoryID(String nameCategory) throws NamingException, SQLException, ClassNotFoundException {
        String categoryID = null;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select categoryID from tblCategories where categoryName = ?";
                pst = connect.prepareStatement(sql);
                pst.setString(1, nameCategory);
                rs = pst.executeQuery();
                if (rs.next()) {
                    categoryID = rs.getString("categoryID");
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
        return categoryID;
    }

    public String getCategoryName(String categoryID) throws NamingException, SQLException, ClassNotFoundException {
        String categoryName = null;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select categoryName from tblCategories where categoryID = ?";
                pst = connect.prepareStatement(sql);
                pst.setString(1, categoryID);
                rs = pst.executeQuery();
                if (rs.next()) {
                    categoryName = rs.getString("categoryName");
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
        return categoryName;
    }

    public float getMinPrice() throws NamingException, SQLException, ClassNotFoundException {
        float min = 0;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select min(price) as min from tblProducts";
                pst = connect.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    min = rs.getFloat("min");
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
        return min;
    }

    public float getMaxPrice() throws NamingException, SQLException, ClassNotFoundException {
        float max = 0;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select max(price) as max from tblProducts";
                pst = connect.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    max = rs.getFloat("max");
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
        return max;
    }

    public int getNumberProduct(String sqlNumProduct) throws NamingException, SQLException, ClassNotFoundException {
        int num = 0;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = sqlNumProduct;
                pst = connect.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    num = rs.getInt("num");
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
        return num;
    }

    public int getQuantityProduct(String productID) throws NamingException, SQLException, ClassNotFoundException {
        int num = 0;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select quantity from tblProducts where productID = ?";
                pst = connect.prepareStatement(sql);
                pst.setString(1, productID);
                rs = pst.executeQuery();
                if (rs.next()) {
                    num = rs.getInt("quantity");
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
        return num;
    }

    public ArrayList<ProductDTO> getListProduct(int index, String sqlListProduct) throws NamingException, SQLException, ClassNotFoundException {
        ArrayList<ProductDTO> list = new ArrayList<>();
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = sqlListProduct + " where sst between ?*20-19 and ?*20";
                pst = connect.prepareStatement(sql);
                pst.setInt(1, index);
                pst.setInt(2, index);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String expiryDate = rs.getString("expiryDate");
                    String categoryID = rs.getString("categoryID");
                    boolean status = true;
                    ProductDTO product = new ProductDTO(productID, productName, image, description, price, quantity, createDate, expiryDate, categoryID, status);
                    list.add(product);
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

    public ProductDTO getProductByID(String productID) throws NamingException, SQLException, ClassNotFoundException {
        ProductDTO product = null;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select productID, productName, image, description, price, createDate, quantity, categoryID, expiryDate, status from tblProducts where productID = ?";
                pst = connect.prepareStatement(sql);
                pst.setString(1, productID);
                rs = pst.executeQuery();
                if (rs.next()) {
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String expiryDate = rs.getString("expiryDate");
                    String categoryID = rs.getString("categoryID");
                    boolean status = rs.getBoolean("status");
                    product = new ProductDTO(productID, productName, image, description, price, quantity, createDate, expiryDate, categoryID, status);
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
        return product;
    }

    public int getNumberAllProduct() throws NamingException, SQLException, ClassNotFoundException {
        int num = 0;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select count(productID) as num from tblProducts";
                pst = connect.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    num = rs.getInt("num");
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
        return num;
    }

    public ArrayList<ProductDTO> getAllProduct() throws NamingException, SQLException, ClassNotFoundException {
        ArrayList<ProductDTO> list = new ArrayList<>();
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select productID, productName, image, description, price, createDate, quantity, categoryID, expiryDate, status from tblProducts order by createDate desc";
                pst = connect.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String expiryDate = rs.getString("expiryDate");
                    String categoryID = rs.getString("categoryID");
                    boolean status = true;
                    ProductDTO product = new ProductDTO(productID, productName, image, description, price, quantity, createDate, expiryDate, categoryID, status);
                    list.add(product);
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

    public ArrayList<ProductDTO> getAllProduct(int index) throws NamingException, SQLException, ClassNotFoundException {
        ArrayList<ProductDTO> list = new ArrayList<>();
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select productID, productName, image, description, price, createDate, quantity, categoryID, expiryDate, status from (select ROW_NUMBER() over (order by createDate desc) as sst,\n"
                        + "productID, productName, image, description, price, createDate, quantity, categoryID, expiryDate, status from tblProducts) as x where sst between ?*24-23 and ?*24";
                pst = connect.prepareStatement(sql);
                pst.setInt(1, index);
                pst.setInt(2, index);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String expiryDate = rs.getString("expiryDate");
                    String categoryID = rs.getString("categoryID");
                    boolean status = rs.getBoolean("status");
                    ProductDTO product = new ProductDTO(productID, productName, image, description, price, quantity, createDate, expiryDate, categoryID, status);
                    list.add(product);
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

    public int addProduct(ProductDTO product) throws NamingException, SQLException, ClassNotFoundException {
        int result = 0;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "insert into tblProducts(productID, productName, image, description, price, createDate, expiryDate, quantity, categoryID, status)\n"
                        + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = connect.prepareStatement(sql);
                pst.setString(1, product.getProductID());
                pst.setString(2, product.getProductName());
                pst.setString(3, product.getImage());
                pst.setString(4, product.getDescription());
                pst.setFloat(5, product.getPrice());
                pst.setString(6, product.getCreateDate());
                pst.setString(7, product.getExpiryDate());
                pst.setInt(8, product.getQuantity());
                pst.setString(9, product.getCategoryID());
                pst.setBoolean(10, product.isStatus());
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

    public int deleteProduct(String productID) throws NamingException, SQLException, ClassNotFoundException {
        int result = 0;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "update tblProducts set status = ? where productID = ?";
                PreparedStatement pst = connect.prepareStatement(sql);
                pst.setString(1, "false");
                pst.setString(2, productID);
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

    public int updateProduct(ProductDTO product) throws NamingException, SQLException, ClassNotFoundException {
        int result = 0;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "update tblProducts set productName = ?, image = ?, description = ?, price = ?, quantity = ?, categoryID = ?, status = ?, expiryDate = ? where productID = ?";
                PreparedStatement pst = connect.prepareStatement(sql);
                pst.setString(1, product.getProductName());
                pst.setString(2, product.getImage());
                pst.setString(3, product.getDescription());
                pst.setFloat(4, product.getPrice());
                pst.setInt(5, product.getQuantity());
                pst.setString(6, product.getCategoryID());
                pst.setBoolean(7, product.isStatus());
                pst.setString(8, product.getExpiryDate());
                pst.setString(9, product.getProductID());
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

    public int updateQuantity(String productID, int quantity) throws NamingException, SQLException, ClassNotFoundException {
        int result = 0;
        int temp = getQuantityProduct(productID);
        int newQuantity = temp - quantity;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "update tblProducts set quantity = ? where productID = ?";
                pst = connect.prepareStatement(sql);
                pst.setInt(1, newQuantity);
                pst.setString(2, productID);
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
}
