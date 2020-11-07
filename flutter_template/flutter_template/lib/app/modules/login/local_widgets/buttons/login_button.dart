import 'package:flutter/material.dart';
import 'package:flutter_template/app/modules/login/login_controller.dart';
import 'package:flutter_template/app/theme/colors.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:get/state_manager.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (LoginController controller) => Obx(() => RaisedButton(
          disabledColor: MainColors.primaryColor,
          onPressed: controller.login,
          padding: EdgeInsets.all(12),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: controller.isLoading.value
              ? CircularProgressIndicator(
            backgroundColor: MainColors.primaryColor,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
              : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Iniciar sesión",
              style: MainTypography.buttonTextStyle
                  .copyWith(color: Colors.white),
            ),
          ),
          color: MainColors.primaryColor,
        )));
  }
}