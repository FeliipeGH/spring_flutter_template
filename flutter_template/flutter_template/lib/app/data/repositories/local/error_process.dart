import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/widgets/dialogs/error_dialog.dart';
import 'package:flutter_template/app/widgets/dialogs/warning_dialog.dart';

class ErrorProcess{
  void process(error) {
    if(error is DioError){
      Response<dynamic> errorResponse = error.response;
      int statusCode = errorResponse.statusCode;
      Map<String, dynamic>mapError=errorResponse.data;
      switch (statusCode) {
        case 400:
          Get.dialog(
              ErrorDialog(
                context: Get.context,
                title:"Error",
                msg: mapError["error"],
              ),
              barrierDismissible: false);
          break;
        case 401:
          Get.dialog(
            WarningDialog(
              context: Get.context,
              title: "Credenciales incorrectas",
              message:
              "El nombre de usuario o la contraseña proporcionados son incorrectos.",
            ),
            barrierDismissible: false,);
          break;
        default:
          Get.dialog(
              ErrorDialog(
                context: Get.context,
                title:"Error",
                msg: "Error inesperado",
              ),
              barrierDismissible: false);
          break;
      }
    }else{
      Get.dialog(
          ErrorDialog(
            context: Get.context,
            title:"Error",
            msg: "Error inesperado",
          ),
          barrierDismissible: false);
    }
  }
}