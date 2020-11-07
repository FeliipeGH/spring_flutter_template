import 'package:flutter/material.dart';

class ItemModel {
  String title;
  IconData trailing;
  IconData leading;
  Function onTap;

  ItemModel({this.title, this.trailing, this.leading,this.onTap});
}
