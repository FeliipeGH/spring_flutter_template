package com.adp.template.security.controller;

import com.adp.template.security.dto.*;
import com.adp.template.security.jwt.JwtProvider;
import com.adp.template.security.model.AppUser;
import com.adp.template.security.service.AppUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@CrossOrigin
public class AuthController {

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private AppUserService appUserService;
    @Autowired
    JwtProvider jwtProvider;

    @PostMapping("/signUp")
    public ResponseEntity<?> singUp(@RequestBody SignUpUser signUpUser) {
        signUpUser.setPassword(passwordEncoder.encode(signUpUser.getPassword()));
        return appUserService.signUpUser(signUpUser);
    }

    @RequestMapping(method = RequestMethod.GET,value = "/checkToken")
    @CrossOrigin(origins = "*", methods = {RequestMethod.GET})
    public ResponseEntity<?> findAllCategories(){
        return new ResponseEntity<>(HttpStatus.OK);
    }

   /* @PostMapping("/checkEmail")
    public ResponseEntity<?> checkEmail(@RequestBody UserValid userValid) {
        return appUserService.checkEmail(userValid);
    }*/

  /*  @PostMapping("/generateCodeRecoverAccount")
    public ResponseEntity<?> generateCodeRecoverAccount(@RequestBody EmailRecoverAccount emailRecoverAccount) {
        return appUserService.generateCodeRecoverAccount(emailRecoverAccount);
    }*/

/*    @PostMapping("/updatePasswordRecoverAccount")
    public ResponseEntity<?> updatePasswordRecoverAccount(@RequestBody RecoverAccountCode recoverAccountCode) {
        recoverAccountCode.setPassword(passwordEncoder.encode(recoverAccountCode.getPassword()));
        return appUserService.recoverAccountUpdatePassword(recoverAccountCode);
    }*/

    @PostMapping("/signIn")
    public ResponseEntity<JwtDto> signIn(@RequestBody SignInUser signInUser) {
        Authentication authentication =
                authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                        signInUser.getUserName(), signInUser.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtProvider.generateToken(authentication);
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        AppUser aux = appUserService.findByUserName(userDetails.getUsername()).get();
        String gender=aux.getGender();
        JwtDto jwtDto = new JwtDto(jwt, userDetails.getUsername(), userDetails.getAuthorities(),gender);
        return new ResponseEntity<>(jwtDto, HttpStatus.OK);
    }
}