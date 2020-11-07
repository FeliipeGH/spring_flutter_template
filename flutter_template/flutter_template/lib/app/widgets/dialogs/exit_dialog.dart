import 'package:flutter/material.dart';
import 'package:flutter_template/app/data/providers/local/local_auth_provider.dart';
import 'package:flutter_template/app/modules/login/local_widgets/buttons/get_it_button.dart';
import 'package:flutter_template/app/routes/app_routes.dart';
import 'package:flutter_template/app/theme/colors.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:flutter_template/app/widgets/buttons/custom_flat_button.dart';
import 'package:flutter_template/app/widgets/dialogs/custom_alert_dialog.dart';
import 'package:get/route_manager.dart';

class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      titleText: "Cerrar sesión",
      titleStyle: MainTypography.headlineTextStyle,
      iconColor: MainColors.warningColor,
      messageText: "¿Salir de la aplicación?",
      messageStyle: MainTypography.headlineSecondaryTextStyle,
      icon: Icons.exit_to_app,
      listActions: <Widget>[
        CustomFlatButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          title: "Cancelar",
          bgColor: Colors.black26,
          titleStyle: MainTypography.buttonTextStyle,
        ),
        CustomFlatButton(
          onPressed: () {
            Get.offNamedUntil(AppRoutes.LOGIN_PAGE, (route) => false);
            LocalAuthProvider localAuthProvider = LocalAuthProvider();
            localAuthProvider.cleanAllData();
          },
          title: "Continuar",
          bgColor: Colors.red,
          titleStyle:
              MainTypography.buttonTextStyle.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
