package com.adp.template.security.service;

import com.adp.template.dto.Message;
import com.adp.template.model.EmailSendModel;
import com.adp.template.security.dto.EmailRecoverAccount;
import com.adp.template.security.dto.RecoverAccountCode;
import com.adp.template.security.dto.SignUpUser;
import com.adp.template.security.dto.UserValid;
import com.adp.template.security.enums.RoleEnum;
import com.adp.template.security.model.AppRole;
import com.adp.template.security.model.AppUser;
import com.adp.template.security.repository.AppUserRepository;
import com.adp.template.services.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;

@Service
@Transactional
public class AppUserService {
    @Autowired
    private AppUserRepository appUserRepository;
    @Autowired
    private AppRoleService appRoleService;
    @Autowired
    private EmailService emailService;

    public Optional<AppUser> findByUserName(String userName) {
        return appUserRepository.findByUserName(userName);
    }

    public boolean existsByUserName(String userName) {
        return appUserRepository.existsByUserName(userName);
    }

    public boolean existsByEmail(String email) {
        return appUserRepository.existsByEmail(email);
    }

    public void save(AppUser appUser) {
        appUserRepository.save(appUser);
    }


    public ResponseEntity<?> signUpUser(SignUpUser signUpUser) {
        String userName = signUpUser.getUserName();
        String eMail = signUpUser.geteMail();

        //Prevenir que no se registre el usuario más de una vez, por si el usuario da clic más de una vez en registrar
        //Sino existe el correo en los registros se continua a realizar el registro
        if (appUserRepository.findByEmail(eMail) == null) {

       /*     //EmailSendModel emailSendModel = emailService.findByEmail(signUpUser.geteMail());
            if (emailSendModel == null) {
                return new ResponseEntity<>(new Message("El código ha caducado, favor de generarlo nuevamente."),
                        HttpStatus.BAD_REQUEST);
            }
            if (!signUpUser.getCode().equals(Objects.requireNonNull(emailSendModel).getCode())) {
                return new ResponseEntity<>(new Message("El código es incorrecto, favor de ingresarlo nuevamente."),
                        HttpStatus.BAD_REQUEST);
            }*/

            AppUser appUser = new AppUser();
            Set<AppRole> appRoles = new HashSet<>();
            appRoles.add(appRoleService.getByRoleName(RoleEnum.ROLE_USER).get());

            if (signUpUser.getRoles().contains("admin")) {
                appRoles.add(appRoleService.getByRoleName(RoleEnum.ROLE_ADMIN).get());
            }
            appUser.setUserRol(appRoles);


            Map<String, Object> params = new HashMap<>();
            params.put(
                    "email",
                    appUser.getEmail()
            );
            this.save(appUser);
            //emailService.deleteByEmail(signUpUser.geteMail());
        }

        return new ResponseEntity<>(new Message("Registrado"), HttpStatus.OK);
    }

/*    public ResponseEntity<?> generateCodeRecoverAccount(EmailRecoverAccount emailRecoverAccount) {
        String eMail = emailRecoverAccount.getEmail();
        if (appUserRepository.findByEmail(eMail) == null) {
            return new ResponseEntity<>(new Message("El correo no existe"), HttpStatus.BAD_REQUEST);
        }
        return emailService.sendEmailRecoverAccount(emailRecoverAccount);
    }*/

  /*  public ResponseEntity<?> recoverAccountUpdatePassword(RecoverAccountCode recoverAccountCode) {
        EmailSendModel emailSendModel = emailService.findByEmail(recoverAccountCode.getEmail());

        if (emailSendModel == null) {
            return new ResponseEntity<>(new Message("El código ha caducado, favor de generarlo nuevamente."),
                    HttpStatus.BAD_REQUEST);
        }

        if (!recoverAccountCode.getCode().equals(Objects.requireNonNull(emailSendModel).getCode())) {
            return new ResponseEntity<>(new Message("El código es incorrecto, favor de ingresarlo nuevamente."),
                    HttpStatus.BAD_REQUEST);
        }
        AppUser appUser = appUserRepository.findByEmail(emailSendModel.getEmail());
        appUser.setPassword(recoverAccountCode.getPassword());
        appUserRepository.save(appUser);
        emailService.deleteByEmail(recoverAccountCode.getEmail());
        return new ResponseEntity<>(HttpStatus.OK);
    }*/

/*
    public ResponseEntity<?> checkEmail(UserValid userValid) {
        return emailService.sendEmailRegister(userValid);
    }*/
}