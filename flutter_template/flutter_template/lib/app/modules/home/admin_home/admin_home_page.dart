import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_template/app/modules/home/local_widgets/module_card.dart';
import 'package:flutter_template/app/routes/app_routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/core/main_container.dart';
import 'package:flutter_template/app/modules/home/admin_home/admin_home_controller.dart';
import 'package:flutter_template/app/theme/colors.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:flutter_template/app/widgets/content_widget/content_widget.dart';
import 'package:flutter_template/app/widgets/loding_widgets/loading_container.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminHomeController>(
        init: AdminHomeController(),
        builder: (AdminHomeController controller) => SafeArea(
              child: Obx(
                () => controller.isMenuLoading.value
                    ? LoadingContainer()
                    : MainContainer(
                        iconColor: Colors.white,
                        appBarBackgroundColor: MainColors.primaryColor,
                        textStyle: MainTypography.headlineSecondaryTextStyle
                            .copyWith(color: Colors.white),
                        showPopMenu: false,
                        title: "Dashboard",
                        showSearchBar: false,
                        backgroundColor: MainColors.backgroundColor,
                        content: _MainContent(),
                      ),
              ),
            ));
  }
}

class _MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
        width: double.infinity,
        child: GetBuilder<AdminHomeController>(
            builder: (AdminHomeController controller) => ContentWidget(
                  contain: Container(
                    margin: width > 719
                        ? EdgeInsets.only(
                            top: 24,
                          )
                        : EdgeInsets.symmetric(vertical: 8),
                    child: SingleChildScrollView(
                      child: Container(
                          margin: width > 719
                              ? EdgeInsets.symmetric(horizontal: 12)
                              : EdgeInsets.zero,
                          child: NewContent()),
                    ),
                  ),
                )));
  }
}

class NewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BootstrapContainer(
        fluid: true,
        children: <Widget>[
          BootstrapCol(
            sizes: 'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
            absoluteSizes: true,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: ModuleCard(
                tittle: "Perfil",
                subTittle: "Felipe",
                contextText: "Datos de usuario",
                mainIcon: FontAwesomeIcons.user,
                subIcon: FontAwesomeIcons.userCog,
                mainIconColor: Colors.blue[500],
                subIconColor: Colors.blue[700],
                onTap: () {
                  Get.toNamed(AppRoutes.PROFILE_PAGE);
                },
              ),
            ),
          ),
          BootstrapCol(
            sizes: 'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
            absoluteSizes: true,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: ModuleCard(
                tittle: "Usuarios",
                subTittle: "25",
                contextText: "Operaciones CRUD",
                mainIcon: FontAwesomeIcons.userFriends,
                subIcon: FontAwesomeIcons.usersCog,
                mainIconColor: Colors.green[500],
                subIconColor: Colors.green[700],
                onTap: () {
                  Get.toNamed(AppRoutes.EXAMPLE_PAGE);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
