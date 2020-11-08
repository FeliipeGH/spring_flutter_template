import 'package:flutter/services.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GeneralController{

  void initConfig(){
    calculateGutterSize();
    validateAutoRotate();
  }

  void calculateGutterSize(){
    final BuildContext context=Get.context;
    final double width=MediaQuery.of(context).size.width;
    bootstrapGridParameters(
      gutterSize: width>719?24:16,
    );
    bootstrapPrefixBasedOnWidth(0);

  }

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