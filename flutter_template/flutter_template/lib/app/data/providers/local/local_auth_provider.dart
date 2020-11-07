import 'dart:convert';

import 'package:flutter_template/app/data/models/login/login_data.dart';
import 'package:glutton/glutton.dart';
import 'package:flutter_template/app/utils/constants/local_storage_constants.dart';

class LocalAuthProvider {
  Future<void> setLoginData(LoginData loginData) async {
    await Glutton.eat(
        LocalStorageConstants.loginData, loginDataToJson(loginData));
  }

  Future<LoginData> getLoginData() async {
    String data = await Glutton.vomit(LocalStorageConstants.loginData);
    if (data != null) {
      return loginDataFromJson(data);
    }
    return null;
  }

  Future<void> cleanAllData() async {
    await Glutton.flush();
  }
}
