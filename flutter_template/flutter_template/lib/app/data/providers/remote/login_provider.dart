import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_template/app/data/models/login/login_data.dart';
import 'package:flutter_template/app/data/models/login/sign_in_user.dart';
import 'package:flutter_template/app/data/repositories/local/local_auth_repository.dart';
import 'package:flutter_template/app/utils/constants/http_constants.dart';

class LoginProvider {
  final Dio _dio = Dio(BaseOptions(baseUrl: HttpConstants.ip));
  final LocalAuthRepository _localAuthRepository = LocalAuthRepository();

  Future<void> login(SignInUser signInUser) async {
    _dio.options.headers = {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
      //authorizationHeader:token, here not necessary login url allow all
    };
    final Response response = await _dio.post(HttpConstants.login,
        data: signInUserToJson(signInUser));
    LoginData loginData = loginDataFromJson(jsonEncode(response.data));
    loginData.token = "Bearer " + loginData.token;
    loginData.setUser(signInUser.userName);
    await _localAuthRepository.setLoginData(loginData);
  }
}
