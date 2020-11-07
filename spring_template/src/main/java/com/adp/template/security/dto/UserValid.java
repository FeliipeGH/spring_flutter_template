package com.adp.template.security.dto;

public class UserValid {
    private String email;
    private String user;

    public UserValid() {
    }

    public UserValid(String email, String user) {
        this.email = email;
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
}