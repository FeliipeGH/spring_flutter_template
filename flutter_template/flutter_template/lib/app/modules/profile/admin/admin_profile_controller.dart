import 'package:get/get.dart';
import 'package:flutter_template/app/utils/menu/admin/general_admin_menu_method.dart';


class AdminProfileController extends GetxController with GeneralAdminMenuMethod {
  @override
  void onReady() {
    this.loadAdminMenu();
  }
}
