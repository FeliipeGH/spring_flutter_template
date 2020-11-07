import 'package:flutter/material.dart';
import 'package:flutter_template/app/data/models/login/login_data.dart';
import 'package:flutter_template/app/data/repositories/local/local_auth_repository.dart';
import 'package:flutter_template/app/utils/menu/admin/initial_menu_admin.dart';

Future<LoginData> loadAdminData(BuildContext context) async {
  final LocalAuthRepository _loginRepository = LocalAuthRepository();
  LoginData loginData = await _loginRepository.getLoginData();
  if (loginData != null) {
    MenuSettingsAdmin menuSettingsAdmin = MenuSettingsAdmin();
    menuSettingsAdmin.initialMenu(context, loginData);
  }
  return loginData;
}
