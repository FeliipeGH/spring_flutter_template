package com.adp.template.model;

import javax.persistence.*;

@Entity
public class EmailSendModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "emailSendModelId", nullable = false)
    private Long emailSendModelId;

    @Column(name = "email", length = 250, nullable = false)
    private String email;

    @Column(name = "code", length = 250, nullable = false)
    private String code;

    public EmailSendModel() {
    }

    public EmailSendModel(String email, String code) {
        this.email = email;
        this.code = code;
    }

    public Long getEmailSendModelId() {
        return emailSendModelId;
    }

    public void setEmailSendModelId(Long emailSendModelId) {
        this.emailSendModelId = emailSendModelId;
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
}
