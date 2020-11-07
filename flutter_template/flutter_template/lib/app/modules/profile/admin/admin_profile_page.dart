import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/widgets/image_containers/svg_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_template/app/core/main_container.dart';
import 'package:flutter_template/app/modules/profile/admin/admin_profile_controller.dart';
import 'package:flutter_template/app/modules/profile/local_widgets/change_password.dart';
import 'package:flutter_template/app/theme/colors.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:flutter_template/app/widgets/decorations/title_box_decoration.dart';
import 'package:flutter_template/app/widgets/loding_widgets/loading_container.dart';
import 'package:flutter_template/app/widgets/separators/separator_profile.dart';

class AdminProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AdminProfileController(),
        builder: (AdminProfileController controller) => SafeArea(
              child: Obx(() => controller.isMenuLoading.value
                  ? LoadingContainer()
                  : MainContainer(
                      iconColor: Colors.white,
                      appBarBackgroundColor: MainColors.primaryColor,
                      textStyle: MainTypography.headlineSecondaryTextStyle
                          .copyWith(color: Colors.white),
                      showPopMenu: false,
                      title: "Perfil",
                      showSearchBar: false,
                      backgroundColor: MainColors.backgroundColor,
                      content: _MainContent(),
                      index: -1,
                    )),
            ));
  }
}

class _MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
          return sizingInformation.isMobile
              ? MobileContainer()
              : WebContainer();
        },
      ),
    );
  }
}

class WebContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: ImageContainer()),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: DataContainer(
                isMobile: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(top: 24),
        decoration: titleBoxDecoration,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageWrapper(
                name: "assets/imgs/male.svg",
                height: 200,
                width: double.infinity,
              ),
              SizedBox(
                height: 4,
              ),
              Flexible(
                child: Text(
                  "Felipe",
                  style: MainTypography.headlineSecondaryTextStyle,
                  overflow: TextOverflow.visible,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Flexible(
                child: Text(
                  "Administrador",
                  style: MainTypography.subtitleTextStyle,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataContainer extends StatelessWidget {
  final bool isMobile;

  const DataContainer({Key key, @required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(
          top: 24,
        ),
        decoration: titleBoxDecoration,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Nombre",
                        style: MainTypography.subtitleTextStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          "Felipe Guadarrama Herrera",
                          style: MainTypography.subtitleTextStyle,
                        )),
                  ],
                ),
              ),
              SeparatorProfile(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Correo",
                      style: MainTypography.subtitleTextStyle
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(
                        flex: 2,
                        child: Text(
                          "fguadarrama@gmail.com",
                          style: MainTypography.subtitleTextStyle,
                        )),
                  ],
                ),
              ),
              SeparatorProfile(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Usuario",
                      style: MainTypography.subtitleTextStyle
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(
                        flex: 2,
                        child: Text(
                          "Felipe",
                          style: MainTypography.subtitleTextStyle,
                        )),
                  ],
                ),
              ),
              SeparatorProfile(),
              InkWell(
                onTap: () {
                  Get.dialog(ChangePassword(isWeb: !isMobile),
                      barrierDismissible: false);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Contraseña",
                        style: MainTypography.subtitleTextStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                        child: Text(
                          "*******",
                          style: MainTypography.subtitleTextStyle,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            FontAwesomeIcons.edit,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: ImageContainer()),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: DataContainer(
              isMobile: true,
            ),
          )
        ],
      ),
    );
  }
}
