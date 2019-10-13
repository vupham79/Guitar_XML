package vuph.dto;

import java.io.Serializable;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author VuPH
 */
public class UserDTO implements Serializable {

    private String username;
    private String password;
    private String fullname;
    private String cateFavorName;
    private int cateIdOfFavor;
    private boolean isAdmin;

    public UserDTO() {
    }

    public UserDTO(String username, String fullname, boolean isAdmin, int cateIdOfFavor, String cateFavorName) {
        this.username = username;
        this.fullname = fullname;
        this.isAdmin = isAdmin;
        this.cateIdOfFavor = cateIdOfFavor;
        this.cateFavorName = cateFavorName;
    }

    public String getCateFavorName() {
        return cateFavorName;
    }

    public void setCateFavorName(String cateFavorName) {
        this.cateFavorName = cateFavorName;
    }

    public int getCateIdOfFavor() {
        return cateIdOfFavor;
    }

    public void setCateIdOfFavor(int cateIdOfFavor) {
        this.cateIdOfFavor = cateIdOfFavor;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
}
