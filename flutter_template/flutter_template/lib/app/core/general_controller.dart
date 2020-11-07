import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GeneralController{
  void validateAutoRotate(){
    BuildContext context=Get.context;
    if(!context.isTablet){
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }
}