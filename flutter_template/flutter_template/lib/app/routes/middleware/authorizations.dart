import 'package:flutter_template/app/routes/app_routes.dart';

class AuthorizationConstants{
  static const String ADMIN="ROLE_ADMIN";
  static const String USER="ROLE_USER";

  static const Map<String, String>MAP_AUTHORIZATIONS={
    AppRoutes.ADMIN_HOME_PAGE:ADMIN,
    AppRoutes.ADD_EDIT_PRODUCT:ADMIN,
    AppRoutes.EXAMPLE_PAGE:ADMIN,
    AppRoutes.PROFILE_PAGE:USER,
  };
}