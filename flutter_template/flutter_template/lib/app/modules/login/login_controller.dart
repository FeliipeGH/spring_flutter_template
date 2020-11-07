import 'package:flutter/material.dart';
import 'package:flutter_template/app/core/general_controller.dart';
import 'package:flutter_template/app/modules/login/store/login_store.dart';
import 'package:flutter_template/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/data/repositories/local/error_process.dart';
import 'package:flutter_template/app/data/repositories/remote/login_repository.dart';
import 'package:flutter_template/app/theme/colors.dart';

class LoginController extends GetxController with GeneralController {
  final LoginRepository _loginRepository = LoginRepository();
  final ErrorProcess _errorProcess = ErrorProcess();
  final LoginDataStore loginDataStore = LoginDataStore();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    validateAutoRotate();
  }

  void login() async {
    if (loginDataStore.signInUser.isValid()) {
      try {
        isLoading.value = true;
        await _loginRepository.login(loginDataStore.signInUser);
        isLoading.value = false;
        Get.toNamed(
          AppRoutes.ADMIN_HOME_PAGE,
        );
        loginDataStore.cleanAllData();
      } catch (e) {
        isLoading.value = false;
        _errorProcess.process(e);
      }
    } else {
      Get.snackbar(
        "Error",
        "¡Ingrese los datos solicitados correctamente!",
        backgroundColor: MainColors.warningColor,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        animationDuration: Duration(seconds: 1),
        margin: EdgeInsets.all(8),
      );
    }
  }

  void onUserNameChange(String text) {
    loginDataStore.signInUser.setUserName(text);
  }

  void onPasswordChange(String text) {
    loginDataStore.signInUser.setPassword(text);
  }
}
