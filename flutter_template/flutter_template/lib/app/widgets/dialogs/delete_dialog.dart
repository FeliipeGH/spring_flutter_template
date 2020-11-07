import 'package:flutter_template/app/theme/colors.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:flutter_template/app/widgets/buttons/custom_flat_alert_button.dart';
import 'package:flutter_template/app/widgets/dialogs/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String message;
  final Function onDelete;

  const DeleteDialog(
      {Key key, this.context, this.title, this.message, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      titleText: title,
      titleStyle: MainTypography.headlineTextStyle,
      iconColor: MainColors.warningColor,
      messageText: message,
      messageStyle: MainTypography.headlineSecondaryTextStyle,
      icon: Icons.error,
      listActions: <Widget>[
        CustomAlertFlatButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context).pop(true);
          },
          title: "Cerrar",
          bgColor: Colors.black26,
          titleStyle:
              MainTypography.buttonTextStyle.copyWith(color: Colors.white),
        ),
        CustomAlertFlatButton(
          onPressed: onDelete,
          title: "Eliminar",
          bgColor: Colors.red,
          titleStyle:
              MainTypography.buttonTextStyle.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
