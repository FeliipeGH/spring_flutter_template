import 'package:flutter/material.dart';
import 'package:flutter_template/app/modules/login/local_widgets/buttons/forgot_password_button.dart';
import 'package:flutter_template/app/modules/login/local_widgets/buttons/get_it_button.dart';
import 'package:flutter_template/app/modules/login/local_widgets/buttons/login_button.dart';
import 'package:flutter_template/app/modules/login/local_widgets/buttons/sign_up_button.dart';
import 'package:flutter_template/app/modules/login/login_controller.dart';
import 'package:flutter_template/app/theme/colors.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:flutter_template/app/widgets/inputs/input_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginDataContainer extends StatelessWidget {
  final double topHeight;
  final double width;

  LoginDataContainer({Key key, this.topHeight, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: topHeight - 30),
                child: Container(
                  width: width,
                  //height:height*(2/3)+30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                    color: MainColors.background,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                          margin: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "Bienvenido",
                                      style: MainTypography.headlineTextStyle,
                                    ),
                                  ),
                                  Center(
                                    child: Text("Ingresa a tu cuenta",
                                        style: MainTypography
                                            .headlineSecondaryTextStyle),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 2),
                                      child: Obx(() => InputItem(
                                            dataString: controller
                                                .loginDataStore.signInUser
                                                .getUserName(),
                                            icon: Icons.account_circle,
                                            hintText: "Usuario",
                                            labelText: "Usuario",
                                            helperText: "Ingresa tu usuario",
                                            onChanged:
                                                controller.onUserNameChange,
                                            errorText: controller.loginDataStore
                                                .signInUser.signInUserRx
                                                .userNameErrorAsString(),
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 2),
                                      child: Obx(() => InputItem(
                                            dataString: controller
                                                .loginDataStore.signInUser
                                                .getPassword(),
                                            icon: Icons.lock,
                                            textInputAction:
                                                TextInputAction.done,
                                            hintText: "Contraseña",
                                            labelText: "Contraseña",
                                            helperText: "Ingresa tu contraseña",
                                            errorText: controller.loginDataStore
                                                .signInUser.signInUserRx
                                                .passwordErrorAsString(),
                                            onChanged:
                                                controller.onPasswordChange,
                                            sufixIcon: InkWell(
                                              child: Icon(
                                                controller
                                                        .loginDataStore
                                                        .signInUser
                                                        .signInUserRx
                                                        .passwordVisible
                                                        .value
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.black,
                                              ),
                                              onTap: () {
                                                controller
                                                        .loginDataStore
                                                        .signInUser
                                                        .signInUserRx
                                                        .passwordVisible
                                                        .value =
                                                    !controller
                                                        .loginDataStore
                                                        .signInUser
                                                        .signInUserRx
                                                        .passwordVisible
                                                        .value;
                                              },
                                            ),
                                            psVisible: controller
                                                .loginDataStore
                                                .signInUser
                                                .signInUserRx
                                                .passwordVisible
                                                .value,
                                          )),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 16),
                                      width: double.infinity,
                                      child: LoginButton(),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 16),
                                      width: double.infinity,
                                      child: ForgotPassword(),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 4),
                                      width: double.infinity,
                                      child: SignUp(),
                                    ),
                                    if (kIsWeb)
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Wrap(
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GetIt(
                                              icon: FontAwesomeIcons.apple,
                                              title: "App Store",
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            GetIt(
                                              icon: FontAwesomeIcons.googlePlay,
                                              title: "Google Play",
                                            ),
                                          ],
                                        ),
                                      )
                                  ],
                                ),
                              )
                            ],
                          ))),
                ),
              ),
            ));
  }
}
