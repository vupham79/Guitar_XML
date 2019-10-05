/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author VuPH
 */
public class DBUtil {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Instruments", "sa", "123456");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
