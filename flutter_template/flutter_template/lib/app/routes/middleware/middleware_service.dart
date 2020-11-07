import 'package:flutter_template/app/data/models/login/login_data.dart';
import 'package:flutter_template/app/data/providers/local/local_auth_provider.dart';
import 'package:flutter_template/app/routes/app_routes.dart';
import 'package:flutter_template/app/routes/middleware/end_point_auth.dart';
import 'package:get/get.dart';

void routingCallback(Routing routing) async {
  if (routing.current != AppRoutes.LOGIN_PAGE) {
    //if current page doesn't need login, make condition then else the next code
    LocalAuthProvider localAuthProvider = LocalAuthProvider();
    LoginData loginData = await localAuthProvider.getLoginData();
    if (loginData == null) {
      Get.offNamedUntil(AppRoutes.LOGIN_PAGE, (route) => false);
    } else {
      EndPointAuth endPointAuth = EndPointAuth();
      bool tokenIsAlive = await endPointAuth.checkTokenIsAlive(loginData.token);
      //check if token is alive
      if (!tokenIsAlive) {
        //isn't
        Get.offNamedUntil(AppRoutes.LOGIN_PAGE, (route) => false);
      } else {
        bool userHasAuthorization = endPointAuth.checkAuthorization(
            loginData.authorities, routing.current);
        if (!userHasAuthorization) {
          //check if authorization -> go to destination page, otherwise go to not auth
          Get.offNamed(AppRoutes.NOT_AUTH_PAGE);
        }
      }
    }
  }
}