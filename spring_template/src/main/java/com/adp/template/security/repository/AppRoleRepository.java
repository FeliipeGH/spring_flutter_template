package com.adp.template.security.repository;

import com.adp.template.security.enums.RoleEnum;
import com.adp.template.security.model.AppRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AppRoleRepository extends JpaRepository<AppRole, Long> {
    Optional<AppRole>findByRoleName(RoleEnum rolEnum);
}