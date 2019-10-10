
package vuph.generateObject;

import java.math.BigDecimal;
import java.math.BigInteger;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="name">
 *           &lt;simpleType>
 *             &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *               &lt;minLength value="1"/>
 *             &lt;/restriction>
 *           &lt;/simpleType>
 *         &lt;/element>
 *         &lt;element name="price" type="{http://www.w3.org/2001/XMLSchema}decimal"/>
 *         &lt;element name="imageUrl" type="{http://www.w3.org/2001/XMLSchema}anyURI"/>
 *         &lt;element name="url" type="{http://www.w3.org/2001/XMLSchema}anyURI"/>
 *       &lt;/sequence>
 *       &lt;attribute name="id" type="{http://www.w3.org/2001/XMLSchema}positiveInteger" />
 *       &lt;attribute name="viewNo" type="{http://www.w3.org/2001/XMLSchema}positiveInteger" />
 *       &lt;attribute name="storeLogo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="storeName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "name",
    "price",
    "imageUrl",
    "url"
})
@XmlRootElement(name = "instrument", namespace = "http://vuph.vn/schema/instrument")
public class Instrument {

    @XmlElement(namespace = "http://vuph.vn/schema/instrument", required = true)
    protected String name;
    @XmlElement(namespace = "http://vuph.vn/schema/instrument", required = true, defaultValue = "0")
    protected BigDecimal price;
    @XmlElement(namespace = "http://vuph.vn/schema/instrument", required = true)
    @XmlSchemaType(name = "anyURI")
    protected String imageUrl;
    @XmlElement(namespace = "http://vuph.vn/schema/instrument", required = true)
    @XmlSchemaType(name = "anyURI")
    protected String url;
    @XmlAttribute(name = "id")
    @XmlSchemaType(name = "positiveInteger")
    protected BigInteger id;
    @XmlAttribute(name = "viewNo")
    @XmlSchemaType(name = "positiveInteger")
    protected BigInteger viewNo;
    @XmlAttribute(name = "storeLogo")
    protected String storeLogo;
    @XmlAttribute(name = "storeName")
    protected String storeName;

    public Instrument(String name, BigDecimal price, String imageUrl, String url, BigInteger id, BigInteger viewNo, String storeLogo, String storeName) {
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
        this.url = url;
        this.id = id;
        this.viewNo = viewNo;
        this.storeLogo = storeLogo;
        this.storeName = storeName;
    }

    public Instrument() {
    }

    /**
     * Gets the value of the name property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the value of the name property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setName(String value) {
        this.name = value;
    }

    /**
     * Gets the value of the price property.
     * 
     * @return
     *     possible object is
     *     {@link BigDecimal }
     *     
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * Sets the value of the price property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigDecimal }
     *     
     */
    public void setPrice(BigDecimal value) {
        this.price = value;
    }

    /**
     * Gets the value of the imageUrl property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getImageUrl() {
        return imageUrl;
    }

    /**
     * Sets the value of the imageUrl property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setImageUrl(String value) {
        this.imageUrl = value;
    }

    /**
     * Gets the value of the url property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUrl() {
        return url;
    }

    /**
     * Sets the value of the url property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUrl(String value) {
        this.url = value;
    }

    /**
     * Gets the value of the id property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getId() {
        return id;
    }

    /**
     * Sets the value of the id property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setId(BigInteger value) {
        this.id = value;
    }

    /**
     * Gets the value of the viewNo property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getViewNo() {
        return viewNo;
    }

    /**
     * Sets the value of the viewNo property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setViewNo(BigInteger value) {
        this.viewNo = value;
    }

    /**
     * Gets the value of the storeLogo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStoreLogo() {
        return storeLogo;
    }

    /**
     * Sets the value of the storeLogo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStoreLogo(String value) {
        this.storeLogo = value;
    }

    /**
     * Gets the value of the storeName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStoreName() {
        return storeName;
    }

    /**
     * Sets the value of the storeName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStoreName(String value) {
        this.storeName = value;
    }

}
