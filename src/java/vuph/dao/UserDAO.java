/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import vuph.dto.UserDTO;
import vuph.util.DBUtil;

/**
 *
 * @author VuPH
 */
public class UserDAO {

    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public UserDTO checkLogin(String username, String password) throws SQLException, ClassNotFoundException {
        UserDTO dto = null;
        try {
            con = DBUtil.getConnection();
            String sql = "select fullname, isAdmin, cateIdOfFavor "
                    + "from tblUser "
                    + "where username=? and password=?";
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                String fullname = rs.getString(1);
                boolean isAdmin = rs.getBoolean(2);
                int cateIdOfFavor = rs.getInt(3);
                String cateFavorName = "";
                if (cateIdOfFavor != 0) {
                    sql = "select name "
                            + "from tblCategory "
                            + "where categoryId=?";
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, cateIdOfFavor);
                    rs = stm.executeQuery();
                    if (rs.next()) {
                        cateFavorName = rs.getString(1);
                    }
                }
                dto = new UserDTO(username, fullname, isAdmin, cateIdOfFavor, cateFavorName);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public String getFavorDescription(int id) throws SQLException {
        String result = "";
        try {
            con = DBUtil.getConnection();
            String sql = "select description "
                    + "from tblCategory "
                    + "where categoryId=?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                result = rs.getString(1);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateFavor(String username, int cateId) {
        boolean result = false;
        try {
            con = DBUtil.getConnection();
            String sql = "update tblUser set cateIdOfFavor = ? where username = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, cateId);
            stm.setString(2, username);
            result = stm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("updateFavor: " + e);
        } finally {
            closeConnection();
        }
        return result;
    }

    public static void increaseView(int insId) {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            String sql = " exec increaseView ?";
            stm = con.prepareStatement(sql);
            stm.setEscapeProcessing(true);
            stm.setInt(1, insId);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("increaseView: " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                System.out.println("closeConnection: " + ex);
            }
        }
    }

    public boolean signUp(String username, String password, String fullname) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            con = DBUtil.getConnection();
            String sql = "insert into tblUser "
                    + "(username, password, isAdmin, fullname, cateIdOfFavor) "
                    + "values(?,?,0,?,0)";
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, fullname);
            check = stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            System.out.println("closeConnection: " + ex);
        }
    }
}
