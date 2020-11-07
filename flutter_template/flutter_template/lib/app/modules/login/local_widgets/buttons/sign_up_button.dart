import 'package:flutter/material.dart';
import 'package:flutter_template/app/theme/colors.dart';
import 'package:flutter_template/app/theme/typography.dart';


class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(18),
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Wrap(
        children: [
          Text("No tienes cuenta?", style: MainTypography.buttonTextStyle),
          SizedBox(
            width: 3,
          ),
          Text("Registrate",
              style: MainTypography.buttonTextStyle
                  .copyWith(color: MainColors.primaryColor))
        ],
      ),
    );
  }
}
