package com.adp.template.security.dto;

public class RecoverAccountCode {
    private String email,code,password;

    public RecoverAccountCode() {
    }

    public RecoverAccountCode(String email, String code, String password) {
        this.email = email;
        this.code = code;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "RecoverAccountCode{" +
                       "email='" + email + '\'' +
                       ", code='" + code + '\'' +
                       ", password='" + password + '\'' +
                       '}';
    }
}