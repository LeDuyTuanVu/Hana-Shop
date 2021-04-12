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
import javax.naming.NamingException;
import vuldt.dtos.UserDTO;
import vuldt.utils.ConnectionDB;

/**
 *
 * @author Le Duy Tuan Vu
 */
public class UserDAO {

    Connection connect = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public UserDTO getUser(String userID, String password) throws NamingException, SQLException, ClassNotFoundException {
        UserDTO user = null;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select userID, password, fullName, phone, email, address, roleID, status from tblUsers where userID = ? and password = ?";
                pst = connect.prepareStatement(sql);
                pst.setString(1, userID);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if (rs.next()) {
                    user = new UserDTO(userID, "*******", rs.getString("fullName"), rs.getString("phone"), rs.getString("email"), rs.getString("address"), rs.getString("roleID"), rs.getBoolean("status"));
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
        return user;
    }
}
