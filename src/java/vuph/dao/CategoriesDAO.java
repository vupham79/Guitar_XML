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
import vuph.generateObject.Categories;
import vuph.generateObject.Category;
import vuph.generateObject.Instrument;
import vuph.util.DBUtil;

/**
 *
 * @author VuPH
 */
public class CategoriesDAO implements Serializable {

    public static Categories getAllCategories() throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "";
        Categories categories = null;
        Category category = null;
        Instrument instrument = null;
        try {
            con = DBUtil.getConnection();
            sql = "select tblInstrument.id, tblInstrument.name, price, url, imageUrl, "
                    + "tblStore.name, tblStore.logo, viewNo, tblCategory.name, "
                    + "tblCategory.categoryId "
                    + "from tblInstrument "
                    + "inner join tblCategory "
                    + "on tblCategory.categoryId = tblInstrument.categoryId "
                    + "inner join tblStore "
                    + "on tblStore.storeId = tblInstrument.storeId "
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
                        categories.getCategory().add(category);
                        category = new Category(cateName, BigInteger.valueOf(cateId));
                    }
                } else {
                    category = new Category(cateName, BigInteger.valueOf(cateId));
                }
                category.getInstrument().add(instrument);
            }
            return categories;
        } catch (Exception e) {
            System.out.println("getAllCategories: " + e);
            return null;
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                System.out.println("Connection: " + e);
            }
        }
    }
}
