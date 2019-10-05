/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import vuph.generateObject.Categories;
import vuph.generateObject.Category;
import vuph.generateObject.Instrument;
import vuph.util.DBUtil;

/**
 *
 * @author VuPH
 */
public class CategoriesDAO implements Serializable {

    public static void saveCrawlDataToDB(Categories categories) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "";
        boolean flag = true;
        try {
            con = DBUtil.getConnection();
            // Transaction
            // Get Category ID

            String name;
            for (Category category : categories.getCategory()) {
                sql = "SELECT id FROM tblCategory WHERE name=?";
                stm = con.prepareStatement(sql);
                name = category.getCategoryName();
                stm.setString(1, name);
                rs = stm.executeQuery();
                if (rs.next()) {
                    for (Instrument instrument : category.getInstrument()) {
                        // Insert to DB
                        sql = "INSERT INTO tblInstrument(name,price,url,categoryId,storeName,storeLogo) values(?,?,?,?,?,?)";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, instrument.getName());
                        stm.setBigDecimal(2, instrument.getPrice());
//                        stm.setString(3, instrument.getUrl());
                        flag = stm.executeUpdate() > 0;
                    }
                }
            }
//            [name]
//      ,[price]
//      ,[url]
//      ,[categoryId]
//      ,[storeName]
//      ,[storeLogo
        } catch (Exception e) {
            con.rollback();
            System.out.println("saveCrawlDataToDB: " + e);
        } finally {
            con.close();
        }
    }
}
