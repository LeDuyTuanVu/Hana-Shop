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
import vuldt.dtos.RecordDTO;
import vuldt.utils.ConnectionDB;

/**
 *
 * @author Le Duy Tuan Vu
 */
public class RecordDAO {

    Connection connect = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public int insertRecord(RecordDTO record) throws NamingException, SQLException, ClassNotFoundException {
        int result = 0;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "insert into tblRecords(recordID, date, note, productID, userID, status) values(?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = connect.prepareStatement(sql);
                pst.setString(1, record.getRecordID());
                pst.setString(2, record.getDate());
                pst.setString(3, record.getNote());
                pst.setString(4, record.getProductID());
                pst.setString(5, record.getUserID());
                pst.setBoolean(6, record.isStatus());
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

    public int getNumberRecord() throws NamingException, SQLException, ClassNotFoundException {
        int num = 0;
        try {
            connect = ConnectionDB.getConnection();
            if (connect != null) {
                String sql = "select count(recordID) as num from tblRecords";
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
}
