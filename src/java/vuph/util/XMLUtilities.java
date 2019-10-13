/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.util;

import java.io.Serializable;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.xml.XMLConstants;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import org.xml.sax.SAXException;
import vuph.generateObject.Category;
import vuph.generateObject.Instrument;
import vuph.generateObject.Store;

/**
 *
 * @author VuPH
 */
public class XMLUtilities implements Serializable {

    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    
    public <T> T unmarshal(T obj, StringReader xml, String xsdPath) {
        try {
            SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            Schema schema = factory.newSchema(new StreamSource(xsdPath));
            JAXBContext jc = JAXBContext.newInstance(obj.getClass());
            Unmarshaller unmarshaller = jc.createUnmarshaller();
            unmarshaller.setSchema(schema);
            T t = (T) unmarshaller.unmarshal(xml);
            System.out.println("Validated");
            return t;
        } catch (JAXBException | SAXException ex) {
            System.out.println("\nERROR validate-----------------------------");
            System.out.println("validateXML: " + ex);
            return null;
        }
    }

    public void saveToDB(String xml, String xsd) {
        try {
            con = DBUtil.getConnection();
            con.setAutoCommit(false);
            String sql;
            Store store = unmarshal(new Store(), new StringReader(xml), xsd);
            // Get store id
            sql = "select storeId from tblStore where name=?";
            stm = con.prepareStatement(sql);
            stm.setString(1, store.getName());
            rs = stm.executeQuery();
            int storeId = -1;
            if (rs.next()) {
                storeId = rs.getInt(1);
            }
            for (int i = 0; i < store.getCategories().getCategory().size(); i++) {
                Category category = store.getCategories().getCategory().get(i);
                // Get category id
                sql = "select categoryId from tblCategory where name=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, category.getCategoryName());
                rs = stm.executeQuery();
                int cateId = -1;
                if (rs.next()) {
                    cateId = rs.getInt(1);
                }
                int instrumentsSize = category.getInstrument().size();
                if (instrumentsSize > 0) {
                    // Delete old instruments
                    sql = "update tblInstrument set isDeleted=1 where storeId=? and categoryId=?";
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, storeId);
                    stm.setInt(2, cateId);
                    stm.executeUpdate();
                    // Add new instruments
                    sql = "insert into tblInstrument(name, price, url, categoryId, storeId, imageUrl, viewNo, isDeleted) "
                            + "values(?,?,?,?,?,?,?,?)";
                    stm = con.prepareStatement(sql);
                    for (int j = 0; j < instrumentsSize; j++) {
                        Instrument instrument = category.getInstrument().get(j);
                        stm.setString(1, instrument.getName());
                        stm.setFloat(2, instrument.getPrice().floatValue());
                        stm.setString(3, instrument.getUrl());
                        stm.setInt(4, cateId);
                        stm.setInt(5, storeId);
                        stm.setString(6, instrument.getImageUrl());
                        stm.setInt(7, 0);
                        stm.setBoolean(8, false);
                        stm.addBatch();
                    }
                    stm.executeBatch();
                    con.commit();
                }
            }
        } catch (SQLException e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                System.out.println("saveToDB-rollback(): " + ex);
            }
            System.out.println("saveToDB: " + e);
        } finally {
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
