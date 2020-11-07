import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/routes/app_routes.dart';
import 'package:flutter_template/app/widgets/titles/custom_tittle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/core/main_container.dart';
import 'package:flutter_template/app/modules/home/admin_home/admin_home_controller.dart';
import 'package:flutter_template/app/modules/home/local_widgets/custom_card.dart';
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
                        title: "Inicio",
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
                    margin: EdgeInsets.only(top: 18, right: 18, left: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTittle(
                          tittle: "Módulos",
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Wrap(
                          children: [
                            Padding(
                              padding: width < 500
                                  ? EdgeInsets.only(right: 4)
                                  : EdgeInsets.all(8.0),
                              child: CustomCard(
                                isMobile: width < 500,
                                iconBgColor: MainColors.firstCardColor,
                                cardTitle: 'Perfil',
                                icon: FontAwesomeIcons.userAlt,
                                subText: 'Información personal',
                                mainText: '',
                                iconColor: Colors.white,
                                onTap: () {
                                  Get.toNamed(AppRoutes.PROFILE_PAGE);
                                },
                              ),
                            ),
                            Padding(
                              padding: width < 500
                                  ? EdgeInsets.zero
                                  : EdgeInsets.all(8.0),
                              child: CustomCard(
                                isMobile: width < 500,
                                iconBgColor: MainColors.secondCardColor,
                                cardTitle: 'CRUD',
                                icon: FontAwesomeIcons.userFriends,
                                subText: 'Datos generales',
                                mainText: '',
                                iconColor: Colors.white,
                                onTap: () {
                                  Get.toNamed(AppRoutes.EXAMPLE_PAGE);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        CustomTittle(
                          tittle: "Otros módulos",
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
