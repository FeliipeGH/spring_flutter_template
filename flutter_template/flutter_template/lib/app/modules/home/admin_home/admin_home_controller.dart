import 'package:flutter_template/app/core/general_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/utils/menu/admin/general_admin_menu_method.dart';

class AdminHomeController extends GetxController
    with GeneralAdminMenuMethod, GeneralController {
  @override
  void onReady() {
    this.loadAdminMenu();
  }

  @override
  void onInit() {
    validateAutoRotate();
  }
}
