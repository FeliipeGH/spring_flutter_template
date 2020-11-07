import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:flutter_template/app/widgets/buttons/custom_flat_button.dart';
import 'package:flutter_template/app/widgets/inputs/input_item.dart';

class ChangePassword extends StatelessWidget {
  final bool isWeb;

  const ChangePassword({Key key, this.isWeb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double hypotenuse = sqrt(pow(width, 2) + pow(height, 2));

    return AlertDialog(
      title: Text(
        'Actualizar contraseña',
        style: MainTypography.headlineSecondaryTextStyle
            .copyWith(fontWeight: FontWeight.bold),
      ),
      content: Container(
        width: isWeb ? hypotenuse * (1 / 3) : MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 8),
                  child: InputItem(
                    icon: Icons.lock,
                    textInputAction: TextInputAction.next,
                    hintText: "Contraseña",
                    labelText: "Contraseña",
                    helperText: "Ingresa tu actual contraseña",
                    //dataString: profileDataProvider.getCurrentPassword.value,
                    //errorText: profileDataProvider.getCurrentPassword.error,
                    /*sufixIcon: InkWell(
                      child: Icon(
                        profileDataProvider.getCurrentPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onTap: () {
                        profileDataProvider.setCurrentPasswordVisible(
                            !profileDataProvider.getCurrentPasswordVisible);
                      },
                    ),*/
                    //psVisible: profileDataProvider.getCurrentPasswordVisible,
                    onChanged: (value) {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 8),
                  child: InputItem(
                    icon: Icons.lock,
                    textInputAction: TextInputAction.next,
                    hintText: "Nueva contraseña",
                    labelText: "Nueva contraseña",
                    helperText: "Ingresa la nueva contraseña",
/*                    dataString: profileDataProvider.getPassword.value,
                    errorText: profileDataProvider.getPassword.error,*/
                    /*sufixIcon: InkWell(
                      child: Icon(
                        profileDataProvider.getPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onTap: () {
                        profileDataProvider.setPasswordVisible(
                            !profileDataProvider.getPasswordVisible);
                      },
                    ),*/
                    //psVisible: profileDataProvider.getPasswordVisible,
                    onChanged: (value) {
//                      profileDataProvider.setPassword(value);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 8),
                  child: InputItem(
                    icon: Icons.lock,
                    textInputAction: TextInputAction.next,
                    hintText: "Repite la nueva contraseña",
                    labelText: "Repite la nueva contraseña",
                    helperText: "Repite la nueva contraseña",
                    //dataString: profileDataProvider.getRepeatPassword.value,
                    //errorText: profileDataProvider.getRepeatPassword.error,
                    /*sufixIcon: InkWell(
                      child: Icon(
                        profileDataProvider.getPasswordRepeatVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onTap: () {
                        profileDataProvider.setPasswordRepeatVisible(
                            !profileDataProvider.getPasswordRepeatVisible);
                      },
                    ),*/
                    //psVisible: profileDataProvider.getPasswordRepeatVisible,
                    onChanged: (value) {
                      //profileDataProvider.setPasswordRepeat(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        CustomFlatButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context).pop(true);
          },
          title: "Cancelar",
          bgColor: Colors.black26,
          titleStyle: MainTypography.buttonTextStyle,
        ),
        CustomFlatButton(
          onPressed: () {},
          title: "Actualizar",
          bgColor: Colors.red,
          titleStyle:
              MainTypography.buttonTextStyle.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
