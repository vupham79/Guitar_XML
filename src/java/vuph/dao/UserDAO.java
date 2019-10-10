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
    public UserDTO checkLogin(String username, String password) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null; 
        UserDTO dto = null; 
        try {
            con = DBUtil.getConnection(); 
            String sql = "use Instruments "
                    + "select fullname, isAdmin from tblUser where username=? and password=?";
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                String fullname = rs.getString("fullname");
                boolean isAdmin = rs.getBoolean("isAdmin");
                dto = new UserDTO(username, fullname, isAdmin);
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return dto;
    }
}
