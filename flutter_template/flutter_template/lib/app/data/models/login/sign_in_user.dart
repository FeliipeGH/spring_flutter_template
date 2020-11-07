import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/data/models/login/sign_in_user_rx.dart';

SignInUser signInUserFromJson(String str) =>
    SignInUser.fromJson(json.decode(str));

String signInUserToJson(SignInUser data) => json.encode(data.toJson());

class SignInUser {
  SignInUser({
    @required this.userName,
    @required this.password,
  });

  String userName;
  String password;
  SignInUserRx signInUserRx = SignInUserRx();

  String getUserName() => userName != null ? userName : "";

  String getPassword() => password != null ? password : "";

  void setUserName(String userName) {
    this.userName = userName;
    if (userName.isNotEmpty && userName.length > 3) {
      signInUserRx.userNameError.value = null;
    } else {
      signInUserRx.userNameError.value = "Ingrese un nombre valido";
    }
  }

  void setPassword(String password) {
    this.password = password;
    if (password.isNotEmpty && password.length > 3) {
      //todo valid strongPassword
      signInUserRx.passwordError.value = null;
    } else {
      signInUserRx.passwordError.value = "Ingrese una contraseña valida";
    }
  }

  factory SignInUser.fromJson(Map<String, dynamic> json) => SignInUser(
        userName: json["userName"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
      };

  bool isValid() =>
      signInUserRx.userNameError.value == null &&
      signInUserRx.passwordError.value == null;

  @override
  String toString() {
    return 'SignInUser{userName: $userName, password: $password, _signInUserRx: $signInUserRx}';
  }
}
