import 'package:flutter_template/app/data/models/login/login_data.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/utils/menu/admin/load_admin_menu_data.dart';


class GeneralAdminMenuMethod{
  RxBool isMenuLoading=true.obs;
  LoginData loginData;

  void loadAdminMenu(){
    loadAdminData(Get.context).then((LoginData loginData) => {
      this.loginData=loginData,
      isMenuLoading.value=false,
    });
  }
}