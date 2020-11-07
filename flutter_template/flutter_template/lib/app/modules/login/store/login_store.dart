import 'package:flutter_template/app/data/models/login/sign_in_user.dart';

class LoginDataStore {
  LoginDataStore._privateConstructor(){
    signInUser=SignInUser(userName: null, password: null);
  }

  static final LoginDataStore _instance = LoginDataStore._privateConstructor();

  factory LoginDataStore() {
    return _instance;
  }
  SignInUser signInUser=SignInUser(userName: null, password: null);

  void cleanAllData(){
    signInUser=SignInUser(userName: null, password: null);
  }

  @override
  String toString() {
    return 'LoginDataStore{signInUser: $signInUser}';
  }
}
