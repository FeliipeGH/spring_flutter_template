package com.adp.template.security.service;

import com.adp.template.security.enums.RoleEnum;
import com.adp.template.security.model.AppRole;
import com.adp.template.security.repository.AppRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
@Transactional
public class AppRoleService {
    @Autowired
    private AppRoleRepository appRoleRepository;

    public Optional<AppRole>getByRoleName(RoleEnum roleEnum){
        return appRoleRepository.findByRoleName(roleEnum);
    }

    public void save(AppRole appRole){
        appRoleRepository.save(appRole);
    }

}