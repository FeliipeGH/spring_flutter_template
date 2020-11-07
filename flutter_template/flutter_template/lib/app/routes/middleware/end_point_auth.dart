import 'package:dio/dio.dart';
import 'package:flutter_template/app/data/models/login/authority_model.dart';
import 'package:flutter_template/app/data/repositories/local/local_auth_repository.dart';
import 'package:flutter_template/app/routes/middleware/authorizations.dart';
import 'package:flutter_template/app/utils/constants/http_constants.dart';
import 'dart:io';
class EndPointAuth {
  Dio _dio;
  LocalAuthRepository _localAuthRepository;

  EndPointAuth._privateConstructor() {
    if (_dio == null && _localAuthRepository == null) {
      _dio = Dio(BaseOptions(baseUrl: HttpConstants.ip));
      _localAuthRepository = LocalAuthRepository();
    }
  }

  static final EndPointAuth _instance = EndPointAuth._privateConstructor();

  factory EndPointAuth() {
    return _instance;
  }

  Future<bool> checkTokenIsAlive(String token) async{
    try{
      _dio.options.headers = {
        HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        HttpHeaders.authorizationHeader:token,
      };
      await _dio.get(HttpConstants.checkToken,);
      return true;
    }catch(e){
      return false;
    }
  }

  bool checkAuthorization(List<AuthorityModel> listAuth,String page) {
    String roleRequest=AuthorizationConstants.MAP_AUTHORIZATIONS[page];
    return hasRole(listAuth, roleRequest);
  }
  bool hasRole(List<AuthorityModel> listAuth, String role){
    for(int i=0; i<listAuth.length; i++){
      if(listAuth[i].authority==role)return true;
    }
    return false;
  }
}
