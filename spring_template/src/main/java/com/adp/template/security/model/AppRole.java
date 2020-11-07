package com.adp.template.security.model;

import com.adp.template.security.enums.RoleEnum;
import com.sun.istack.NotNull;

import javax.persistence.*;

@Entity
public class AppRole {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "roleId", nullable = false)
    private Long roleId;

    @NotNull
    @Enumerated(EnumType.STRING)
    private RoleEnum roleName;

    public AppRole() {
    }

    public AppRole(RoleEnum roleName) {
        this.roleName = roleName;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public RoleEnum getRoleName() {
        return roleName;
    }

    public void setRoleName(RoleEnum roleName) {
        this.roleName = roleName;
    }
}