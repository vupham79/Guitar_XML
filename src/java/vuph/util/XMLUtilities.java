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

    public static <T> T unmarshal(T obj, StringReader xml, String xsdPath) {
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

    public static void saveToDB(String xml, String xsd) {
        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false);
            String sql;
            PreparedStatement stm;
            ResultSet rs;
            Store store = unmarshal(new Store(), new StringReader(xml), xsd);
            // Get store id
            sql = "use Instruments select storeId from tblStore where name=?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, store.getName());
            rs = stm.executeQuery();
            int storeId = -1;
            if (rs.next()) {
                storeId = rs.getInt(1);
            }
            for (int i = 0; i < store.getCategories().getCategory().size(); i++) {
                Category category = store.getCategories().getCategory().get(i);
                // Get category id
                sql = "use Instruments select categoryId from tblCategory where name=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, category.getCategoryName());
                rs = stm.executeQuery();
                int cateId = -1;
                if (rs.next()) {
                    cateId = rs.getInt(1);
                }
                int instrumentsSize = category.getInstrument().size();
                if (instrumentsSize > 0) {
                    // Delete old instruments
                    sql = "use Instruments update tblInstrument set isDeleted=1 where storeId=? and categoryId=?";
                    stm = conn.prepareStatement(sql);
                    stm.setInt(1, storeId);
                    stm.setInt(2, cateId);
                    stm.executeUpdate();
                    // Add new instruments
                    sql = "use Instruments insert into tblInstrument(name, price, url, categoryId, storeId, imageUrl) "
                            + "values(?,?,?,?,?,?)";
                    stm = conn.prepareStatement(sql);
                    for (int j = 0; j < instrumentsSize; j++) {
                        Instrument instrument = category.getInstrument().get(j);
                        stm.setString(1, instrument.getName());
                        stm.setFloat(2, instrument.getPrice().floatValue());
                        stm.setString(3, instrument.getUrl());
                        stm.setInt(4, cateId);
                        stm.setInt(5, storeId);
                        stm.setString(6, instrument.getImageUrl());
                        stm.addBatch();
                    }
                    stm.executeBatch();
                    conn.commit();
                }
            }
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                System.out.println("saveToDB-rollback(): " + ex);
            }
            System.out.println("saveToDB: " + e);
        }
    }
}
