import 'package:flutter/material.dart';

abstract class Fixable{
  List<Widget>getTitleFix();
  List<Widget>getBodyFix();
  int getActionsFlex();
  List<Widget>getBodyToMobile();
  int getId();
}