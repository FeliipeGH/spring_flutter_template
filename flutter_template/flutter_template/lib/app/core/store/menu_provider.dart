import 'package:flutter/material.dart';
import 'package:flutter_template/app/core/constants/menu_constants.dart';

class MenuProvider with ChangeNotifier{
  double _menuWidth=MenuConstants.menuOpen;

  double get getMenuWidth => _menuWidth;
  set setMenuWidth(double value) {
    _menuWidth = value;
  }
}