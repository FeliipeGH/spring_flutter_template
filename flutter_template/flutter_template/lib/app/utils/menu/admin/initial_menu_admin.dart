import 'package:flutter/material.dart';
import 'package:flutter_template/app/routes/app_routes.dart';
import 'package:flutter_template/app/widgets/dialogs/exit_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/core/drawer/drawer_container.dart';
import 'package:flutter_template/app/core/drawer/item_model.dart';
import 'package:flutter_template/app/data/models/login/login_data.dart';
import 'package:flutter_template/app/theme/colors.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:websafe_svg/websafe_svg.dart';

class MenuSettingsAdmin {
  static final MenuSettingsAdmin _singleton = new MenuSettingsAdmin._internal();

  factory MenuSettingsAdmin() {
    return _singleton;
  }

  MenuSettingsAdmin._internal();

  void initialMenu(BuildContext context, LoginData loginData, {int index = 0}) {
    DrawerContainer()
      ..setListElements(listElement: [
        ItemModel(
          title: "Inicio",
          trailing: Icons.arrow_forward_ios,
          leading: FontAwesomeIcons.home,
          onTap: () {
            Get.toNamed(AppRoutes.ADMIN_HOME_PAGE);
          },
        ),
        ItemModel(
          title: "CRUD ejemplo",
          trailing: FontAwesomeIcons.userFriends,
          leading: FontAwesomeIcons.userFriends,
          onTap: () {
            Get.toNamed(AppRoutes.EXAMPLE_PAGE);
          },
        ),
        ItemModel(
          title: "Salir",
          trailing: Icons.exit_to_app_sharp,
          leading: Icons.exit_to_app_sharp,
          onTap: () {
            Get.dialog(ExitDialog(),);
          },
        ),
      ])
      ..setSelectedColor(selectedColor: MainColors.accentColor)
      ..setTitle(
          title: ListTile(
        leading: Text(
          "CI",
          style: MainTypography.headlineTextStyle.copyWith(fontSize: 14),
        ),
        title: Text(
          "Creative io :v",
          style: MainTypography.headlineTextStyle.copyWith(fontSize: 14),
        ),
      ))
      ..setProfile(
          profile: ListTile(
        onTap: () {
          Get.toNamed(AppRoutes.PROFILE_PAGE);
        },
        leading: CircleAvatar(
          child: WebsafeSvg.asset("assets/imgs/male.svg", fit: BoxFit.contain),
        ),
      ))
      ..setStringProfile(
          profile: loginData.user != null ? loginData.user.toUpperCase() : "");
  }
}
