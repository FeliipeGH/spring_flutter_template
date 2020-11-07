package com.adp.template.security.repository;

import com.adp.template.security.model.AppUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AppUserRepository extends JpaRepository<AppUser, Long> {
    Optional<AppUser>findByUserName(String userName);
    AppUser findByEmail(String email);
    boolean existsByUserName(String userName);
    boolean existsByEmail(String email);
}