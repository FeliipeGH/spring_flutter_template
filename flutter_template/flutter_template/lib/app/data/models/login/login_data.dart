import 'dart:convert';

import 'package:flutter_template/app/data/models/login/authority_model.dart';
import 'package:json_annotation/json_annotation.dart';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

@JsonSerializable()
class LoginData {
  String token;
  String user;
  String gender;
  List<AuthorityModel> authorities;

  LoginData({this.token, this.user, this.gender, this.authorities});

  void setToken(String value) {
    token = value;
  }

  void setUser(String value) {
    user = value;
  }

  void setGender(String value) {
    gender = value;
  }

  void cleanAllData() {
    token = null;
    user = null;
    gender = null;
  }

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    token: json["token"],
    user: json["user"],
    gender: json["gender"],
    authorities: List<AuthorityModel>.from(json["authorities"].map((x) => AuthorityModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user,
    "gender": gender,
    "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'LoginData{token: $token, user: $user, gender: $gender, authorities: $authorities}';
  }
}
