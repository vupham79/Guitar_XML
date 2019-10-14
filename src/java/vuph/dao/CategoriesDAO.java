/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import vuph.generateObject.Categories;
import vuph.generateObject.Category;
import vuph.generateObject.Instrument;
import vuph.util.DBUtil;

/**
 *
 * @author VuPH
 */
public class CategoriesDAO implements Serializable {

    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public int getCategoryIdByName(String name) {
        String sql = "";
        int id = -1;
        try {
            con = DBUtil.getConnection();
            sql = "select categoryId from tblCategory where name = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, name);
            rs = stm.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getCategoryIdByName: " + e);
        } finally {
            closeConnection();
            return id;
        }
    }

    public Categories getAllCategories() throws SQLException {
        String sql = "";
        Categories categories = null;
        Category category = null;
        Instrument instrument = null;
        Map<Integer, Integer> counts = null;
        try {
            con = DBUtil.getConnection();
            sql = "  select ROW_NUMBER() over(order by categoryId) , count(categoryId)"
                    + "  from tblInstrument"
                    + " where isDeleted = 0"
                    + "  group by tblInstrument.categoryId";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            counts = new HashMap<>();
            while (rs.next()) {
                counts.put(rs.getInt(1), rs.getInt(2));
            }
            sql = "select tblInstrument.id, tblInstrument.name, price, url, imageUrl, "
                    + "tblStore.name, tblStore.logo, viewNo, tblCategory.name, "
                    + "tblCategory.categoryId "
                    + "from tblInstrument "
                    + "inner join tblCategory "
                    + "on tblCategory.categoryId = tblInstrument.categoryId "
                    + "inner join tblStore "
                    + "on tblStore.storeId = tblInstrument.storeId "
                    + "where isDeleted = 0 "
                    + "ORDER BY tblInstrument.categoryId";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            int insId;
            String insName;
            float insPrice;
            String insUrl;
            String insImg;
            String storeName;
            String storeLogo;
            int viewNo;
            String cateName;
            int cateId;
            categories = new Categories();
            while (rs.next()) {
                insId = rs.getInt(1);
                insName = rs.getString(2);
                insPrice = rs.getFloat(3);
                insUrl = rs.getString(4);
                insImg = rs.getString(5);
                storeName = rs.getString(6);
                storeLogo = rs.getString(7);
                viewNo = rs.getInt(8);
                cateName = rs.getString(9);
                cateId = rs.getInt(10);
                instrument = new Instrument(insName, BigDecimal.valueOf(insPrice), insImg, insUrl, BigInteger.valueOf(insId), BigInteger.valueOf(viewNo), storeLogo, storeName);
                if (category != null) {
                    if (!category.getCategoryName().equals(cateName)) {
                        category = new Category(cateName, BigInteger.valueOf(cateId), counts.get(cateId));
                        categories.getCategory().add(category);
                    }
                } else {
                    category = new Category(cateName, BigInteger.valueOf(cateId), counts.get(cateId));
                    categories.getCategory().add(category);
                }
                category.getInstrument().add(instrument);
            }
            return categories;
        } catch (Exception e) {
            System.out.println("getAllCategories: " + e);
            return null;
        } finally {
            closeConnection();
        }
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
