import 'package:flutter/material.dart';
import 'package:flutter_template/app/core/main_container.dart';
import 'package:flutter_template/app/modules/example_crud/add_edit/add_edit_controller.dart';
import 'package:flutter_template/app/theme/colors.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:flutter_template/app/widgets/content_widget/content_widget.dart';
import 'package:flutter_template/app/widgets/loding_widgets/loading_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AddEditController(),
        builder: (AddEditController controller) => SafeArea(
              child: Obx(() => controller.isMenuLoading.value
                  ? LoadingContainer()
                  : MainContainer(
                      floatingActionButton: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(FontAwesomeIcons.plus),
                      ),
                      iconColor: Colors.white,
                      appBarBackgroundColor: MainColors.primaryColor,
                      textStyle: MainTypography.headlineSecondaryTextStyle
                          .copyWith(color: Colors.white),
                      showPopMenu: false,
                      title: "Registrar",
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
    return ContentWidget(contain: Container());
  }
}
