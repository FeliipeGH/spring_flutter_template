import 'package:flutter/material.dart';
import 'package:flutter_template/app/modules/login/local_widgets/form/login_data_container.dart';
import 'package:flutter_template/app/widgets/image_containers/svg_container.dart';
import 'package:flutter_template/app/theme/colors.dart';
import 'dart:math';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width < 500 ? LoginMobile() : LoginTabletDesktop();
  }
}

class LoginMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double topHeight = height * (1 / 3);
    return Scaffold(
      backgroundColor: MainColors.background,
      body: Stack(
        children: [
          ImageWrapper(
            name: "assets/imgs/login.svg",
            height: topHeight,
            width: double.infinity,
          ),
          LoginDataContainer(
            topHeight: topHeight,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

class LoginTabletDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double hypotenuse = sqrt(pow(width, 2) + pow(height, 2));
    return Scaffold(
      body: Container(
        color: MainColors.background,
        child: Row(
          children: [
            Center(
              child: ImageWrapper(
                name: "assets/imgs/login.svg",
                height: hypotenuse / 3,
                width: width * (4 / 8),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * (1 / 16), right: width * (1 / 16)),
              child: LoginDataContainer(
                topHeight: 30,
                width: width * (3 / 8),
              ),
            )
          ],
        ),
      ),
    );
  }
}