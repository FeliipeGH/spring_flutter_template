import 'package:flutter/material.dart';
import 'package:flutter_template/app/theme/typography.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        /*    Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: RecoverPasswordPage(),
            ));*/
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      padding: EdgeInsets.all(18),
      child: Text("Olvidaste tu contraseña?",
          style: MainTypography.buttonTextStyle),
    );
  }
}