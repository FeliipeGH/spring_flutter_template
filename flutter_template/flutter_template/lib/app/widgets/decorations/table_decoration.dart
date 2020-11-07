import 'package:flutter/material.dart';

final Decoration tableDecoration=BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10)
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 3,
      offset: Offset(0, 2), // changes position of shadow
    ),
  ],
);

Decoration getTableIconCardDecoration(Color color){
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(7),
        topRight: Radius.circular(7),
        bottomLeft: Radius.circular(7),
        bottomRight: Radius.circular(7)
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 2,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  );
}
