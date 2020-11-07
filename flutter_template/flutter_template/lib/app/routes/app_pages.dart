import 'package:flutter_template/app/modules/example_crud/add_edit/add_edit_page.dart';
import 'package:flutter_template/app/modules/example_crud/list_elements/example_page.dart';
import 'package:flutter_template/app/modules/home/admin_home/admin_home_page.dart';
import 'package:flutter_template/app/modules/login/login_page.dart';
import 'package:flutter_template/app/modules/not_auth/not_found_page.dart';
import 'package:flutter_template/app/modules/profile/admin/admin_profile_page.dart';
import 'package:flutter_template/app/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.LOGIN_PAGE,
        page: () => LoginPage(),
        transition: Transition.noTransition,),
    GetPage(
      name: AppRoutes.NOT_AUTH_PAGE,
      page: () => NotAuthPage(),
      transition: Transition.noTransition,),
    GetPage(
        name: AppRoutes.ADMIN_HOME_PAGE,
        page: () => AdminHomePage(),
        transition: Transition.noTransition),
    GetPage(
        name: AppRoutes.EXAMPLE_PAGE,
        page: () => ExamplePage(),
        transition: Transition.noTransition),
    GetPage(
        name: AppRoutes.ADD_EDIT_PRODUCT,
        page: () => AddEditPage(),
        transition: Transition.noTransition),
    GetPage(
        name: AppRoutes.PROFILE_PAGE,
        page: () => AdminProfilePage(),
        transition: Transition.noTransition),
  ];
}
