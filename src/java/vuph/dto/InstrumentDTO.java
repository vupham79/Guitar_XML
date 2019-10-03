/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.dto;

import java.io.Serializable;

/**
 *
 * @author VuPH
 */
public class GuitarDTO implements Serializable {
    private String brand;
    private String name;
    private String price;
    private String url;
    private String store;
    private boolean status;

    public GuitarDTO() {
    }

    public GuitarDTO(String brand, String name, String price, String url, String store, boolean status) {
        this.brand = brand;
        this.name = name;
        this.price = price;
        this.url = url;
        this.store = store;
        this.status = status;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
