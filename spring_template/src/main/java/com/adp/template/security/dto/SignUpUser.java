package com.adp.template.security.dto;

import java.util.HashSet;
import java.util.Set;

public class SignUpUser {
    private String userName;
    private String eMail;
    private String password;
    private String code;

    private Set<String>roles=new HashSet<>();

    public SignUpUser() {
    }

    public SignUpUser(String userName, String eMail, String password, String code) {
        this.userName = userName;
        this.eMail = eMail;
        this.password = password;
        this.code = code;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<String> getRoles() {
        return roles;
    }

    public void setRoles(Set<String> roles) {
        this.roles = roles;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
