package com.adp.template.security.dto;

public class EmailRecoverAccount {
    private String email;

    public EmailRecoverAccount() {
    }

    public EmailRecoverAccount(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "EmailRecoverAccount{" +
                       "email='" + email + '\'' +
                       '}';
    }
}