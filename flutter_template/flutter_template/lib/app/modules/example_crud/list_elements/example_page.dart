import 'package:flutter/material.dart';
import 'package:flutter_template/app/core/main_container.dart';
import 'package:flutter_template/app/data/models/example/example_model.dart';
import 'package:flutter_template/app/modules/example_crud/add_edit/add_edit_page.dart';
import 'package:flutter_template/app/modules/example_crud/list_elements/example_controller.dart';
import 'package:flutter_template/app/routes/app_routes.dart';
import 'package:flutter_template/app/theme/colors.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:flutter_template/app/widgets/content_widget/content_widget.dart';
import 'package:flutter_template/app/widgets/tables/custom_table.dart';
import 'package:flutter_template/app/widgets/titles/list_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/widgets/loding_widgets/loading_container.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ExampleController(),
        builder: (ExampleController controller) => SafeArea(
              child: Obx(() => controller.isMenuLoading.value
                  ? LoadingContainer()
                  : MainContainer(
                      floatingActionButton: FloatingActionButton(
                        onPressed: () {
                          Get.off(AddEditPage(),
                              transition: Transition.noTransition);
                        },
                        child: Icon(FontAwesomeIcons.plus),
                      ),
                      iconColor: Colors.white,
                      appBarBackgroundColor: MainColors.primaryColor,
                      textStyle: MainTypography.headlineSecondaryTextStyle
                          .copyWith(color: Colors.white),
                      showPopMenu: false,
                      title: "CRUD ejemplo",
                      showSearchBar: false,
                      backgroundColor: MainColors.backgroundColor,
                      content: _MainContent(),
                      index: 1,
                    )),
            ));
  }
}

class _MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ExampleController(),
      builder: (ExampleController controller) => ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
        return ContentWidget(
          contain: Container(
            margin: sizingInformation.isMobile
                ? EdgeInsets.all(8)
                : EdgeInsets.only(top: 18, right: 18, left: 18),
            child: Column(
              children: [
                if (!sizingInformation.isMobile)
                  ListTitle(
                    isMobile: sizingInformation.isMobile,
                    bgColor: MainColors.firstCardColor,
                    tittle: "Lista de elementos",
                    buttonTittle: "Agregar",
                    onAddButton: () {
                      Get.off(AddEditPage(),
                          transition: Transition.noTransition);
                    },
                  ),
                CustomTable(
                  isMobile: sizingInformation.isMobile,
                  iconBgColor: MainColors.thirdCardColor,
                  dataList: exampleList,
                  allowDelete: true,
                  allowEdit: true,
                  onDelete: (int id) {
                    controller.deleteProduct(id);
                  },
                  widgetIconMobile: Icon(FontAwesomeIcons.table),
                  editPage: AppRoutes.ADD_EDIT_PRODUCT,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
